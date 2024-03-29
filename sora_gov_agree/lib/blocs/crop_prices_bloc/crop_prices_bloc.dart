import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sora_gov_agree/blocs/crop_prices_bloc/crop_prices_event.dart';
import 'package:sora_gov_agree/blocs/crop_prices_bloc/crop_prices_state.dart';

class CropPricesBloc extends Bloc<CropPricesEvent, CropPricesState> {
  @override
  CropPricesState get initialState => CropPricesUninitialized();

  @override
  Stream<CropPricesState> mapEventToState(CropPricesEvent event) async* {
    if (event is FetchCropPrices) {
      yield CropPricesLoading();
      //TODO implement code
      await Future.delayed((Duration(seconds: 3)));
      yield CropPricesLoaded();
    }
  }
}
