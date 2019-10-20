import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sora_gov_agree/blocs/subcategory_bloc/subcategory_event.dart';
import 'package:sora_gov_agree/blocs/subcategory_bloc/subcategory_state.dart';
import 'package:sora_gov_agree/models/subcategory.dart';
import 'package:sora_gov_agree/services/service_locator.dart';
import 'package:sora_gov_agree/services/subcategory_service.dart';

class SubcategoryBloc extends Bloc<SubcategoryEvent, SubcategoryState> {
  List<Subcategory> _subcategories = [];

  List<Subcategory> get subcategories => _subcategories;

  @override
  SubcategoryState get initialState => SubcategoryUninitialized();

  @override
  Stream<SubcategoryState> mapEventToState(SubcategoryEvent event) async* {
    if (event is FetchSubcategory) {
      yield SubcategoryLoading();
      try {
        Future.delayed(Duration(seconds: 3));
        _subcategories = await locator<SubcategoryService>().getLocalData();
        yield SubcategoryLoaded();
      } catch (e) {
        print(e);
        yield SubcategoryError(e);
      }
    }

    if (event is AddSubcategory) {
      final result = await locator<SubcategoryService>().insertSubcategory(
          name: event.name, symbol: event.symbol, categoryId: event.categoryId);

      if (result) {
        dispatch(FetchSubcategory());
      }
    }
  }
}
