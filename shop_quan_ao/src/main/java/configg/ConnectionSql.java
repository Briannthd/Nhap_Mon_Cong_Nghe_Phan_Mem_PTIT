package configg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class ConnectionSql {

//    private String url = "jdbc:mysql://localhost:3306/webbanhangthoitrang";
	private String url = "jdbc:mysql://localhost:3306/shop_quan_ao";

    private String user = "root";
    private String password = "minh123@";
    private String driverClass = "com.mysql.cj.jdbc.Driver";

    private int poolSize = 5; // Số lượng kết nối tối đa trong pool
    private List<Connection> availableConnections = new LinkedList<>();
    private List<Connection> usedConnections = new LinkedList<>();
    private boolean isShuttingDown = false; // Trạng thái đang shutdown

    public ConnectionSql() throws SQLException {
        try {
            Class.forName(driverClass); // Đăng ký driver
            for (int i = 0; i < poolSize; i++) {
                availableConnections.add(createConnection());
            }
           System.out.println("Pool kết nối đã khởi tạo thành công với " + poolSize + " kết nối.");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Không tìm thấy Driver", e);
        }
    }

    // Tạo một kết nối mới
    private Connection createConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

    // Kiểm tra kết nối hợp lệ
    private boolean isValid(Connection connection) {
        try {
            return connection != null && !connection.isClosed() && connection.isValid(2); // 2 giây timeout
        } catch (SQLException e) {
            return false;
        }
    }

    // Lấy một kết nối từ pool
    public synchronized Connection getConnection() throws SQLException {
        if (isShuttingDown) {
            throw new SQLException("Connection pool đang được đóng!");
        }

        while (availableConnections.isEmpty()) {
            try {
                System.out.println("Đợi kết nối khả dụng...");
                wait(); // Chờ cho đến khi có kết nối
            } catch (InterruptedException e) {
                throw new SQLException("Thread bị gián đoạn khi chờ kết nối", e);
            }
        }

        Connection connection = availableConnections.remove(availableConnections.size() - 1);
        if (!isValid(connection)) {
            System.out.println("Kết nối không hợp lệ, tạo mới kết nối...");
            connection = createConnection();
        }
        usedConnections.add(connection);
        System.out.println("Lấy kết nối. Số lượng kết nối khả dụng: " + availableConnections.size());
        return connection;
    }

    // Trả kết nối lại vào pool
    public synchronized void releaseConnection(Connection connection) {
        try {
            if (connection == null || connection.isClosed()) {
                System.out.println("Kết nối không hợp lệ, tạo mới thay thế...");
                availableConnections.add(createConnection());
            } else {
                usedConnections.remove(connection);
                availableConnections.add(connection);
            }
            notifyAll(); // Thông báo các thread đang chờ
            System.out.println("Trả kết nối. Số lượng kết nối khả dụng: " + availableConnections.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Đóng tất cả các kết nối và giải phóng tài nguyên
    public synchronized void shutdown() throws SQLException {
        isShuttingDown = true; // Ngăn chặn nhận kết nối mới
        for (Connection connection : availableConnections) {
            connection.close();
        }
        for (Connection connection : usedConnections) {
            connection.close();
        }
        availableConnections.clear();
        usedConnections.clear();
        System.out.println("Đã đóng toàn bộ kết nối và giải phóng tài nguyên.");
    }
}
