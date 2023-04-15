import 'package:book_app/Feature/Home/presentatoin/views/widgets/build_best_seller_list_view.dart';
import 'package:book_app/Feature/Home/presentatoin/views/widgets/build_home_books_list.dart';
import 'package:book_app/core/utiles/assets_manager.dart';
import 'package:book_app/core/utiles/stayles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import 'build_best_seller_item.dart';
import 'build_home_list_item.dart';
import 'custom_home_app_bar.dart';

class HomeViewsBody extends StatelessWidget {
  const HomeViewsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0,right: 10.0),
            child: CustomHomeAppBar(),
          ),
          //CustomListViewItem(),
          BuildHomeBooksList(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(right: 30.0,left: 30,bottom: 10),
            child: Text(
              'News Books',
              style: Styles.textStyle18,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: BuildNewsBooksListView(),
          ),
        ],
      ),
    );
  }
}
