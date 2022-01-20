import 'package:flutter/material.dart';
import 'package:nonton_app/models/arguments_id.dart';
import 'package:nonton_app/models/tv/tv_model.dart';
import 'package:nonton_app/pages/tv_detail_page.dart';

import '../../theme.dart';

class TvCardItem extends StatelessWidget {
  final TvModel tvData;
  const TvCardItem({
    Key? key,
    required this.tvData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            TvDetailPage.routeName,
            arguments: ArgumentsId(tvData.id),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(tvData.posterPath),
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
                    tvData.name,
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
                        " ${tvData.voteAverage}",
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
