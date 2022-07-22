import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/presentation/provider/tag_recomended_cubit.dart';

import '../../common/constants.dart';

class TagItems extends StatelessWidget {
  final String title;
  final int index;
  const TagItems({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TagRecommendedCubit>().setTag(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 22,
        ),
        child: Column(
          children: [
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                color: context.watch<TagRecommendedCubit>().state == index
                    ? kPrimeryColor
                    : kGreyColor,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: context.watch<TagRecommendedCubit>().state == index
                    ? kPrimeryColor
                    : kGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final tagListItem = [
  const TagItems(
    title: 'Indonsia',
    index: 0,
  ),
  const TagItems(
    title: 'Singapura',
    index: 1,
  ),
  const TagItems(
    title: 'Thailand',
    index: 2,
  ),
  const TagItems(
    title: 'Vietnam',
    index: 3,
  ),
  const TagItems(
    title: 'Malaysia',
    index: 4,
  ),
];
