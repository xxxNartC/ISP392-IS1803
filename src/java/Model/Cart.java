/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    private Item getItemById(int id) {
        for (Item i : items) {
            if (i.getDish().getDishID() == id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Item d) {
        if (getItemById(d.getDish().getDishID()) != null) {
            Item m = getItemById(d.getDish().getDishID());
            m.setQuantity(m.getQuantity() + d.getQuantity());
        } else {
            items.add(d);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public void updateItemQuantity(int id, int num) {
        Item item = getItemById(id);
        if (item != null) {
            item.setQuantity(item.getQuantity() + num);
            if (item.getQuantity() <= 0) {
                removeItem(id);
            }
        }
    }

    public double getTotalPrice() {
        double d = 0;
        for (Item i : items) {
            d += (Double) (i.getQuantity() * i.getPrice());
        }
        return d;
    }
}
