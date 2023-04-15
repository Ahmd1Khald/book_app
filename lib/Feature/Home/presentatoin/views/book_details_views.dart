import 'package:book_app/Feature/Home/presentatoin/view%20model/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/Feature/Home/presentatoin/views/widgets/book_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/book_model/book_model.dart';


class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  final BookModel bookModel;



  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {

  @override
  void initState(){
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.bookModel.volumeInfo.categories![0]
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsBody(
        book: widget.bookModel,
      ),
    );
  }
}
