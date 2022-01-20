import 'package:flutter/material.dart';
import 'package:nonton_app/models/arguments_id.dart';
import 'package:nonton_app/models/movie/movie_model.dart';
import 'package:nonton_app/pages/movie_detail_page.dart';

import '../../theme.dart';

class MovieCardItem extends StatefulWidget {
  final MovieModel movieData;
  const MovieCardItem({Key? key, required this.movieData}) : super(key: key);

  @override
  State<MovieCardItem> createState() => _MovieCardItemState();
}

class _MovieCardItemState extends State<MovieCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            MovieDetailPage.routeName,
            arguments: ArgumentsId(widget.movieData.id!),
          );
        },
        // child: Stack(
        //   children: [
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.movieData.posterPath!),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
              width: 110,
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movieData.title!,
                    style: whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      Text(
                        " ${widget.movieData.voteAverage}",
                        style: yellowTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // const Spacer(),
        // Consumer<MovieModel>(
        //   builder: (ctx, movieModel, _) => IconButton(
        //       onPressed: () {
        //         movieModel.toggleBookmarkStatus();
        //       },
        //       icon: movieModel.isBookmark
        //           ? Icon(
        //               Icons.bookmark_outline,
        //               size: 30,
        //               color: yellowColor,
        //             )
        //           : Icon(
        //               Icons.bookmark,
        //               size: 30,
        //               color: yellowColor,
        //             )),
        // ),
        //   ],
        // ),
      ),
    );
  }
}
