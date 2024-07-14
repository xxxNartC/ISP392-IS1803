/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ACER
 */
public class Chef {
    private int chefid;
    private String name;
    private int salary;
    private int phone;
    private String address;
    private String Description;
    private String role;
    private String image;

    public Chef() {
    }

    public Chef(int chefid ,String name, String role, String image) {
        this.chefid = chefid;
        this.name = name;
        this.role = role;
        this.image = image;
    }

    public Chef(int chefid, String name, int salary, int phone, String address, String Description, String role, String image) {
        this.chefid = chefid;
        this.name = name;
        this.salary = salary;
        this.phone = phone;
        this.address = address;
        this.Description = Description;
        this.role = role;
        this.image = image;
    }

    

    public int getChefid() {
        return chefid;
    }

    public void setChefid(int chefid) {
        this.chefid = chefid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Chef{" + "chefid=" + chefid + ", name=" + name + ", salary=" + salary + ", phone=" + phone + ", address=" + address + ", Description=" + Description + ", role=" + role + ", image=" + image + '}';
    }
    
}
