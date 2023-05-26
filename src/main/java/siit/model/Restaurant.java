package siit.model;

import java.math.BigDecimal;
import java.util.List;

public class Restaurant {
    private int id;
    private String name;
    private String schedule;
    private BigDecimal minimumOrder;
    private BigDecimal standardDeliveryDistance;
    private BigDecimal standardDeliveryPrice;
    private BigDecimal extraDeliveryFee;
    List<MenuItem> menuItem;

    public Restaurant(int id, String name, String schedule, BigDecimal minimumOrder, BigDecimal standardDeliveryDistance, BigDecimal standardDeliveryPrice, BigDecimal extraDeliveryFee) {
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

    public BigDecimal getMinimumOrder() {
        return minimumOrder;
    }

    public void setMinimumOrder(BigDecimal minimumOrder) {
        this.minimumOrder = minimumOrder;
    }

    public BigDecimal getStandardDeliveryDistance() {
        return standardDeliveryDistance;
    }

    public void setStandardDeliveryDistance(BigDecimal standardDeliveryDistance) {
        this.standardDeliveryDistance = standardDeliveryDistance;
    }

    public BigDecimal getStandardDeliveryPrice() {
        return standardDeliveryPrice;
    }

    public void setStandardDeliveryPrice(BigDecimal standardDeliveryPrice) {
        this.standardDeliveryPrice = standardDeliveryPrice;
    }

    public BigDecimal getExtraDeliveryFee() {
        return extraDeliveryFee;
    }

    public void setExtraDeliveryFee(BigDecimal extraDeliveryFee) {
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
        return "Restaurant{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", schedule='" + schedule + '\'' +
                ", minimumOrder=" + minimumOrder +
                ", standardDeliveryDistance=" + standardDeliveryDistance +
                ", standardDeliveryPrice=" + standardDeliveryPrice +
                ", extraDeliveryFee=" + extraDeliveryFee +
                '}';
    }
}

