import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:month5_lesson2/config/graphql_config.dart';
import 'package:month5_lesson2/screens/home_screen.dart';

void main() {
  final client = GraphqlConfig.initializeClient();

  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;
  const MyApp({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
