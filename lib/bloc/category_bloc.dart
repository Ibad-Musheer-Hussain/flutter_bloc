import 'package:bloc/bloc.dart';
import 'package:bloc_practice/events/category_events.dart';
import 'package:bloc_practice/state/category_state.dart';
import 'package:bloc_practice/repo/category_repo.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo categoryRepo;

  CategoryBloc({required this.categoryRepo}) : super(InitialCategoryState()) {
    on<CategoryLoadEvent>((event, emit) async {
      emit(LoadingCategoryState());
      try {
        final data = await categoryRepo.fetchData();
        emit(LoadedCategoryState(data: data));
      } catch (e) {
        emit(ErrorCategoryState(errorMessage: e.toString()));
      }
    });
  }
}
