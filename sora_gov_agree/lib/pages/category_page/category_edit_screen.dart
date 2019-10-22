import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:sora_gov_agree/blocs/subcategory_bloc/subcategory_bloc.dart';
import 'package:sora_gov_agree/blocs/subcategory_bloc/subcategory_event.dart';
import 'package:sora_gov_agree/helpers/db_constants.dart';
import 'package:sora_gov_agree/models/category.dart';
import 'package:sora_gov_agree/pages/category_page/subcategory_page/subcategory_list.dart';
import 'package:sora_gov_agree/pages/category_page/subcategory_page/subcategory_page.dart';

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
        title: Text("${category.name}"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final Map result = await _addSubCategoryDialog(context, category);
          if (result != null) {
            final bloc = BlocProvider.of<SubcategoryBloc>(context);
            bloc.dispatch(AddSubcategory(
                result['name'], result['symbol'], result['category_id']));
          }
        },
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
            Expanded(
              child: SubcategoryPage(),
            )
          ],
        ),
      ),
    );
  }

  Future<Map> _addSubCategoryDialog(
      BuildContext context, Category category) async {
    final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
    return await showDialog<Map>(
      context: context,
      builder: (context) => AlertDialog(
        content: FormBuilder(
          key: _fbKey,
          child: Container(
            height: 400.0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FormBuilderTextField(
                    attribute: "name",
                    decoration: InputDecoration(labelText: "Subcategory name"),
//                onChanged: (_){},
                    validators: [FormBuilderValidators.required()],
                  ),
                  FormBuilderTextField(
                    attribute: "symbol",
                    decoration: InputDecoration(labelText: "Symbol"),
//                onChanged: (_){},
                    validators: [FormBuilderValidators.required()],
                  ),
                ],
              ),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text("Add subcategory for ${category.name}"),
        actions: <Widget>[
          RaisedButton(
            onPressed: () async {
              _fbKey.currentState.save();
              if (!_fbKey.currentState.validate()) {
                return;
              }
              var fieldsValue = _fbKey.currentState.value;
              fieldsValue.putIfAbsent("category_id", () => category.id);
              Navigator.pop(context, fieldsValue);
            },
            color: Colors.white,
            child: Text(
              'Add',
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context, null);
            },
          ),
        ],
      ),
    );
  }
}
