import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlConfig {
  static HttpLink httpLink =
      HttpLink("https://youtu.be/RjrA-slMoZ4?feature=shared");

  static ValueNotifier<GraphQLClient> initializeClient() {
    final Link link = httpLink;

    return ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      ),
    );
  }
}
