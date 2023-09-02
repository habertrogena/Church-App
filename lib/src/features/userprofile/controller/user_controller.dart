import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rentals_app/services/graphql/graphql.dart';
import 'package:rentals_app/services/graphql/schema/user_profile_schema.dart';
import '../model/user_model.dart';

class UserProfileController {
  UserSchema userSchema = UserSchema();
  GraphqlConfiguration graphqlConfig = GraphqlConfiguration();

  //Get the user profile
  getUserProfile() async {
    //Get the user to fetch the infomation for.
    //Get graphql client to query
    GraphQLClient client = graphqlConfig.clientToQuery();

    //For mulate the request
    QueryResult<Object> results = await client.query(
      QueryOptions(document: userSchema.getProfile(), variables: {}),
    );
    //Check for server errors
    if (results.hasException) {
      throw Exception(results.exception);
    }
  }

  //TODO: Write the get property details function
  Future<UserProfile> updateUser(Map<String, Object?> userProfileData) async {
    //Get client to query
    GraphQLClient client = graphqlConfig.clientToQuery();

    QueryResult results = await client.mutate(
      MutationOptions(
        document: userSchema.updateTenant(),
        variables: {
          "uid": userProfileData['uid'],
          "updateClient": {
            "name": userProfileData['name'],
            "title": userProfileData['title'],
            "phoneNo": userProfileData['phoneNo'],
            "contact": userProfileData['contact']
          }
        },
      ),
    );
    if (results.hasException) {
      throw Exception(results.exception);
    }

    return UserProfile();
  }
}
