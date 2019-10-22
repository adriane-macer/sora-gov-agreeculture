import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_bloc.dart';
import 'package:sora_gov_agree/models/product.dart';

class MyFarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = BlocProvider.of<MyFarmBloc>(context).products;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${products[index].name}"),
            subtitle: _shortDetails(products[index]),
          );
        },
        itemCount: products.length,
      ),
    );
  }

  _shortDetails(Product product) {
    DateTime breedPlantDate;
    try {
      breedPlantDate = DateTime.parse(product.breedPlantDate);
    } catch (e) {
      print(e);
    }
    DateTime targetHarvestSellDate;
    try {
      targetHarvestSellDate = DateTime.parse(product.targetHarvestSellDate);
    } catch (e) {
      print(e);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${product.shortDescription ?? ""}"),
        (breedPlantDate != null)
            ? Text(
                "Date feed/plant started: ${breedPlantDate.month}/${breedPlantDate.day}${breedPlantDate.year}")
            : Container(),
        (targetHarvestSellDate != null)
            ? Text(
                "Date sell/harvest target: ${targetHarvestSellDate.month}/${targetHarvestSellDate.day}${targetHarvestSellDate.year}")
            : Container(),
      ],
    );
  }
}
