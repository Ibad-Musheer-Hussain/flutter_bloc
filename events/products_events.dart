import 'package:equatable/equatable.dart';

abstract class ProductsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductsLoadEvent extends ProductsEvent {
  final String name;
  ProductsLoadEvent({required this.name});

  @override
  List<Object?> get props => [name];
}
