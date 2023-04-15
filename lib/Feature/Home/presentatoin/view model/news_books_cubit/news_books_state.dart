part of 'news_books_cubit.dart';

@immutable
abstract class NewsBooksState {}

class NewsBooksInitialState extends NewsBooksState {}

class LoadingNewsBooksState extends NewsBooksState {}

class ErrorNewsBooksState extends NewsBooksState {
  final String error;

  ErrorNewsBooksState(this.error);
}

class SuccessNewsBooksState extends NewsBooksState {
  final List<BookModel> books;

  SuccessNewsBooksState(this.books);
}
