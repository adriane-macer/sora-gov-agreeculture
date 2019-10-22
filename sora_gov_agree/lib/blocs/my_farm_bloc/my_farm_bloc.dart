import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_event.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_state.dart';
import 'package:sora_gov_agree/models/product.dart';
import 'package:sora_gov_agree/services/product_service.dart';
import 'package:sora_gov_agree/services/service_locator.dart';

class MyFarmBloc extends Bloc<MyFarmEvent, MyFarmState> {
  @override
  MyFarmState get initialState => MyFarmUninitialized();

  List<Product> _products = [];

  List<Product> get products => _products;

  @override
  Stream<MyFarmState> mapEventToState(MyFarmEvent event) async* {
    if (event is FetchMyFarm) {
      yield MyFarmLoading();
      try {
        _products = await locator<ProductService>().getLocalData();
        yield MyFarmLoaded();
      } catch (e) {
        print(e);
        yield MyFarmError(e);
      }
    }

    if (event is AddProduct) {
      try {
        final result = await locator<ProductService>().insertProduct(
          name: event.name,
          categoryId: event.categoryId,
          subCategoryId: event.subcategoryId,
          shortDescription: event.shortDescription,
          city: event.city,
          breedPlantDate: event.breedPlantDate,
          targetHarvestSellDate: event.targetHarvestSellDate,
        );
        if (result) {
          dispatch(FetchMyFarm());
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
