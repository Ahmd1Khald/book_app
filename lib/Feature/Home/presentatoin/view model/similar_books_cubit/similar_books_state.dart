
import '../../../data/models/book_model/book_model.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class LoadingSimilarBooksState extends SimilarBooksState {}

class ErrorSimilarBooksState extends SimilarBooksState {
  final String error;

  ErrorSimilarBooksState(this.error);
}

class SuccessSimilarBooksState extends SimilarBooksState {
  final List<BookModel> books;

  SuccessSimilarBooksState(this.books);
}
