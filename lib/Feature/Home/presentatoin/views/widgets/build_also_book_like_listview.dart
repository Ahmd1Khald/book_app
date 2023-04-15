import 'package:book_app/Feature/Home/presentatoin/view%20model/similar_books_cubit/similar_books_state.dart';
import 'package:book_app/Feature/Home/presentatoin/views/widgets/costum_circle_indicator.dart';
import 'package:book_app/Feature/Home/presentatoin/views/widgets/error_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view model/similar_books_cubit/similar_books_cubit.dart';
import 'built_also_book_like_item.dart';

class BuildAlsoBookLikeListView extends StatelessWidget {
  const BuildAlsoBookLikeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is SuccessSimilarBooksState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => BuiltAlsoBookLikeItem(
                      model: state.books[index],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: state.books.length),
          );
        } else if (state is ErrorSimilarBooksState) {
          return ErrorBody(errorMessage: state.error);
        } else {
          return const CustomCircleIndicator();
        }
      },
    );
  }
}
