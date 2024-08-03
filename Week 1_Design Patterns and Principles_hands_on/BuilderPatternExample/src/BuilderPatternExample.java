/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package z.builderpatternexample;

/**
 *
 * @author kuyas
 */
public class BuilderPatternExample {

    public static void main(String[] args) {
        Computer basicComputer = new Computer.Builder()
                .cpu("Intel Core i3")
                .ram(8)
                .storage(256)
                .build();

        System.out.println("Basic Computer:");
        System.out.println("CPU: " + basicComputer.getCpu());
        System.out.println("RAM: " + basicComputer.getRam() + " GB");
        System.out.println("Storage: " + basicComputer.getStorage() + " GB");

        Computer gamingComputer = new Computer.Builder()
                .cpu("Intel Core i7")
                .ram(16)
                .storage(512)
                .build();

        System.out.println("\nGaming Computer:");
        System.out.println("CPU: " + gamingComputer.getCpu());
        System.out.println("RAM: " + gamingComputer.getRam() + " GB");
        System.out.println("Storage: " + gamingComputer.getStorage() + " GB");
    }
}
