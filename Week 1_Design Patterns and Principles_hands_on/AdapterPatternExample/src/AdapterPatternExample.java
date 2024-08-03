/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package z.adapterpatternexample;

/**
 *
 * @author kuyas
 */
public class AdapterPatternExample {

    public static void main(String[] args) {
        PaymentProcessor paypalProcessor = new PayPalAdapter();
        paypalProcessor.processPayment("PayPal payment details");

        PaymentProcessor stripeProcessor = new StripeAdapter();
        stripeProcessor.processPayment("Stripe payment details");

        PaymentProcessor bankTransferProcessor = new BankTransferAdapter();
        bankTransferProcessor.processPayment("Bank Transfer payment details");
    }
}
