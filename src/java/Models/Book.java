/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Blob;

/**
 *
 * @author Marija
 */
public class Book {
    
    private Integer bookId;
    private String name;
    private String author;
    private String description;
    private String genre;
    private Blob picture;
    private String quantity;

    public Book() {
    }

    public Book(Integer bookId, String name, String author, String description, String genre, Blob picture, String quantity) {
        this.bookId = bookId;
        this.name = name;
        this.author = author;
        this.description = description;
        this.genre = genre;
        this.picture = picture;
        this.quantity = quantity;
    }

    public Blob getPicture() {
        return picture;
    }

    public void setPicture(Blob picture) {
        this.picture = picture;
    }
    
    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    
    
}
