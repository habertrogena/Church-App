import "package:graphql_flutter/graphql_flutter.dart";
import 'package:rentals_app/src/features/default_home/model/dashbaord_model.dart';
import 'package:rentals_app/src/features/statement/model/statement_model.dart';
import 'package:rentals_app/services/graphql/schema/statement_schema.dart';
import 'package:rentals_app/services/graphql/graphql.dart';

class DashboardController {
  DashboardController();

  Future<DashboardModel> getDashbaordData(String uid) async {
    /**Get the infomation needed for the dashbaord */
    GraphqlConfiguration graphqlConfig = GraphqlConfiguration();
    StatementSchema statementSchema = StatementSchema();
    GraphQLClient client = graphqlConfig.clientToQuery();
    //Get the latest invoice for the given user
    QueryResult result = await client.query(QueryOptions(
        document: gql(
          statementSchema.getInvoice(),
        ),
        variables: const {
          "posterOptions": {"month": 7, "year": 2023, "monitor": true}
        }));
    //Check for errors
    if (result.hasException) {
      throw Exception(result.exception);
    }
    //Extract the values needed.
    final res = result.data!['getInvoices'][0];
    final statement = StatementModel(
        invoice: res['invoice'],
        openingBalance: res['opening_balance'],
        rent: res['rent'],
        payments: res['payment'],
        closingBalance: res['closing_balance']);
    //Create a new dashboard model
    //Get the first and only will be the current invoice
    return DashboardModel(statement: statement);
  }
}
