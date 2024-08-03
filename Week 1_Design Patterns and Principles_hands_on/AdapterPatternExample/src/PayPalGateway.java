/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package z.adapterpatternexample;

/**
 *
 * @author kuyas
 */

public class PayPalGateway {
    public void makePayment(String paymentDetails) {
        System.out.println("Processing payment through PayPal: " + paymentDetails);
    }
}

 class StripeGateway {
    public void chargeCard(String paymentDetails) {
        System.out.println("Processing payment through Stripe: " + paymentDetails);
    }
}

 class BankTransferGateway {
    public void transferFunds(String paymentDetails) {
        System.out.println("Processing payment through Bank Transfer: " + paymentDetails);
    }
}