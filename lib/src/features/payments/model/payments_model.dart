class PaymentModel {
  int amount;
  String tenantId;
  String type = 'mpesa';
  String reason;

  String? phoneNo;

  PaymentModel(
      {required this.amount,
      required this.tenantId,
      required this.reason,
      this.phoneNo});

  //Create a named constructor fromJson
  PaymentModel.fromJson(Map<String, dynamic> json)
      : this(
            amount: json[''],
            reason: json[''],
            tenantId: json[''],
            phoneNo: json['']);
  //Create a toJosn function
  Map toJson() => {
        "type": type,
        "amount": "${getAmount()}".toString(),
        "tenant_id": tenantId,
        "reason": reason
      };

  getAmount() => amount;
}
