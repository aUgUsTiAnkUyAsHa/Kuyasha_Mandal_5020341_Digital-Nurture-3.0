/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package z.strategypatternexample;

/**
 *
 * @author kuyas
 */
public class StrategyPatternExample {

    public static void main(String[] args) {
      PaymentContext paymentContext = new PaymentContext(null);

        PaymentStrategy creditCardPayment = new CreditCardPayment("1234-5678-9012-3456", "12/2025", "123");
        paymentContext.setPaymentStrategy(creditCardPayment);
        paymentContext.executePayment(100.0);

        PaymentStrategy paypalPayment = new PayPalPayment("john.doe@example.com", "password123");
        paymentContext.setPaymentStrategy(paypalPayment);
        paymentContext.executePayment(200.0);
    }
}
