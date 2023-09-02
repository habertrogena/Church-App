import 'package:rentals_app/services/graphql/graphql.dart';
import 'package:rentals_app/services/graphql/schema/statement_schema.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import '../model/statement_model.dart';

class StatementController {
  final graphqlClient = GraphqlConfiguration();
  final statmentSchema = StatementSchema();
  //final statementModel = StatementModel();
  //State Variables
  late StatementModel tenantStatement;

  Future<List<dynamic>> getReports() async {
    /**Fetch statement data: Returns an Array [StatementModel]*/
    final List<dynamic> report = [];
    GraphQLClient client = graphqlClient.clientToQuery();
    StatementSchema statementSchema = StatementSchema();
    QueryResult result = await client.query(QueryOptions(
        document: gql(
          statementSchema.getStatements(),
        ),
        variables: const {
          "reportOptions": {"where": ''}
        }));
    if (result.hasException) {
      throw Exception(result.exception);
    }
    //No errors...
    List<dynamic> statementsData = result.data!['getReports'];
    //Build a dynamic statement model.
    for (var i = 0; i < statementsData.length; i++) {
      report.add(StatementModel(
          invoice: statementsData[i]['invoice'],
          openingBalance: statementsData[i]['opening_balance'],
          rent: statementsData[i]['rent'],
          payments: statementsData[i]['payment'],
          closingBalance: statementsData[i]['']));
    }
    print(report);
    return report;
  }
}
