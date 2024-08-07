package Model;

import java.sql.Time;
import java.util.Date;

public class PreOrder {

    private int preOrderID; // This field will auto-increment
    private int tableID;
    private String name;
    private String phone;
    private Date bookDate;
    private int numberOfPeople;
    private Date time;
    private String status;

    // Constructors
    public PreOrder() {
    }

    public PreOrder(int preOrderID, int tableID, String name, String phone, Date bookDate, int numberOfPeople, Date time) {
        this.preOrderID = preOrderID;
        this.tableID = tableID;
        this.name = name;
        this.phone = phone;
        this.bookDate = bookDate;
        this.numberOfPeople = numberOfPeople;
        this.time = time;
    }

    public PreOrder(int preOrderID, int tableID, String name, String phone, Date bookDate, int numberOfPeople, Date time, String status) {
        this.preOrderID = preOrderID;
        this.tableID = tableID;
        this.name = name;
        this.phone = phone;
        this.bookDate = bookDate;
        this.numberOfPeople = numberOfPeople;
        this.time = time;
        this.status = status;
    }

    public int getPreOrderID() {
        return preOrderID;
    }

    public void setPreOrderID(int preOrderID) {
        this.preOrderID = preOrderID;
    }

    public int getTableID() {
        return tableID;
    }

    public void setTableID(int tableID) {
        this.tableID = tableID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getBookDate() {
        return bookDate;
    }

    public void setBookDate(Date bookDate) {
        this.bookDate = bookDate;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public void setBookTime(Time time) {
        this.time = new Date(time.getTime());
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
