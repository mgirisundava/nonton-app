import 'package:flutter/material.dart';
import 'package:nonton_app/models/arguments_id.dart';
import 'package:nonton_app/models/credit_model.dart';
import 'package:nonton_app/pages/people_detail_page.dart';

import '../../theme.dart';

class MovieCastItem extends StatelessWidget {
  final CreditModel movieCast;
  const MovieCastItem({Key? key, required this.movieCast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PeopleDetailPage.routeName,
            arguments: ArgumentsId(movieCast.id));
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            Container(
              width: 110,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(movieCast.profilePath!),
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
                    movieCast.name,
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
                        movieCast.popularity.toString(),
                        style: yellowTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
