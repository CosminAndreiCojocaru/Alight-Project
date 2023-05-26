package siit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import siit.db.MenuItemRepository;
import siit.db.RestaurantRepository;
import siit.model.Restaurant;

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

