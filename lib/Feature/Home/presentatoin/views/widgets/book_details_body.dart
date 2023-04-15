import 'package:book_app/core/utiles/stayles.dart';
import 'package:flutter/material.dart';
import '../../../data/models/book_model/book_model.dart';
import 'book_details_main_data.dart';
import 'build_also_book_like_listview.dart';
import 'custom_book_details_appbar.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({Key? key, required this.book,}) : super(key: key);

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBookDetailsAppBar(),
          BookDetailsMainData(book: book,),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * .01,),
                Text(
                  'You can also like',
                  style:
                  Styles.textStyle20.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                const BuildAlsoBookLikeListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
