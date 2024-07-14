package Model;

import DAL.DishDao;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PreOrder {

    private int preOrderID; // This field will auto-increment
    private int tableID;
    private String name;
    private String phone;
    private Date bookDate;
    private int numberOfPeople;
    private Date time;
    private String status;
    private int userId;
    private String dishOrder;

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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public String getDishOrder() {
        return dishOrder;
    }

    public void setDishOrder(String dishOrder) {
        this.dishOrder = dishOrder;
    }

    private List<PreOrderDetail> detail = null;

    public List<PreOrderDetail> getDetail() {

        if (detail == null) {
            detail = new ArrayList<PreOrderDetail>();
            
            if (dishOrder==null || dishOrder.isEmpty()) 
                return detail;

            String[] datas = dishOrder.split(";");
            for (String data : datas) {

                String[] value = data.split(":");

                PreOrderDetail preOrderDetail = new PreOrderDetail();
                preOrderDetail.setDish(new DishDao().getDishesByID1(Integer.parseInt(value[0])));
                preOrderDetail.setQuantity(Integer.parseInt(value[1]));

                detail.add(preOrderDetail);
            }
        }

        return detail;
    }

}
