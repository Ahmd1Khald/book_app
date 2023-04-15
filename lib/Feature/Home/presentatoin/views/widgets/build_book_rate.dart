import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utiles/stayles.dart';

class BooksRate extends StatelessWidget {
  const BooksRate({Key? key, required this.count, required this.rate,}) : super(key: key);

  final num count;
  final num rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(FontAwesomeIcons.solidStar,color: Colors.yellow,size: 18,),
        const SizedBox(width: 6.3,),
        Text(rate.toString(),style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),),
        const SizedBox(width: 5,),
        Text("(${count.toString()})",style: Styles.textStyle14.copyWith(color: Colors.grey),),
      ],
    );
  }
}