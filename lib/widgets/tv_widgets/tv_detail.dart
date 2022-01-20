import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:nonton_app/models/arguments_id.dart';
import 'package:nonton_app/providers/tv/tv_provider.dart';
import 'package:nonton_app/widgets/tv_widgets/tv_cast_item.dart';
import 'package:nonton_app/widgets/tv_widgets/tv_review_carousel.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../theme.dart';

class TvDetail extends StatefulWidget {
  final String name;
  final String backdropPath;
  final String posterPath;
  final String overview;
  final num voteAverage;
  final int numberOfSeasons;
  final int numberOfEpisode;
  final DateTime firstAirDate;
  final String status;
  const TvDetail({
    Key? key,
    required this.name,
    required this.backdropPath,
    required this.posterPath,
    required this.overview,
    required this.voteAverage,
    required this.numberOfSeasons,
    required this.numberOfEpisode,
    required this.firstAirDate,
    required this.status,
  }) : super(key: key);

  @override
  State<TvDetail> createState() => _TvDetailState();
}

class _TvDetailState extends State<TvDetail> {
  final _controller = PageController(keepPage: true);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentsId;
    final tvProvider = Provider.of<TvProvider>(context);

    Widget backgroundImage() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
          color: backgroundColor,
        ),
        width: double.infinity,
        height: 430,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
          child: Image.network(
            widget.backdropPath.isEmpty
                ? widget.posterPath
                : widget.backdropPath,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 381,
        ),
        width: double.infinity,
        height: 235,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 69, 30, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: yellowTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TODO : RATING

                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: creamColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.star,
                            color: yellowColor,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.voteAverage.toString(),
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  // TODO : VOTE COUNT

                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: creamColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.list,
                            color: yellowColor,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${widget.numberOfSeasons} Seasons",
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  // TODO : RELEASE DATE

                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: creamColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.calendar_today,
                            color: yellowColor,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        DateFormat("yyyy").format(widget.firstAirDate),
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      final PageController controller = PageController(initialPage: 0);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 552,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 74, 24, 0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: yellowColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  tabs: [
                    Text(
                      "Overview",
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Cast",
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Review",
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "The Plot",
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.overview,
                        style: whiteTextStyle.copyWith(
                          color: whiteColor.withOpacity(0.7),
                          fontSize: 14,
                        ),
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: FutureBuilder(
                    future: tvProvider.fetchTvCast(args.id),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Consumer<TvProvider>(
                            builder: (ctx, tvCastData, child) {
                          return ListView.builder(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            itemCount: tvCastData.tvCast.length < 10
                                ? tvCastData.tvCast.length
                                : 10,
                            itemBuilder: (ctx, i) => TvCastItem(
                              tvCast: tvCastData.tvCast[i],
                            ),
                          );
                        });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 240,
                      child: FutureBuilder(
                        future: tvProvider.fetchTvReviews(args.id),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Consumer<TvProvider>(
                                builder: (ctx, tvReviewData, child) {
                              return tvReviewData.reviews.isEmpty
                                  ? Center(
                                      child: Text(
                                        "No reviews yet.",
                                        style: whiteTextStyle.copyWith(
                                          color: whiteColor.withOpacity(
                                            0.8,
                                          ),
                                        ),
                                      ),
                                    )
                                  : PageView.builder(
                                      controller: _controller,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: tvReviewData.reviews.length < 5
                                          ? tvReviewData.reviews.length
                                          : 5,
                                      itemBuilder: (ctx, i) => TvReviewCarousel(
                                        reviewData: tvReviewData.reviews[i],
                                      ),
                                    );
                            });
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 20,
                        child: Consumer<TvProvider>(
                          builder: (ctx, tvReviewData, child) {
                            return Center(
                              child: tvReviewData.reviews.isEmpty
                                  ? const SizedBox()
                                  : SmoothPageIndicator(
                                      controller: _controller,
                                      count: tvReviewData.reviews.length < 5
                                          ? tvReviewData.reviews.length
                                          : 5,
                                      effect: WormEffect(
                                        activeDotColor: yellowColor,
                                        dotColor: whiteColor.withOpacity(0.5),
                                        dotHeight: 6,
                                        dotWidth: 6,
                                        spacing: 8,
                                      ),
                                    ),
                            );
                          },
                        )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              "Details",
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Divider(
            thickness: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Total Episode : ",
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${widget.numberOfEpisode} Episode",
                      style: whiteTextStyle.copyWith(
                        color: whiteColor.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      "Total Seasons : ",
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${widget.numberOfSeasons} Seasons",
                      style: whiteTextStyle.copyWith(
                        color: whiteColor.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      "Status : ",
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.status,
                      style: whiteTextStyle.copyWith(
                        color: whiteColor.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget button() {
      return SafeArea(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 10,
            ),
            child: Icon(
              Icons.chevron_left,
              color: whiteColor,
              size: 40,
            ),
          ),
        ),
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: lightBlack,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                content(),
                title(),
                backgroundImage(),
                button(),
              ],
            ),
          )),
    );
  }
}
