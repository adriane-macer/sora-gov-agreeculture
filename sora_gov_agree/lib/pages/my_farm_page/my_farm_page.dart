import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_bloc.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_event.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_state.dart';
import 'package:sora_gov_agree/models/category.dart';
import 'package:sora_gov_agree/models/subcategory.dart';
import 'package:sora_gov_agree/pages/my_farm_page/my_farm_screen.dart';
import 'package:sora_gov_agree/services/category_service.dart';
import 'package:sora_gov_agree/services/service_locator.dart';
import 'package:sora_gov_agree/services/subcategory_service.dart';
import 'package:sora_gov_agree/widgets/loading_indicator.dart';

class MyFarmPage extends StatefulWidget {
  @override
  _MyFarmPageState createState() => _MyFarmPageState();
}

class _MyFarmPageState extends State<MyFarmPage> {
  List<Subcategory> _subcategoriesByCategory = [];
  List<Category> _categories;

  @override
  initState() {
    super.initState();
    _formState = FormBuilder.of(context);
    _formState?.registerFieldKey("subcategory_id", _fbSubcategoryKey);
    _initKeys();
  }

  @override
  dispose() {
    super.dispose();
    _formState?.unregisterFieldKey("subcategory_id");
  }

  Future _initKeys() async {
    _categories = await locator<CategoryService>().getLocalData();
    subcategories = await locator<SubcategoryService>().getSubCategories();
  }

  List<Subcategory> subcategories = [];
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormFieldState> _fbSubcategoryKey =
      GlobalKey<FormFieldState>();
  FormBuilderState _formState;
  String _subcategoryValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFarmBloc, MyFarmState>(
      builder: (context, state) {
        if (state is MyFarmLoading || state is MyFarmUninitialized)
          return Scaffold(body: LoadingIndicator());
        if (state is MyFarmLoaded) {
          return Scaffold(
            body: MyFarmScreen(),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                final result = await _addProductDialog(context);
                if (null != result) {
                  final bloc = BlocProvider.of<MyFarmBloc>(context);
                  bloc.dispatch(AddProduct(
                    categoryId: result['category_id'],
                    subcategoryId: result['subcategory_id'],
                    name: result['name'],
                    city: result['city'],
                    shortDescription: result['short_description'],
                    breedPlantDate: result['breed_plant_date'],
                    targetHarvestSellDate: result['target_harvest_sell_date'],
                  ));
                }
              },
            ),
          );
        }
        if (state is MyFarmError) {
          return Scaffold(body: Text("Something went wrong"));
        }
        if (state is NoMyFarmLoaded) {
          return Scaffold(body: Text("No Data"));
        }
        return Container();
      },
    );
  }

  Future<Map> _addProductDialog(BuildContext context) async {
    return await showDialog<Map>(
      context: context,
      builder: (context) => AlertDialog(
        content: FormBuilder(
          key: _fbKey,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FormField(builder: (FormFieldState<dynamic> field) {
                    return FormBuilderDropdown(
                      attribute: "category_id",
                      decoration: InputDecoration(labelText: "Category"),
                      hint: Text('Select Category'),
                      items: _categories
                          .map((category) => DropdownMenuItem(
                              value: category.id,
                              child: Text("${category.name}")))
                          .toList(),
                      onChanged: (value) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        field.didChange(value);
                        _formState?.setAttributeValue("subcategory_id", null);
                        _subcategoriesByCategory = subcategories
                            .where((v) => v.categoryId == value)
                            .toList();
                        _subcategoryValue = null;
                        setState(
                          () {},
                        );
                      },
                    );
                  }),
                  SizedBox(
                    height: 10.0,
                  ),
                  FormField(
                    key: _fbSubcategoryKey,
                    enabled: true,
                    validator: (val) => FormBuilderValidators.required()(val),
                    onSaved: (val) {
                      final Subcategory subcategory = val;
                      _formState?.setAttributeValue(
                          "subcategory_id", subcategory?.id ?? null);
                    },
                    builder: (FormFieldState<dynamic> field) {
                      return Container(
                        child: InputDecorator(
                          decoration: InputDecoration(
                            errorText: field.errorText,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            labelText: "Subcategory",
                          ),
                          child: DropdownButton(
                            elevation: 10,
                            items: _subcategoriesByCategory.map((subcategory) {
                              return DropdownMenuItem(
                                  value: subcategory,
                                  child: Text("${subcategory.name}"));
                            }).toList(),
                            onChanged: (value) {
                              final Subcategory subcategory = value;
                              _subcategoryValue = subcategory.name;
                              FocusScope.of(context).requestFocus(FocusNode());
                              field.didChange(value);
                              setState(() {});
                            },
                            underline: Divider(
                              height: 3.0,
                            ),
                            hint: Text(
                              _subcategoryValue == null
                                  ? "Select subcategory"
                                  : _subcategoryValue,
                            ),
                            isExpanded: true,
                          ),
                        ),
                      );
                    },
                  ),
                  FormBuilderTextField(
                    attribute: "name",
                    decoration: InputDecoration(labelText: "Product name"),
                    validators: [FormBuilderValidators.required()],
                  ),
                  FormBuilderTextField(
                    attribute: "city",
                    decoration: InputDecoration(labelText: "City"),
                    validators: [FormBuilderValidators.required()],
                  ),
                  FormBuilderTextField(
                    attribute: "short_description",
                    decoration: InputDecoration(labelText: "Description"),
                  ),
                  FormBuilderDateTimePicker(
                    attribute: "breed_plant_date",
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: "Date plant/breed"),
                    validators: [FormBuilderValidators.required()],
                  ),
                  FormBuilderDateTimePicker(
                    attribute: "target_harvest_sell_date",
                    inputType: InputType.date,
                    decoration:
                        InputDecoration(labelText: "Target harvest/sell date"),
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
        title: Text("Add product"),
        actions: <Widget>[
          RaisedButton(
            onPressed: () async {
              _fbKey.currentState.save();
              if (!_fbKey.currentState.validate()) {
                return;
              }
              var fieldsValue = _fbKey.currentState.value;
              fieldsValue.putIfAbsent(
                  "createdAt", () => DateTime.now().toString());
              fieldsValue.putIfAbsent(
                  "updatedAt", () => DateTime.now().toString());

              DateTime breedPlantDate = fieldsValue["breed_plant_date"];
              fieldsValue["breed_plant_date"] =
                  breedPlantDate?.toIso8601String();
              DateTime targetHarvestSellDate =
                  fieldsValue["target_harvest_sell_date"];
              fieldsValue["target_harvest_sell_date"] =
                  targetHarvestSellDate?.toIso8601String();
              _subcategoryValue = null;
              _subcategoriesByCategory = [];
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
              _subcategoryValue = null;
              _subcategoriesByCategory = [];
              Navigator.pop(context, null);
            },
          ),
        ],
      ),
    );
  }
}
