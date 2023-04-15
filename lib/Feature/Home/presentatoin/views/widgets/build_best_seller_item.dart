import 'package:book_app/Feature/Home/presentatoin/views/widgets/costum_circle_indicator.dart';
import 'package:book_app/core/utiles/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utiles/assets_manager.dart';
import '../../../../../core/utiles/constants.dart';
import '../../../../../core/utiles/stayles.dart';
import '../../../data/models/book_model/book_model.dart';
import 'build_book_rate.dart';

class BuildNewsBooksItem extends StatelessWidget {
  const BuildNewsBooksItem({Key? key, required this.model}) : super(key: key);

  final BookModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.router.push(AppRouter.kBookDetailsView, extra: model);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.17,
              child: AspectRatio(
                aspectRatio: 2.2 / 4,
                child: CachedNetworkImage(
                  imageUrl:model.volumeInfo.imageLinks?.thumbnail??errorImage,
                  placeholder: (context, url) => const CustomCircleIndicator(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(model.volumeInfo.title ?? 'No title',
                        style: Styles.textStyle20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis)),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  model.volumeInfo.authors?[0] ?? 'No author',
                  style: Styles.textStyle14.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Free',
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    BooksRate(
                      count: model.volumeInfo!.ratingsCount ?? 0,
                      rate: model.volumeInfo!.averageRating ?? 0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
