package all.model;

import all.repository.MenuItemRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
import java.util.List;

public class Restaurant {
    private int id;
    private String name;
    private String schedule;
    private Double minimumOrder;
    private Double standardDeliveryDistance;
    private Double standardDeliveryPrice;
    private Double extraDeliveryFee;
    List<MenuItem> menuItem;

    public Restaurant(int id, String name, String schedule, Double minimumOrder, Double standardDeliveryDistance, Double standardDeliveryPrice, Double extraDeliveryFee) {
        this.id = id;
        this.name = name;
        this.schedule = schedule;
        this.minimumOrder = minimumOrder;
        this.standardDeliveryDistance = standardDeliveryDistance;
        this.standardDeliveryPrice = standardDeliveryPrice;
        this.extraDeliveryFee = extraDeliveryFee;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public Double getMinimumOrder() {
        return minimumOrder;
    }

    public void setMinimumOrder(Double minimumOrder) {
        this.minimumOrder = minimumOrder;
    }

    public Double getStandardDeliveryDistance() {
        return standardDeliveryDistance;
    }

    public void setStandardDeliveryDistance(Double standardDeliveryDistance) {
        this.standardDeliveryDistance = standardDeliveryDistance;
    }

    public Double getStandardDeliveryPrice() {
        return standardDeliveryPrice;
    }

    public void setStandardDeliveryPrice(Double standardDeliveryPrice) {
        this.standardDeliveryPrice = standardDeliveryPrice;
    }

    public Double getExtraDeliveryFee() {
        return extraDeliveryFee;
    }

    public void setExtraDeliveryFee(Double extraDeliveryFee) {
        this.extraDeliveryFee = extraDeliveryFee;
    }

    public List<MenuItem> getMenuItem() {
        return menuItem;
    }

    public void setMenuItem(List<MenuItem> menuItem) {
        this.menuItem = menuItem;
    }


    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Restaurant{")
                .append("id=").append(id)
                .append(", name='").append(name).append('\'')
                .append(", schedule='").append(schedule).append('\'')
                .append(", minimumOrder=").append(minimumOrder)
                .append(", standardDeliveryDistance=").append(standardDeliveryDistance)
                .append(", standardDeliveryPrice=").append(standardDeliveryPrice)
                .append(", extraDeliveryFee=").append(extraDeliveryFee);

        if (menuItem != null && !menuItem.isEmpty()) {
            sb.append(", menu items=[");
            for (MenuItem item : menuItem) {
                sb.append(item.getName()).append(", ");
            }
            sb.delete(sb.length() - 2, sb.length());  // Remove the trailing comma and space
            sb.append("]");
        } else if (name != null && !name.isEmpty()) {
            sb.append(", menu items not available for ").append(name);
        } else {
            sb.append(", menu items not available");
        }

        sb.append('}');
        return sb.toString();
    }

    private Double extraDistanceChargePerKm;

    // ...

    public Double getExtraDistanceChargePerKm() {
        return extraDistanceChargePerKm;
    }

    public void setExtraDistanceChargePerKm(Double extraDistanceChargePerKm) {
        this.extraDistanceChargePerKm = extraDistanceChargePerKm;
    }

    // ...

    public Double getMinimumOrderAmount() {
        return minimumOrder;
    }
}

