import 'package:bloc/bloc.dart';
import 'package:book_app/Feature/Home/presentatoin/view%20model/similar_books_cubit/similar_books_state.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/home_repo.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(LoadingSimilarBooksState());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(ErrorSimilarBooksState(failure.errMessage));
    }, (books) {
      emit(SuccessSimilarBooksState(books));
    });
  }
}
