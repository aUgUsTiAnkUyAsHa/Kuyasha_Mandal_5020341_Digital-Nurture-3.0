/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package z.observerpatternexample;

/**
 *
 * @author kuyas
 */

public class MobileApp implements Observer {
    @Override
    public void update(double stockPrice) {
        System.out.println("Mobile App: Stock price updated to " + stockPrice);
    }
}


 class WebApp implements Observer {
    @Override
    public void update(double stockPrice) {
        System.out.println("Web App: Stock price updated to " + stockPrice);
    }
}