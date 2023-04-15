import 'package:book_app/core/utiles/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utiles/assets_manager.dart';
import '../../../../../core/utiles/function/launch_url.dart';
import '../../../../../core/utiles/stayles.dart';
import '../../../data/models/book_model/book_model.dart';
import 'build_book_rate.dart';
import 'costum_circle_indicator.dart';

class BookDetailsMainData extends StatelessWidget {
  const BookDetailsMainData({Key? key, required this.book,}) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.19,
            child: AspectRatio(
              aspectRatio: 2.8 / 4,
              child: CachedNetworkImage(
                imageUrl: book.volumeInfo.imageLinks?.thumbnail??errorImage,
                placeholder: (context, url) => const CustomCircleIndicator(),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          book.volumeInfo.title??'No title',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold,fontSize: 25),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          book.volumeInfo.authors![0]??'No Author',
          style: Styles.textStyle16
              .copyWith(color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 7,
        ),
        //BooksRate(count: ,rate: ,),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: (){},
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.width * .13,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
                child: Center(
                    child: Text(
                      'Free',
                      style: Styles.textStyle20.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
              ),
            ),
            MaterialButton(
              onPressed: (){
                launchCustomUr(context, book.volumeInfo.previewLink);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.width * .13,
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Center(
                    child: Text(
                      getText(book),
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

String getText(BookModel bookModel) {
  if (bookModel.volumeInfo.previewLink == null) {
    return 'Not Avaliable';
  } else {
    return 'Preview';
  }
}