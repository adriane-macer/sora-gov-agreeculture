import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:sora_gov_agree/blocs/category_bloc/category_bloc.dart';
import 'package:sora_gov_agree/blocs/category_bloc/category_event.dart';
import 'package:sora_gov_agree/blocs/subcategory_bloc/subcategory_bloc.dart';
import 'package:sora_gov_agree/blocs/subcategory_bloc/subcategory_event.dart';
import 'package:sora_gov_agree/models/category.dart';
import 'package:sora_gov_agree/pages/category_page/category_edit_screen.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Category> categories =
        BlocProvider.of<CategoryBloc>(context).categories;
    return Scaffold(
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MultiProvider(providers: [
                        Provider<Category>.value(value: categories[index]),
                        BlocProvider<SubcategoryBloc>(
                          builder: (context) => SubcategoryBloc()
                            ..dispatch(FetchSubcategory(categories[index].id)),
                        )
                      ], child: CategoryEditScreen());
                    },
                  ),
                );
              },
              child: ListTile(
                title: Text("Category:\t${categories[index]?.name}"),
                subtitle: Text("Symbol:\t${categories[index]?.symbol}"),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final Map result = await _addCategoryDialog(context);
          if (result != null) {
            final bloc = BlocProvider.of<CategoryBloc>(context);
            bloc.dispatch(AddCategory(result['name'], result['symbol']));
          }
        },
      ),
    );
  }

  Future<Map> _addCategoryDialog(BuildContext context) async {
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
                    decoration: InputDecoration(labelText: "Category name"),
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
        title: Text("Add category"),
        actions: <Widget>[
          RaisedButton(
            onPressed: () async {
              _fbKey.currentState.save();
              if (!_fbKey.currentState.validate()) {
                return;
              }
              print(_fbKey.currentState.value);
              Navigator.pop(context, _fbKey.currentState.value);
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
