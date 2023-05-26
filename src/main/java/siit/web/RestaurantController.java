package siit.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import siit.model.CartItem;
import siit.model.Restaurant;
import siit.service.RestaurantService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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

    @SuppressWarnings("unchecked")
    @RequestMapping(method = RequestMethod.POST, path = "/{id}/menuitem/addtocart")
    public ModelAndView addToCart(@PathVariable Integer id, @RequestParam("itemId") Integer itemId,
                                  @RequestParam("quantity") Integer quantity, @RequestParam("mention") String mention,
                                  HttpSession session) {
        // Get the cart items from the session or create a new list if it doesn't exist
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("restaurants");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }

        // Create a new cart item with the provided parameters
        CartItem cartItem = new CartItem(itemId, quantity, mention);
        cartItems.add(cartItem);

        // Update the cart items in the session
        session.setAttribute("restaurants", cartItems);

        return new ModelAndView("redirect:/restaurants/cart");
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(method = RequestMethod.GET, path = "/cart")
    public ModelAndView viewCart(HttpSession session) {
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("restaurants");

        ModelAndView mav = new ModelAndView("cart");
        mav.addObject("restaurants", cartItems);

        return mav;
    }


}
