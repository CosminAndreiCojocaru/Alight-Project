package all.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import all.model.CartItem;
import all.model.Order;
import all.model.Restaurant;
import all.service.RestaurantService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



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
                              @RequestParam("name") String name, @RequestParam("price") double price,
                              HttpSession session) {

    // Check if there is an existing cart for a different restaurant
    Integer existingRestaurantId = (Integer) session.getAttribute("restaurantId");
    if (existingRestaurantId != null && !existingRestaurantId.equals(id)) {
        // If there is an existing cart for a different restaurant, clear it before adding items from a new restaurant
        session.removeAttribute("restaurants");
        session.removeAttribute("restaurantId");
    }

    List<CartItem> cartItems = (List<CartItem>) session.getAttribute("restaurants");
    if (cartItems == null) {
        cartItems = new ArrayList<>();
    }

    // Check if the item already exists in the cart
    boolean itemExists = false;
    for (CartItem cartItem : cartItems) {
        if (cartItem.getMenuItem().getId() == itemId && cartItem.getMenuItem().getName().equals(name)) {
            // Update the quantity of the existing item
            cartItem.setQuantity(cartItem.getQuantity() + quantity);
            // Concatenate the new mention with the existing one
            cartItem.setMention(cartItem.getMention() + ", " + mention);
            itemExists = true;
            break;
        }
    }

    // If the item doesn't exist in the cart, create a new cart item
    if (!itemExists) {
        CartItem cartItem = new CartItem(itemId, quantity, mention, name, price);
        cartItems.add(cartItem);
    }

    // Update the cart items and restaurant ID in the session
    session.setAttribute("restaurants", cartItems);
    session.setAttribute("restaurantId", id);

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


    @RequestMapping(method = RequestMethod.GET, path = "/{id}/complete-order")
    public ModelAndView showCompleteOrderForm(@PathVariable Integer id) {
        ModelAndView mav = new ModelAndView("complete-order");
        mav.addObject("restaurants", restaurantService.getBy(id));
        return mav;
    }

    private Map<String, Order> orderMap = new HashMap<>();

    @RequestMapping(method = RequestMethod.POST, path = "/{id}/complete-order")
    @ResponseBody
    public String completeOrder(@PathVariable Integer id, @ModelAttribute("order") Order order, HttpSession session) {
        if (session.getAttribute("orderFinalized") != null) {
            // Return an error message or perform appropriate action
            return "The order has already been finalized.";
        }

        String uniqueCode = generateUniqueCode(); // Implement your logic to generate a unique code
        order.setUniqueCode(uniqueCode);


        // Get the cart items from the session and add them to the order
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("restaurants");
        order.setCartItems(cartItems);

        Restaurant restaurant = restaurantService.getBy(id);
        List<Restaurant> restaurants = new ArrayList<>();
        restaurants.add(restaurant);
        order.setRestaurants(restaurants);

        double totalOrderAmount = calculateTotalOrderAmount(order); // Calculate the total order amount

        // Check if the total order amount meets the minimum order requirement
        double minimumOrderAmount = restaurant.getMinimumOrderAmount();
        if (totalOrderAmount < minimumOrderAmount) {
            // Return an error message or perform appropriate action
            return "The minimum order amount for this restaurant is $" + minimumOrderAmount;
        }

        orderMap.put(uniqueCode, order);

        session.setAttribute("orderFinalized", true);

        return uniqueCode;
    }

    private double calculateTotalOrderAmount(Order order) {
        double totalOrderAmount = 0;

        // Calculate the total order amount by summing the item prices
        for (CartItem cartItem : order.getCartItems()) {
            double itemPrice = cartItem.getMenuItem().getPrice();
            int quantity = cartItem.getQuantity();
            totalOrderAmount += itemPrice * quantity;
        }

        // Add the standard delivery price and extra distance charge to the total order amount
        totalOrderAmount += order.getRestaurants().get(0).getStandardDeliveryPrice();
        double extraDistance = order.getDistance() - order.getRestaurants().get(0).getStandardDeliveryDistance();
        if (extraDistance > 0) {
            double extraDistanceCharge = extraDistance * order.getRestaurants().get(0).getExtraDeliveryFee();
            totalOrderAmount += extraDistanceCharge;
        }

        return totalOrderAmount;
    }


    @RequestMapping(method = RequestMethod.GET, path = "/order-confirmation")
    public ModelAndView showOrderConfirmation(@RequestParam("code") String code) {
        Order order = orderMap.get(code);

        ModelAndView mav = new ModelAndView("order-confirmation");
        mav.addObject("order", order);
        return mav;
    }


    public static String generateUniqueCode() {
        // Generate a unique code using a combination of timestamp and a random number
        long timestamp = System.currentTimeMillis();
        int randomNumber = (int) (Math.random() * 10000);
        String uniqueCode = timestamp + "-" + randomNumber;

        return uniqueCode;
    }


}
