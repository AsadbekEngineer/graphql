import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:month5_lesson2/core/constants/graphql_queries.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
        options: QueryOptions(
          document: gql(fetchProducts),
        ),
        builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}){
        if(result.hasException){
          return Text(result.exception.toString());
        }if(result.isLoading){
          return Center(child: CircularProgressIndicator());
        }
        List products = result.data!['products'];

        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index){
            final product = products[index];

            return ListTile(
              title: Text(product['title']),
              subtitle: Text(product['description']),
            );
          },
        );
        }
      ),
    );
  }
}
