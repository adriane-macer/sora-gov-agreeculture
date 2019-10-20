import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sora_gov_agree/blocs/category_bloc/category_event.dart';
import 'package:sora_gov_agree/blocs/category_bloc/category_state.dart';
import 'package:sora_gov_agree/models/category.dart';
import 'package:sora_gov_agree/services/category_service.dart';
import 'package:sora_gov_agree/services/service_locator.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  @override
  CategoryState get initialState => CategoryUninitialized();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is FetchCategory) {
      yield CategoryLoading();
      try {
        _categories = await locator<CategoryService>().getLocalData();
        yield CategoryLoaded();
      } catch (e) {
        print(e);
        yield CategoryError(e);
      }
    }

    if (event is AddCategory) {
      final result = await locator<CategoryService>()
          .insertCategory(name: event.name, symbol: event.symbol);

      if (result) {
        dispatch(FetchCategory());
      }
    }
  }
}
