import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'news_books_state.dart';

class NewsBooksCubit extends Cubit<NewsBooksState> {
  NewsBooksCubit(this.homeRepo) : super(NewsBooksInitialState());

  final HomeRepo homeRepo;

  Future<void> fetchNewsBooks() async {
    emit(LoadingNewsBooksState());
    var result = await homeRepo.fetchNewsBooks();
    result.fold((failure) {
      emit(ErrorNewsBooksState(failure.errMessage));
    }, (books) {
      emit(SuccessNewsBooksState(books));
    });
  }
}
