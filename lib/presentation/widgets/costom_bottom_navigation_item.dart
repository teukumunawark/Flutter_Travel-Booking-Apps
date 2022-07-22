import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/common/constants.dart';
import 'package:travel_app/presentation/provider/page_cubit.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String imgUrl;
  final int index;

  const CustomBottomNavigationItem({
    Key? key,
    required this.imgUrl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Image.asset(
        imgUrl,
        width: 30,
        color: context.watch<PageCubit>().state == index
            ? kSecondaryColor
            : kWhiteColor,
      ),
    );
  }
}
