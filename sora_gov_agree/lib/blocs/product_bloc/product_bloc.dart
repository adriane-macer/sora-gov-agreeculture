import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sora_gov_agree/blocs/product_bloc/product_event.dart';
import 'package:sora_gov_agree/blocs/product_bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  @override
  ProductState get initialState => ProductUninitialized();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    //TODO implement code
  }
}
