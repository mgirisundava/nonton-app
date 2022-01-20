import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nonton_app/widgets/gender_list.dart';

import '../../theme.dart';

class PeopleDetail extends StatefulWidget {
  final String name;
  final String? biography;
  final String? profilePath;
  final num? popularity;
  final String? birthday;
  final String? deathday;
  final int? gender;

  const PeopleDetail({
    Key? key,
    required this.name,
    required this.biography,
    required this.profilePath,
    required this.popularity,
    required this.birthday,
    required this.deathday,
    required this.gender,
    // required this.profilePath,
  }) : super(key: key);

  @override
  _PeopleDetailState createState() => _PeopleDetailState();
}

class _PeopleDetailState extends State<PeopleDetail> {
  @override
  Widget build(BuildContext context) {
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
            widget.profilePath!,
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
                        widget.popularity.toString(),
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 616,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Biography",
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.biography!,
              style: whiteTextStyle.copyWith(
                color: whiteColor.withOpacity(
                  0.8,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Date of Birth : ",
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.birthday.toString(),
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
                      "Date of Death : ",
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.deathday == null
                          ? "-"
                          : widget.deathday.toString(),
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
                      "Gender : ",
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GenderList(gender: widget.gender)
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

    return Scaffold(
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
        ));
  }
}
