/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DELL
 */
public class Item {
    private dish Dish;
    private double price;
    private int quantity;

    public Item() {
    }

    public Item(dish Dish, double price, int quantity) {
        this.Dish = Dish;
        this.price = price;
        this.quantity = quantity;
    }

    public dish getDish() {
        return Dish;
    }

    public void setDish(dish Dish) {
        this.Dish = Dish;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
