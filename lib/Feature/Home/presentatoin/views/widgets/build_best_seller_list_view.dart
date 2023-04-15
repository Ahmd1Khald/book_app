import 'package:book_app/core/errors/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view model/featured_books_cubit/featured_books_cubit.dart';
import '../../view model/news_books_cubit/news_books_cubit.dart';
import 'build_best_seller_item.dart';
import 'costum_circle_indicator.dart';
import 'error_body.dart';

class BuildNewsBooksListView extends StatelessWidget {
  const BuildNewsBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBooksCubit, NewsBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SuccessNewsBooksState) {
          return ListView.separated(
            itemBuilder: (context, index) => BuildNewsBooksItem(model: state.books[index],),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          );
        } else if (state is ErrorNewsBooksState) {
          return ErrorBody(errorMessage: state.error);
        } else {
          return const CustomCircleIndicator();
        }
      },
    );
  }
}
