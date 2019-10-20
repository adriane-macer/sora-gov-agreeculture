import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sora_gov_agree/models/category.dart';

class CategoryEditScreen extends StatefulWidget {
  @override
  _CategoryEditScreenState createState() => _CategoryEditScreenState();
}

class _CategoryEditScreenState extends State<CategoryEditScreen> {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Category: ${category.name}",
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "Symbol: ${category.symbol}",
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Subcategories",
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
