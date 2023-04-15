import 'package:book_app/Feature/Home/presentatoin/view%20model/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/Feature/Home/presentatoin/views/widgets/build_home_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'costum_circle_indicator.dart';
import 'error_body.dart';

class BuildHomeBooksList extends StatelessWidget {
  const BuildHomeBooksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SuccessFeaturedBooksState) {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => BuildHomeListViewItem(model: state.books[index]),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
            ),
          );
        } else if (state is ErrorFeaturedBooksState) {
          return ErrorBody(errorMessage: state.error);
        } else {
          return const CustomCircleIndicator();
        }
      },
    );
  }
}
