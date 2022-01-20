import 'package:flutter/material.dart';
import 'package:nonton_app/models/arguments_id.dart';
import 'package:nonton_app/models/people_detail_model.dart';
import 'package:nonton_app/providers/people/people_detail_provider.dart';
import 'package:nonton_app/theme.dart';
import 'package:nonton_app/widgets/people_detail.dart';
import 'package:provider/provider.dart';

class PeopleDetailPage extends StatefulWidget {
  static const routeName = 'people-detail';
  const PeopleDetailPage({Key? key}) : super(key: key);

  @override
  _PeopleDetailPageState createState() => _PeopleDetailPageState();
}

class _PeopleDetailPageState extends State<PeopleDetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentsId;
    final peopleDetailProvider =
        Provider.of<PeopleDetailProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: lightBlack,
      body: FutureBuilder<PeopleDetailModel>(
          future: peopleDetailProvider.getPeopleDetail(args.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return PeopleDetail(
                name: snapshot.data!.name!,
                biography: snapshot.data!.biography!,
                popularity: snapshot.data!.popularity!,
                birthday: snapshot.data!.birthday,
                deathday: snapshot.data!.deathday,
                gender: snapshot.data!.gender!,
                profilePath: snapshot.data!.profilePath!.isEmpty
                    ? "https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg"
                    : snapshot.data!.profilePath!,
                // profilePath: snapshot.data!.profilePath!,
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
