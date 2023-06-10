package all.model;

public class CartItem {
    private MenuItem menuItem;
    private int quantity;
    private String mention;

    public CartItem(Integer itemId, Integer quantity, String mention, String name, double price) {
        this.menuItem = new MenuItem(itemId, 0, name, null, price); // Replace the 0s and nulls with appropriate values
        this.quantity = quantity;
        this.mention = mention;
    }


    public MenuItem getMenuItem() {
        return menuItem;
    }

    public void setMenuItem(MenuItem menuItem) {
        this.menuItem = menuItem;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getMention() {
        return mention;
    }

    public void setMention(String mention) {
        this.mention = mention;
    }

}

