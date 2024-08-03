/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package z.adapterpatternexample;

/**
 *
 * @author kuyas
 */

public class PayPalAdapter implements PaymentProcessor {
    private final PayPalGateway payPalGateway;

    public PayPalAdapter() {
        this.payPalGateway = new PayPalGateway();
    }

    @Override
    public void processPayment(String paymentDetails) {
        payPalGateway.makePayment(paymentDetails);
    }
}

 class StripeAdapter implements PaymentProcessor {
    private final StripeGateway stripeGateway;

    public StripeAdapter() {
        this.stripeGateway = new StripeGateway();
    }

    @Override
    public void processPayment(String paymentDetails) {
        stripeGateway.chargeCard(paymentDetails);
    }
}


 class BankTransferAdapter implements PaymentProcessor {
    private BankTransferGateway bankTransferGateway;

    public BankTransferAdapter() {
        this.bankTransferGateway = new BankTransferGateway();
    }

    @Override
    public void processPayment(String paymentDetails) {
        bankTransferGateway.transferFunds(paymentDetails);
    }
}