package configg;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Connectionpool {
	private static final int INITIAL_POOL_SIZE = 5; // Số kết nối ban đầu
    private static final int MAX_POOL_SIZE = 10;    // Số kết nối tối đa
    private static final String DB_URL = "jdbc:mysql://localhost:3306/shop_quan_ao";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "minh123@";

    private final List<Connection> availableConnections = new ArrayList<>();
    private final List<Connection> usedConnections = new ArrayList<>();

    // Khởi tạo pool
    public Connectionpool() throws SQLException {
        for (int i = 0; i < INITIAL_POOL_SIZE; i++) {
            availableConnections.add(createConnection());
        }
    }

    // Tạo một kết nối cơ sở dữ liệu
    private Connection createConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    // Lấy kết nối từ pool
    public synchronized Connection getConnection() throws SQLException {
        if (availableConnections.isEmpty()) {
            // Nếu không còn kết nối trống, kiểm tra xem có thể tạo thêm không
            if (usedConnections.size() < MAX_POOL_SIZE) {
                availableConnections.add(createConnection());
            } else {
                throw new SQLException("Maximum pool size reached, no available connections!");
            }
        }

        // Mượn một kết nối từ danh sách có sẵn
        Connection connection = availableConnections.remove(availableConnections.size() - 1);
        usedConnections.add(connection);
        return connection;
    }

    // Trả lại kết nối vào pool
    public synchronized void releaseConnection(Connection connection) {
        usedConnections.remove(connection);
        availableConnections.add(connection);
    }

    // Đóng toàn bộ kết nối
    public synchronized void shutdown() throws SQLException {
        for (Connection connection : availableConnections) {
            connection.close();
        }
        for (Connection connection : usedConnections) {
            connection.close();
        }
        availableConnections.clear();
        usedConnections.clear();
    }

    // Xem trạng thái pool
    public synchronized int getAvailableConnectionsCount() {
        return availableConnections.size();
    }

    public synchronized int getUsedConnectionsCount() {
        return usedConnections.size();
    }
}
