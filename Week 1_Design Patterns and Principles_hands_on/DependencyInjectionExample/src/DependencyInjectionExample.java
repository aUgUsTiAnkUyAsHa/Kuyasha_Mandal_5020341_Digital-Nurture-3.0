/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package z.dependencyinjectionexample;

/**
 *
 * @author kuyas
 */
public class DependencyInjectionExample {

    public static void main(String[] args) {
        CustomerRepository customerRepository = new CustomerRepositoryImpl();

      
        CustomerService customerService = new CustomerService(customerRepository);

        Customer customer = customerService.findCustomerById(1);

        System.out.println("Customer Name: " + customer.getName());
    }
}
