import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../environment_variable/environment.dart';

class GraphqlConfiguration {
  static Link? link;
  static HttpLink httpLink = HttpLink(Environment.apiUrl);
  GraphqlConfiguration();

  //Set authentication token
  static void setToken(String token) {
    AuthLink alink = AuthLink(getToken: () async => 'Bearer $token');
    GraphqlConfiguration.link = alink.concat(GraphqlConfiguration.httpLink);
  }

  //Remove authentication token.
  static void removeToken() {
    GraphqlConfiguration.link = null;
  }

  // add value notifier
  // takes two parameters. link and cache.
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: getLink(),
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      link: getLink(),
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  static getLink() {
    return GraphqlConfiguration.link != null
        ? GraphqlConfiguration.link
        : GraphqlConfiguration.httpLink;
  }
}
