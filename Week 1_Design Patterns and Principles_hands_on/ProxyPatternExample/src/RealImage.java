/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package z.proxypatternexample;

/**
 *
 * @author kuyas
 */

public class RealImage implements Image {
    private String url;

    public RealImage(String url) {
        this.url = url;
        loadFromServer();
    }

    private void loadFromServer() {
        System.out.println("Loading image from server: " + url);
       
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    @Override
    public void display() {
        System.out.println("Displaying image: " + url);
    }
}