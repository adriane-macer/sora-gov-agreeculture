import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora_gov_agree/blocs/category_bloc/category_bloc.dart';
import 'package:sora_gov_agree/blocs/category_bloc/category_state.dart';
import 'package:sora_gov_agree/pages/category_page/category_screen.dart';
import 'package:sora_gov_agree/widgets/loading_indicator.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading || state is CategoryUninitialized)
          return Scaffold(body: LoadingIndicator());
        if (state is CategoryLoaded) {
          return CategoryScreen();
        }
        if (state is CategoryError) {
          return Scaffold(body: Text("Something went wrong"));
        }
        if (state is NoCategoryLoaded) {
          return Scaffold(body: Text("No Category Loaded"));
        }
        return Container();
      },
    );
  }
}
