import 'package:book_app/Feature/Home/data/repos/home_repo_imp.dart';
import 'package:book_app/Feature/Home/presentatoin/view%20model/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/core/utiles/app_router.dart';
import 'package:book_app/core/utiles/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Feature/Home/presentatoin/view model/news_books_cubit/news_books_cubit.dart';
import 'bloc_observer.dart';
import 'constants.dart';
import 'core/utiles/api_service.dart';

void main() {
  //DioHelper.init();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewsBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewsBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Book App',
        theme: ThemeData.dark().copyWith(
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          scaffoldBackgroundColor: backgroundColor,
        ),
      ),
    );
  }
}
