import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nonton_app/models/arguments_id.dart';
import 'package:nonton_app/models/movie/movie_model.dart';
import 'package:nonton_app/pages/movie_detail_page.dart';
import 'package:nonton_app/theme.dart';

class SimiliarMovieItem extends StatelessWidget {
  final MovieModel similiarMovie;
  const SimiliarMovieItem({Key? key, required this.similiarMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          MovieDetailPage.routeName,
          arguments: ArgumentsId(similiarMovie.id!),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 110,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    similiarMovie.posterPath!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
              width: 110,
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    similiarMovie.title!,
                    style: whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: yellowColor,
                        size: 18,
                      ),
                      Text(
                        " ${similiarMovie.voteAverage}",
                        style: yellowTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
