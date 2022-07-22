import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            child: Image.asset(
              'assets/confirmed.png',
              width: 300,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Successful',
            style: defaultStyle.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Colors.green,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Your order was successful, do you want to see the payment details?',
              style: blackStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
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
