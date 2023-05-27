package siit.db;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.stereotype.Repository;
import siit.model.Restaurant;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class RestaurantRepository {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<Restaurant> getAllRestaurants() {
        return jdbcTemplate.query("SELECT * FROM restaurants", this::extractRestaurants);

    }

    public Restaurant getBy(int id) {
        String sql = "SELECT * FROM restaurants WHERE id:: int = ?";

        List<Restaurant> restaurants = jdbcTemplate.query(sql, this::extractRestaurants, id);
        if (restaurants.isEmpty()) {
            return null; // Return null if restaurants with given ID doesn't exist
        }
        return restaurants.get(0);
    }

    private Restaurant extractRestaurants(ResultSet rs, int rowNumb) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String schedule = rs.getString("schedule");
        BigDecimal minimumOrder = rs.getBigDecimal("minimum_order");
        Double standardDeliveryDistance = rs.getDouble("standard_delivery_distance");
        Double standardDeliveryPrice = rs.getDouble("standard_delivery_price");
        Double extraDeliveryFee = rs.getDouble("extra_delivery_fee");
        return new Restaurant(id, name, schedule, minimumOrder, standardDeliveryDistance, standardDeliveryPrice, extraDeliveryFee);
    }


}