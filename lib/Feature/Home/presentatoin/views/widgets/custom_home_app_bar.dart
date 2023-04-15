import 'package:book_app/core/utiles/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utiles/assets_manager.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20, right: 24, left: 24),
      child: Row(
        children: [
          const Image(
            image: AssetImage(AssetsImages.splashLogo),
            height: 20,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                AppRouter.router.push(AppRouter.kSearchView);
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
              )),
        ],
      ),
    );
  }
}