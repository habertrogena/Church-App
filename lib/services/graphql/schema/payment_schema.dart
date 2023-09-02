class PaymentSchema {
  makePayment() {
    return """
      mutation createPayment(\$update: PaymentDto!){
        createPayment(payment: \$update ){
          payment
        }
      }
    """;
  }

  getPaymentsForTenant() {
    return """
      query getTenantProfile{
        getTenantUser {
          name
          uid
          name
          contact
          phone
          quarterly
          roomNo
          size
          deposit
          amount
        }
      }
    """;
  }

  pushSdk() {
    return """
      mutation pushSDk(\$mpesaPayment: MpesaPayment!) {
        pushSdk(mpesaPayment: \$mpesaPayment){
          msg
        }
      }
""";
  }
}
