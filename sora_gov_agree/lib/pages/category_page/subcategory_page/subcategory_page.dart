import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora_gov_agree/blocs/subcategory_bloc/subcategory_bloc.dart';
import 'package:sora_gov_agree/blocs/subcategory_bloc/subcategory_state.dart';
import 'package:sora_gov_agree/pages/category_page/subcategory_page/subcategory_list.dart';
import 'package:sora_gov_agree/widgets/loading_indicator.dart';

class SubcategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubcategoryBloc, SubcategoryState>(
      builder: (context, state) {
        print(state);
        if(state is SubcategoryLoading || state is SubcategoryUninitialized)
          return Scaffold(body: LoadingIndicator());
        if(state is SubcategoryLoaded){
          return SubcategoryList();
        }
        if(state is SubcategoryError)
          {
            return Scaffold(body: Text("Something went wrong"));
          }
        if(state is NoSubcategoryLoaded)
          {
            return Scaffold(body: Text("No Subcategory Loaded"));
          }
        return Container();
      },
    );
  }
}