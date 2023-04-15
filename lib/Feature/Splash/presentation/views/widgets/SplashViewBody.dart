import 'package:book_app/Feature/Home/presentatoin/views/home_views.dart';
import 'package:book_app/Feature/Splash/presentation/views/widgets/sliding_animation_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utiles/app_router.dart';
import '../../../../../core/utiles/assets_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(image: AssetImage(AssetsImages.splashLogo)),
            const SizedBox(
              height: 5,
            ),
            SlidingAnimationText(slidingAnimation: slidingAnimation)
          ],
        );
      },
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Get.to(() => const HomeViews(),
        //     // calculations
        //     transition: Transition.fade,
        //     duration: const Duration(milliseconds: 250));

         GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
      },
    );
  }
}
