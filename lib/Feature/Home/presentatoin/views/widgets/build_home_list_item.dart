import 'package:book_app/core/utiles/assets_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utiles/app_router.dart';
import '../../../data/models/book_model/book_model.dart';
import 'costum_circle_indicator.dart';

class BuildHomeListViewItem extends StatelessWidget {
  const BuildHomeListViewItem({Key? key, required this.model})
      : super(key: key);

  final BookModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppRouter.router.push(AppRouter.kBookDetailsView, extra: model);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: AspectRatio(
              aspectRatio: 2.6 / 4,
              child: CachedNetworkImage(
                imageUrl: model.volumeInfo.imageLinks!.thumbnail??'',
                placeholder: (context, url) => const CustomCircleIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
