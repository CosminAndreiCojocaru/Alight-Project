package all.service;

import all.model.MenuItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import all.repository.MenuItemRepository;
import all.repository.RestaurantRepository;
import all.model.Restaurant;

import java.awt.*;
import java.util.List;

@Service
public class RestaurantService {

    @Autowired
    private RestaurantRepository restaurantRepository;

    @Autowired
    private MenuItemRepository menuItemRepository;


    public List<Restaurant> getAllRestaurants() {
        return restaurantRepository.getAllRestaurants();
    }

    public Restaurant getBy(int id) {
        Restaurant restaurant = restaurantRepository.getBy(id);
        restaurant.setMenuItem(menuItemRepository.getBy(id));

        return restaurant;
    }
}

