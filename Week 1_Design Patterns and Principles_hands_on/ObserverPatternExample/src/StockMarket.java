/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package z.observerpatternexample;

/**
 *
 * @author kuyas
 */

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class StockMarket implements Stock {
    private final List<Observer> observers;
    private double stockPrice;

    public StockMarket() {
        this.observers = new CopyOnWriteArrayList<>();
    }

    @Override
    public void registerObserver(Observer observer) {
        observers.add(observer);
    }

    @Override
    public void deregisterObserver(Observer observer) {
        observers.remove(observer);
    }

    @Override
    public void notifyObservers() {
        for (Observer observer : observers) {
            observer.update(stockPrice);
        }
    }

    public void setStockPrice(double stockPrice) {
        this.stockPrice = stockPrice;
        notifyObservers();
    }

   }
