import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_bloc.dart';

class MyFarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = BlocProvider.of<MyFarmBloc>(context).products;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${products[index].name}"),
            subtitle: Text("${products[index].shortDescription}"),
          );
        },
        itemCount: products.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {},
      ),
    );
  }
}
