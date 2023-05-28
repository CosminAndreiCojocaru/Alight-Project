package all.model;

public class Order {
    private String name;
    private String address;
    private double distance;
    private String mention;
    private String uniqueCode;

    // Constructors, getters, and setters

    public Order(String name, String address, double distance, String mention, String uniqueCode) {
        this.name = name;
        this.address = address;
        this.distance = distance;
        this.mention = mention;
        this.uniqueCode = uniqueCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public String getMention() {
        return mention;
    }

    public void setMention(String mention) {
        this.mention = mention;
    }

    public String getUniqueCode() {
        return uniqueCode;
    }

    public void setUniqueCode(String uniqueCode) {
        this.uniqueCode = uniqueCode;
    }
}
