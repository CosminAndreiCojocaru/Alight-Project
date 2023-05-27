package siit.model;

import java.math.BigDecimal;
import java.util.List;

public class Restaurant {
    private int id;
    private String name;
    private String schedule;
    private BigDecimal minimumOrder;
    private Double standardDeliveryDistance;
    private Double standardDeliveryPrice;
    private Double extraDeliveryFee;
    List<MenuItem> menuItem;

    public Restaurant(int id, String name, String schedule, BigDecimal minimumOrder, Double standardDeliveryDistance, Double standardDeliveryPrice, Double extraDeliveryFee) {
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

