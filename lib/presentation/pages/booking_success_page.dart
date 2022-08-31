import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/common/constants.dart';
import 'package:travel_app/presentation/provider/page_cubit.dart';

class BookingSuccess extends StatelessWidget {
  const BookingSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: LottieBuilder.network(
                'https://assets6.lottiefiles.com/packages/lf20_b36dyco1.json'),
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: TextButton(
              onPressed: () {
                context.read<PageCubit>().setPage(1);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
              style: TextButton.styleFrom(
                backgroundColor: kPrimeryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              child: Text(
                'See My Booking',
                style: whiteStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
