/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package z.dependencyinjectionexample;

/**
 *
 * @author kuyas
 */
// CustomerRepository.java
public interface CustomerRepository {
    Customer findCustomerById(int id);
}