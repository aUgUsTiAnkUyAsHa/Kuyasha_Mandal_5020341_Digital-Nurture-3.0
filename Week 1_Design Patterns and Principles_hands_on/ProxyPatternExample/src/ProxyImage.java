/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package z.proxypatternexample;

import java.util.HashMap;

/**
 *
 * @author kuyas
 */
// ProxyImage.java (with caching)
public class ProxyImage implements Image {
    private final String url;

    private static final HashMap<String, RealImage> cache = new HashMap<>();

    public ProxyImage(String url) {
        this.url = url;
    }

    @Override
    public void display() {
        if (!cache.containsKey(url)) {
            cache.put(url, new RealImage(url));
        }
        cache.get(url).display();
    }
}