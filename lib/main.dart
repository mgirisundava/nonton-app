import 'package:flutter/material.dart';
import 'package:nonton_app/models/movie/movie_model.dart';
import 'package:nonton_app/pages/main_page.dart';
import 'package:nonton_app/pages/movie_detail_page.dart';
import 'package:nonton_app/pages/people_detail_page.dart';
import 'package:nonton_app/pages/tv_detail_page.dart';
import 'package:nonton_app/providers/movie/movie_detail_provider.dart';
import 'package:nonton_app/providers/movie/movies_provider.dart';
import 'package:nonton_app/providers/people/people_detail_provider.dart';
import 'package:nonton_app/providers/people/people_provider.dart';
import 'package:nonton_app/providers/search_movies.dart';
import 'package:nonton_app/providers/tv/tv_detail_provider.dart';
import 'package:nonton_app/providers/tv/tv_provider.dart';

import 'package:nonton_app/theme.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieDetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TvProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TvDetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PeopleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PeopleDetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchMovies(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: backgroundColor,
          body: const MainPage(),
        ),
        routes: {
          MovieDetailPage.routeName: (context) => const MovieDetailPage(),
          TvDetailPage.routeName: (context) => const TvDetailPage(),
          PeopleDetailPage.routeName: (context) => const PeopleDetailPage()
        },
      ),
    );
  }
}
