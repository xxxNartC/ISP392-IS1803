/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DELL
 */
public class CartDish {
    private dish dishs;
    private int quantity; // Sửa lỗi chính tả từ 'quanlity' thành 'quantity'

    public CartDish() {
    }

    public CartDish(dish dishs, int quantity) {
        this.dishs = dishs;
        this.quantity = quantity;
    }

    public dish getDishs() {
        return dishs;
    }

    public void setDishs(dish dishs) {
        this.dishs = dishs;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
