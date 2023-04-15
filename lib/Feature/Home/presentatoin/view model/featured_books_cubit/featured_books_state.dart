part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitialState extends FeaturedBooksState {}

class LoadingFeaturedBooksState extends FeaturedBooksState {}

class ErrorFeaturedBooksState extends FeaturedBooksState {
  final String error;

  ErrorFeaturedBooksState(this.error);
}

class SuccessFeaturedBooksState extends FeaturedBooksState {
  final List<BookModel> books;

  SuccessFeaturedBooksState(this.books);
}
