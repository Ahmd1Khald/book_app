import 'package:book_app/Feature/Home/presentatoin/views/widgets/home_views_body.dart';
import 'package:flutter/material.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeViewsBody()),
    );
  }
}
