import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryLoadEvent extends CategoryEvent {
  final String? name;
  CategoryLoadEvent({this.name});

  @override
  List<Object?> get props => [name];
}
