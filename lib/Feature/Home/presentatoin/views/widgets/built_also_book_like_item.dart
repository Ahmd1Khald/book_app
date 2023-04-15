import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utiles/assets_manager.dart';
import '../../../data/models/book_model/book_model.dart';
import 'costum_circle_indicator.dart';

class BuiltAlsoBookLikeItem extends StatelessWidget {
  const BuiltAlsoBookLikeItem({Key? key, required this.model}) : super(key: key);
  final BookModel model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.17,
        child: AspectRatio(
          aspectRatio: 2.8 / 4,
          child: CachedNetworkImage(
            imageUrl: model.volumeInfo!.imageLinks == null
                ? 'https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061131_960_720.png'
                : model.volumeInfo!.imageLinks!.thumbnail!,
            placeholder: (context, url) => const CustomCircleIndicator(),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}