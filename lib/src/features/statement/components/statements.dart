import 'package:flutter/material.dart';

class StatementsPage extends StatelessWidget {
  const StatementsPage({this.data, super.key});

  final dynamic data;

  @override
  build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: data.length > 0
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Full Name')),
                    DataColumn(label: Text('Opening Balance')),
                    DataColumn(label: Text('Rent')),
                    DataColumn(label: Text('Payment')),
                    DataColumn(label: Text('Services')),
                    DataColumn(label: Text('Closing Balance')),
                  ],
                  rows: data.map(
                    (report) => DataRow(
                      cells: [
                        DataCell(Text(report['invoice'][0]['full_name'])),
                        DataCell(Text(
                            report['opening_balance'][0]['amount'].toString())),
                        DataCell(Text(report['rent'][0]['amount'].toString())),
                        DataCell(
                            Text(report['payment'][0]['amount'].toString())),
                        DataCell(
                            Text(report['services'][0]['amount'].toString())),
                        DataCell(Text(
                            report['closing_balance'][0]['amount'].toString())),
                      ],
                    ),
                  ),
                ),
              )
            : const Text('No Data to show'),
      ),
    );
  }
}
