/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package z.proxypatternexample;

/**
 *
 * @author kuyas
 */
public class ProxyPatternExample {

    public static void main(String[] args) {
        Image image1 = new ProxyImage("http://example.com/image1.jpg");
        Image image2 = new ProxyImage("http://example.com/image2.jpg");

        image1.display(); 
        image1.display(); 
        image2.display();
    }
}
