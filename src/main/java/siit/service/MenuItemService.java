package siit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import siit.db.MenuItemRepository;
import siit.model.MenuItem;

import java.util.List;

@Service
public class MenuItemService {

    @Autowired
    MenuItemRepository menuItemRepository;

    public List<MenuItem> getBy(Integer id) {
        List<MenuItem> menuItems = menuItemRepository.getBy(id);
        for (MenuItem menuItem : menuItems) {
            menuItem.setQuantity(0); // Initialize quantity to 0
            menuItem.setMentions(""); // Initialize mention to an empty string
        }
        return menuItems;
    }
}
