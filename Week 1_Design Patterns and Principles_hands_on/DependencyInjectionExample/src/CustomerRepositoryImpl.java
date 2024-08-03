/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package z.dependencyinjectionexample;

/**
 *
 * @author kuyas
 */

import java.util.HashMap;
import java.util.Map;

public class CustomerRepositoryImpl implements CustomerRepository {
    private final Map<Integer, Customer> customers = new HashMap<>();

    public CustomerRepositoryImpl() {
        customers.put(1, new Customer(1, "RAJA ROY"));
        customers.put(2, new Customer(2, "RANI ROY"));
    }

    @Override
    public Customer findCustomerById(int id) {
        return customers.get(id);
    }
}
