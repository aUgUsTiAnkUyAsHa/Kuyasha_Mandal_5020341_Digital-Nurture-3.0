/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package z.singletonpatternexample;


public class SingletonPatternExample {

    public static void main(String[] args) {
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();
        System.out.println("Are both instances the same? " + (logger1 == logger2));
        logger1.log("Hello from logger1!");
        logger2.log("Hello from logger2!");
    }
}
