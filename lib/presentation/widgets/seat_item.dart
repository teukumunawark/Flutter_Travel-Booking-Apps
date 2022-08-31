import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/presentation/provider/seat_cubit.dart';

import '../../common/constants.dart';

class SeatItem extends StatelessWidget {
  final String id;
  final bool isAvailable;

  const SeatItem({
    required this.id,
    this.isAvailable = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return kPrimeryColor;
      } else {
        if (isSelected) {
          return kSecondaryColor;
        } else {
          return kPrimeryColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        return kSecondaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: defaultStyle.copyWith(
              fontSize: 11.sm,
              fontWeight: semibold,
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        height: 35.h,
        width: 30.w,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            width: 2.w,
            color: borderColor(),
          ),
        ),
        child: child(),
      ),
    );
  }
}
