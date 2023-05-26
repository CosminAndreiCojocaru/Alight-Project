package siit.db;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import siit.model.MenuItem;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class MenuItemRepository {


    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<MenuItem> getBy(Integer id) {
        String sql = "SELECT * FROM menu_items where restaurant_id = ?";
        List<MenuItem> menuItem =jdbcTemplate.query(sql, this:: extractMenuItem, id);
        return menuItem;
    }


    private MenuItem extractMenuItem(ResultSet rs, int rowNumb) throws SQLException {
        int id = rs.getInt("id");
        int restaurantId = rs.getInt("restaurant_id");
        String name = rs.getString("name");
        String description = rs.getString("description");
        double price = rs.getDouble("price");

        return new MenuItem(id, restaurantId, name, description, price);
    }
}
