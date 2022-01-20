import 'package:flutter/material.dart';
import 'package:nonton_app/models/arguments_id.dart';
import 'package:nonton_app/models/tv/tv_detail_model.dart';
import 'package:nonton_app/providers/tv/tv_detail_provider.dart';
import 'package:nonton_app/theme.dart';
import 'package:nonton_app/widgets/tv_widgets/tv_detail.dart';
import 'package:provider/provider.dart';

class TvDetailPage extends StatefulWidget {
  static const routeName = 'tv_detail';
  const TvDetailPage({Key? key}) : super(key: key);

  @override
  _TvDetailPageState createState() => _TvDetailPageState();
}

class _TvDetailPageState extends State<TvDetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentsId;
    final tvDetailProvider =
        Provider.of<TvDetailProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: lightBlack,
      body: FutureBuilder<TvDetailModel>(
          future: tvDetailProvider.getTvDetails(args.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return TvDetail(
                name: snapshot.data!.name,
                backdropPath: snapshot.data!.backdropPath!,
                overview: snapshot.data!.overview,
                voteAverage: snapshot.data!.voteAverage,
                numberOfSeasons: snapshot.data!.numberOfSeasons,
                firstAirDate: snapshot.data!.firstAirDate,
                numberOfEpisode: snapshot.data!.numberOfEpisodes,
                status: snapshot.data!.status,
                posterPath: snapshot.data!.posterPath!.isEmpty
                    ? "https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg"
                    : snapshot.data!.posterPath!,
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
