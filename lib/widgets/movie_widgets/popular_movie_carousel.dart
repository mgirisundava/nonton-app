import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonton_app/models/arguments_id.dart';
import 'package:nonton_app/models/movie/movie_model.dart';
import 'package:nonton_app/pages/movie_detail_page.dart';

import '../../theme.dart';

class PopularMovieItem extends StatelessWidget {
  final MovieModel popularMovie;
  const PopularMovieItem({Key? key, required this.popularMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetailPage.routeName,
          arguments: ArgumentsId(popularMovie.id!),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500' +
                        popularMovie.backdropPath!,
                  ),
                  fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      lightBlack,
                    ])),
                padding: const EdgeInsets.all(
                  10,
                ),
                child: Text(
                  popularMovie.title!,
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
