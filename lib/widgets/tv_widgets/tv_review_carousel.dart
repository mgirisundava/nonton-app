import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonton_app/models/review_model.dart';
import 'package:nonton_app/theme.dart';

class TvReviewCarousel extends StatelessWidget {
  final ReviewModel reviewData;
  const TvReviewCarousel({Key? key, required this.reviewData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            reviewData.author,
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            reviewData.content,
            style: whiteTextStyle.copyWith(
              color: whiteColor.withOpacity(0.5),
              fontSize: 14,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Read full : ",
            style: whiteTextStyle.copyWith(
              color: whiteColor.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
          Text(
            reviewData.url,
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
