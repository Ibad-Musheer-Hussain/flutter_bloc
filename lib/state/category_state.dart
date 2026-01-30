import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialCategoryState extends CategoryState {}

class LoadingCategoryState extends CategoryState {}

class LoadedCategoryState extends CategoryState {
  final dynamic data;
  LoadedCategoryState({required this.data});

  @override
  List<Object?> get props => [data];
}

class ErrorCategoryState extends CategoryState {
  final String errorMessage;

  ErrorCategoryState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
