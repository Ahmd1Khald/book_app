import 'package:book_app/Feature/Home/presentatoin/view%20model/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/Feature/Home/presentatoin/view%20model/similar_books_cubit/similar_books_state.dart';
import 'package:book_app/Feature/Home/presentatoin/views/book_details_views.dart';
import 'package:book_app/Feature/Home/presentatoin/views/home_views.dart';
import 'package:book_app/Feature/search/presentation/views/search_view.dart';
import 'package:book_app/core/utiles/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Feature/Home/data/models/book_model/book_model.dart';
import '../../Feature/Home/data/repos/home_repo_imp.dart';
import '../../Feature/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeViews(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(bookModel: state.extra as BookModel,),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
