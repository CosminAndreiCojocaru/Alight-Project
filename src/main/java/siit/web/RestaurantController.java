package siit.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import siit.model.Restaurant;
import siit.service.RestaurantService;

@Controller
@RequestMapping(path = "/restaurants")
@RestController
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;


    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView renderRestaurantList() {
        ModelAndView mav = new ModelAndView("restaurant-list");
        mav.addObject("restaurants", restaurantService.getAllRestaurants());
        return mav;
    }

    @RequestMapping(method = RequestMethod.GET, path = "/{id}/menuitem")
    public ModelAndView renderMenuItemPage(@PathVariable Integer id) {
        ModelAndView mav = new ModelAndView("menu-item");
        Restaurant restaurant = restaurantService.getBy(id);
        mav.addObject("restaurants", restaurant);
        return mav;
    }


}
