import 'dart:core';

class StatementModel {
  List<Object?> invoice;
  List<Object?> openingBalance;
  List<Object?> rent;
  List<Object?> payments;
  List<Object?> closingBalance;

  final testing = "Testing";

  StatementModel(
      {required this.invoice,
      required this.openingBalance,
      required this.rent,
      required this.payments,
      required this.closingBalance});

  StatementModel.fromJson(Map<String, List<Map<String, dynamic>>> staticValues)
      : this(
          openingBalance: staticValues['opening_balance'] as List<Object>,
          rent: staticValues['rents'] as List<Object>,
          closingBalance: staticValues['closing_balance'] as List<Object>,
          invoice: staticValues['invoice'] as List<Object>,
          payments: staticValues['payments'] as List<Object>,
        );

  Map<String, List<Object?>> toJson() {
    return {};
  }

  String getTenantInfomationProp(String prop) {
    //Get the first and type
    final client = invoice[0] as Map<String, dynamic>;
    return client[prop];
  }

  String getAccountBalance() {
    final accountBalance = closingBalance[0] as Map<String, dynamic>;
    return accountBalance['amount'].toString();
  }

  dynamic helloworld() {}
}
