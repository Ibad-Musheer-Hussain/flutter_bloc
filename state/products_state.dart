import 'package:equatable/equatable.dart';

abstract class ProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialProductsState extends ProductsState {}

class LoadingProductsState extends ProductsState {}

class LoadedProductsState extends ProductsState {
  final String name;
  LoadedProductsState({required this.name});

  @override
  List<Object?> get props => [name];
}

class ErrorProductsState extends ProductsState {
  final String errorMessage;

  ErrorProductsState({required this.errorMessage});
}
