/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package z.observerpatternexample;

/**
 *
 * @author kuyas
 */
public class ObserverPatternExample {

    public static void main(String[] args) {
       StockMarket stockMarket = new StockMarket();

        MobileApp mobileApp = new MobileApp();
        WebApp webApp = new WebApp();

        stockMarket.registerObserver(mobileApp);
        stockMarket.registerObserver(webApp);

        stockMarket.setStockPrice(100.0);

        stockMarket.deregisterObserver(mobileApp);

        stockMarket.setStockPrice(120.0);
    }
}
