import 'package:bloc/bloc.dart';
import 'package:bloc_practice/events/products_events.dart';
import 'package:bloc_practice/state/products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(InitialProductsState()) {
    on<ProductsLoadEvent>((event, emit) async {
      emit(LoadingProductsState());
      
    });
  }
}
