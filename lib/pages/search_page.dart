import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nonton_app/models/arguments_id.dart';
import 'package:nonton_app/models/movie/search_model.dart';
import 'package:nonton_app/providers/search_movies.dart';
import 'package:nonton_app/theme.dart';
import 'package:nonton_app/widgets/search_widget.dart';

import 'movie_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SearchModel> searchModel = [];
  String query = '';
  Timer? debouncer;

  // @override
  // void initState() {
  //   super.initState();

  //   init();
  // }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final getSearch = await SearchMovies.getSearchData(query);

    setState(() => searchModel = getSearch);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: searchModel.length,
                itemBuilder: (context, index) {
                  final searchMovies = searchModel[index];
                  return buildSearchMovies(searchMovies);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search Movies',
        onSubmitted: searchData,
      );

  Future searchData(String query) async => debounce(() async {
        final getSearch = await SearchMovies.getSearchData(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          searchModel = getSearch;
        });
      });

  Widget buildSearchMovies(SearchModel searchData) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: () {
            // searchData.mediaType == "tv"
            // Navigator.pushNamed(
            //     context,
            //     TvDetailPage.routeName,
            //     arguments: ArgumentsId(searchData.id),
            //   )
            // :
            Navigator.pushNamed(
              context,
              MovieDetailPage.routeName,
              arguments: ArgumentsId(searchData.id),
            );
          },
          child: ListTile(
            leading: Image.network(
              searchData.posterPath,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            title: Text(
              searchData.title!,
              style: whiteTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
}
