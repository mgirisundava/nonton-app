import 'package:flutter/material.dart';
import 'package:nonton_app/models/arguments_id.dart';
import 'package:nonton_app/models/movie/movie_detail_model.dart';
import 'package:nonton_app/providers/movie/movie_detail_provider.dart';
import 'package:nonton_app/theme.dart';
import 'package:nonton_app/widgets/movie_widgets/movie_detail.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatefulWidget {
  static const routeName = 'movie-detail';
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentsId;
    final movieDetailProvider =
        Provider.of<MovieDetailProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: lightBlack,
      body: FutureBuilder<MovieDetailModel>(
          future: movieDetailProvider.getMovieDetails(args.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MovieDetail(
                backdropPath: snapshot.data!.backdropPath.toString(),
                posterPath: snapshot.data!.posterPath!,
                originalTitle: snapshot.data!.title!,
                voteAverage: snapshot.data!.voteAverage!,
                voteCount: snapshot.data!.voteCount!,
                releaseDate: snapshot.data!.releaseDate!,
                overview: snapshot.data!.overview!,
                runtime: snapshot.data!.runtime!,
                status: snapshot.data!.status!,
              );
            }
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(child: CircularProgressIndicator()),
            );
          }),
    );
  }
}
