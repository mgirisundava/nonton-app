import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nonton_app/providers/movie/movies_provider.dart';
import 'package:nonton_app/providers/people/people_provider.dart';
import 'package:nonton_app/providers/tv/tv_provider.dart';
import 'package:nonton_app/widgets/movie_widgets/movie_card_item.dart';
import 'package:nonton_app/widgets/movie_widgets/popular_movie_carousel.dart';
import 'package:nonton_app/widgets/people_card_item.dart';
import 'package:nonton_app/widgets/tv_widgets/tv_card_item.dart';
import '../theme.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future popularMovieFuture;
  Future obtainPopularMovieFuture() {
    return Provider.of<MoviesProvider>(context, listen: false)
        .fetchPopularMovies();
  }

  late Future upcomingMovieFuture;
  Future obtainUpcomingMovieFuture() {
    return Provider.of<MoviesProvider>(context, listen: false)
        .fethUpcomingMovies();
  }

  late Future nowPlayingMovieFuture;
  Future obtainNowPlayingMovieFuture() {
    return Provider.of<MoviesProvider>(context, listen: false)
        .fetchNowPlayingMovies();
  }

  late Future topRatedMovieFuture;
  Future obtainTopRatedMovieFuture() {
    return Provider.of<MoviesProvider>(context, listen: false)
        .fetchTopRatedMovies();
  }

  late Future tvAiringTodayFuture;
  Future obtainTvAiringTodayFuture() {
    return Provider.of<TvProvider>(context, listen: false).fetchTvAiringToday();
  }

  late Future tvPopularFuture;
  Future obtainTvPopularFuture() {
    return Provider.of<TvProvider>(context, listen: false).fetchTvPopular();
  }

  late Future tvTopRatedFuture;
  Future obtainTvTopRatedFuture() {
    return Provider.of<TvProvider>(context, listen: false).fetchTvTopRated();
  }

  late Future popularPeopleFuture;
  Future obtainPopularPeopleFuture() {
    return Provider.of<PeopleProvider>(context, listen: false)
        .fetchPopularPeople();
  }

  late Future trendingPeopleFuture;
  Future obtainTrendingPeopleFuture() {
    return Provider.of<PeopleProvider>(context, listen: false)
        .fetchTrendingPeople();
  }

  @override
  void initState() {
    super.initState();
    popularMovieFuture = obtainPopularMovieFuture();
    upcomingMovieFuture = obtainUpcomingMovieFuture();
    nowPlayingMovieFuture = obtainNowPlayingMovieFuture();
    topRatedMovieFuture = obtainTopRatedMovieFuture();
    tvAiringTodayFuture = obtainTvAiringTodayFuture();
    tvPopularFuture = obtainTvPopularFuture();
    tvTopRatedFuture = obtainTvTopRatedFuture();
    popularPeopleFuture = obtainPopularPeopleFuture();
    trendingPeopleFuture = obtainTrendingPeopleFuture();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = PageController();

    Widget popularMoviesCarousel() {
      return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              child: FutureBuilder(
                future: obtainPopularMovieFuture(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.error != null) {
                      return const Text("An error occured!");
                    } else {
                      return Consumer<MoviesProvider>(
                          builder: (ctx, popData, child) {
                        return PageView.builder(
                          controller: _controller,
                          itemCount: 6,
                          itemBuilder: (ctx, i) => PopularMovieItem(
                            popularMovie: popData.populars[i],
                          ),
                        );
                      });
                    }
                  }
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 30,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 6,
                  effect: WormEffect(
                    activeDotColor: yellowColor,
                    dotColor: whiteColor.withOpacity(0.5),
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 8,
                  ),
                ),
              ),
            ),
          ]);
    }

    Widget tabBar() {
      return DefaultTabController(
        length: 4,
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: TabBar(
                automaticIndicatorColorAdjustment: true,
                indicatorColor: yellowColor,
                tabs: [
                  Text(
                    "All",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Movie",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "TV",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Actor",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 600,
              child: TabBarView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),

                      // TODO : UPCOMING MOVIES

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                        ),
                        child: Text(
                          "Upcoming",
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 230,
                        child: FutureBuilder(
                          future: obtainUpcomingMovieFuture(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              if (snapshot.error != null) {
                                return const Text("An error occured!");
                              } else {
                                return Consumer<MoviesProvider>(
                                    builder: (ctx, upData, child) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (ctx, i) => (MovieCardItem(
                                      movieData: upData.upcomings[i],
                                    )),
                                  );
                                });
                              }
                            }
                          },
                        ),
                      ),

                      // TODO : TV POPULAR

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                            ),
                            child: Text(
                              "TV Popular",
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 230,
                            child: FutureBuilder(
                              future: obtainTvPopularFuture(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  if (snapshot.error != null) {
                                    return const Text("An error occured!");
                                  } else {
                                    return Consumer<TvProvider>(
                                        builder: (ctx, tvPopularData, child) {
                                      return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 10,
                                        itemBuilder: (ctx, i) => (TvCardItem(
                                          tvData: tvPopularData.tvPopular[i],
                                        )),
                                      );
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),

                      // TODO : NOW PLAYING MOVIES

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                        ),
                        child: Text(
                          "Now Playing",
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 230,
                        child: FutureBuilder(
                          future: obtainNowPlayingMovieFuture(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              if (snapshot.error != null) {
                                return const Text("An error occured!");
                              } else {
                                return Consumer<MoviesProvider>(
                                    builder: (ctx, nowPlaying, child) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (ctx, i) => (MovieCardItem(
                                      movieData: nowPlaying.nowPlayingMovies[i],
                                    )),
                                  );
                                });
                              }
                            }
                          },
                        ),
                      ),

                      // TODO : TOP RATED MOVIES

                      const SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                        ),
                        child: Text(
                          "Top Rated",
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 230,
                        child: FutureBuilder(
                          future: obtainTopRatedMovieFuture(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              if (snapshot.error != null) {
                                return const Text("An error occured!");
                              } else {
                                return Consumer<MoviesProvider>(
                                    builder: (ctx, topRated, child) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (ctx, i) => (MovieCardItem(
                                      movieData: topRated.topRatedMovies[i],
                                    )),
                                  );
                                });
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),

                      // TODO : TV AIRING TODAY

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                        ),
                        child: Text(
                          "TV Airing Today",
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 230,
                        child: FutureBuilder(
                          future: obtainTvAiringTodayFuture(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              if (snapshot.error != null) {
                                return const Text("An error occured!");
                              } else {
                                return Consumer<TvProvider>(
                                    builder: (ctx, airingTodayData, child) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (ctx, i) => (TvCardItem(
                                      tvData: airingTodayData.airingToday[i],
                                    )),
                                  );
                                });
                              }
                            }
                          },
                        ),
                      ),

                      // TODO : TV TOP RATED

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                            ),
                            child: Text(
                              "TV Top Rated",
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 230,
                            child: FutureBuilder(
                              future: obtainTvTopRatedFuture(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  if (snapshot.error != null) {
                                    return const Text("An error occured!");
                                  } else {
                                    return Consumer<TvProvider>(
                                        builder: (ctx, tvTopRatedData, child) {
                                      return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 10,
                                        itemBuilder: (ctx, i) => (TvCardItem(
                                          tvData: tvTopRatedData.tvTopRated[i],
                                        )),
                                      );
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  // TODO : POPULAR PEOPLE

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                        ),
                        child: Text(
                          "Popular",
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 230,
                        child: FutureBuilder(
                          future: popularPeopleFuture,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              if (snapshot.error != null) {
                                return const Text("An error occured!");
                              } else {
                                return Consumer<PeopleProvider>(
                                    builder: (ctx, popularPeopleData, child) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (ctx, i) => (PeopleCardItem(
                                      peopleData:
                                          popularPeopleData.popularPeople[i],
                                    )),
                                  );
                                });
                              }
                            }
                          },
                        ),
                      ),

                      // TODO : TRENDING PEOPLE

                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                        ),
                        child: Text(
                          "Trending",
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 230,
                        child: FutureBuilder(
                          future: trendingPeopleFuture,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              if (snapshot.error != null) {
                                return Center(
                                    child: Text(
                                  "An error occured!",
                                  style: whiteTextStyle,
                                ));
                              } else {
                                return Consumer<PeopleProvider>(
                                    builder: (ctx, trendingPeopleData, child) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (ctx, i) => (PeopleCardItem(
                                      peopleData:
                                          trendingPeopleData.trendingPeople[i],
                                    )),
                                  );
                                });
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          popularMoviesCarousel(),
          tabBar(),
        ],
      ),
    );
  }
}
