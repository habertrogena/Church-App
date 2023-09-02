import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../services/environment_variable/environment.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // add the graphql endpoint
    final HttpLink httpLink = HttpLink(Environment.apiUrl);

    // add value notifier
    // takes two parameters. link and cache.
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );
    // create the query string
    const String tenantProfileQuery = r'''
    query GetTenantProfile {
      getTenantProfile {
        name
        title
        contact
        phone
        email
        quarterly
        start_date
        amount
        roomNo
        size
        deposit
        user {
          imageUrl
          user_type
          stat
        }
      }
    }
  ''';
    return GraphQLProvider(
      client: client,
      child: Scaffold(
        body: Query(
            options: QueryOptions(
              document: gql(tenantProfileQuery),
            ),
            builder: (QueryResult result,
                {VoidCallback? refetch, FetchMore? fetchMore}) {
              // error cheking
              if (result.hasException) {
                return const Center(
                  child: Text('Error fetching user profile details'),
                );
              }

              if (result.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              final tenantProfileData = result.data!['getTenantProfile'];
              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(tenantProfileData['name']),
                    subtitle: Text(tenantProfileData['title']),
                  ),
                  ListTile(
                    leading: const Icon(Icons.contact_mail),
                    title:
                        Text('Contact: ${tenantProfileData['contact'] ?? ''}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text('Phone: ${tenantProfileData['phone'] ?? ''}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: Text('Email: ${tenantProfileData['email'] ?? ''}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text('Quarterly: ${tenantProfileData['quarterly']}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title:
                        Text('Start Date: ${tenantProfileData['start_date']}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.attach_money),
                    title: Text('Amount: ${tenantProfileData['amount']}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: Text('Room No: ${tenantProfileData['roomNo']}'),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
