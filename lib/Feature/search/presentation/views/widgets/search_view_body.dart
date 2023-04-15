import 'package:book_app/Feature/Home/presentatoin/views/widgets/build_best_seller_list_view.dart';
import 'package:book_app/Feature/search/presentation/views/widgets/search_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SearchTextFormField(),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchResultItems(),
          ),
        ],
      ),
    );
  }
}

class SearchResultItems extends StatelessWidget {
  const SearchResultItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BuildNewsBooksListView();
  }
}




