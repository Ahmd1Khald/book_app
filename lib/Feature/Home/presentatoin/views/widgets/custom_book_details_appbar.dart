import 'package:book_app/core/utiles/app_router.dart';
import 'package:flutter/material.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20, right: 24, left: 24),
      child: Row(
        children: [
          IconButton(onPressed: () {
            AppRouter.router.pop();
          }, icon: const Icon(Icons.close)),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
    );
  }
}