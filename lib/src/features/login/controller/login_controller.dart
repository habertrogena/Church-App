import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../services/graphql/graphql.dart';
import '../../../../services/graphql/schema/auth_schema.dart';
import '../model/user_model.dart';

class LoginController {
  //TextField controller to get data from TextFields
  late Map<String, dynamic>? user;
  //The login schema
  final graphqlClient = GraphqlConfiguration();
  final LoginSchema loginSchema = LoginSchema();

  Future<bool> signInUser(String email, String password) async {
    /**Sign In a client user: Use [Email] and [Password] */
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //Get the current looged in user
      String bearer = await FirebaseAuth.instance.currentUser!.getIdToken();
      GraphqlConfiguration.setToken(bearer);
      print("Bearer $bearer");
      return true;
      //Make request to bakcend to get the current user logged in user
    } on FirebaseException catch (e) {
      rethrow;
    }
  }

  User getFirebaseUser() {
    return FirebaseAuth.instance.currentUser!;
  }

  Future<UserModel> getServerUser() async {
    try {
      //Once the token has been set get the client to query: Should have the authentication token.
      final GraphQLClient client = graphqlClient.clientToQuery();
      //Make Request to find the current user.
      QueryResult fetchedUser = await client
          .query(QueryOptions(document: gql(loginSchema.getTenant())));
      //Check for errors
      if (fetchedUser.hasException) {
        throw Exception(fetchedUser.exception);
      }
      final user = fetchedUser.data!['getTenantUser'];
      return UserModel(uid: user['uid']);
    } catch (e) {
      rethrow;
    }
  }
}
