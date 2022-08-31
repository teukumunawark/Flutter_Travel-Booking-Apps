import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/common/constants.dart';
import 'package:travel_app/data/models/destination_model.dart';
import 'package:travel_app/data/models/transaction_model.dart';
import 'package:travel_app/presentation/pages/booking_success_page.dart';
import 'package:travel_app/presentation/provider/auth_cubit.dart';
import 'package:travel_app/presentation/provider/seat_cubit.dart';
import 'package:travel_app/presentation/provider/transaction_cubit.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  final DestinationModel destination;
  const CheckoutPage(
    this.transaction,
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeiht = MediaQuery.of(context).size.height;
    final bodyHeight = mediaQueryHeiht - MediaQuery.of(context).padding.top;
    Widget flightStatus() => SafeArea(
          child: Container(
            height: bodyHeight * 0.25,
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 15,
            ),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.only(
                      left: 11.w,
                      right: 13.w,
                    ),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/back.png',
                      color: kPrimeryColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'BTJ',
                            style: whiteStyle.copyWith(
                              fontSize: 40.sm,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'From',
                            style: whiteStyle.copyWith(
                              fontSize: 16.sm,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 100.sm,
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            'assets/flight-time-icon.png',
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            destination.kodeIATA,
                            style: whiteStyle.copyWith(
                              fontSize: 40.sm,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Fly To",
                            style: whiteStyle.copyWith(
                              fontSize: 16.sm,
                              fontWeight: FontWeight.w300,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

    Widget informationContent() => Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          width: double.infinity,
          height: bodyHeight * 0.75,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Passenger',
                              style: defaultStyle.copyWith(),
                            ),
                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                if (state is AuthSuccess) {
                                  return Text(
                                    state.user.name.toUpperCase(),
                                    style: defaultStyle.copyWith(
                                      fontSize: 24.sm,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    'Anonymous',
                                    style: defaultStyle.copyWith(
                                      fontSize: 24.sm,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        Container(
                          height: 1.5.h,
                          margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kPrimeryColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Airport',
                                  style: defaultStyle.copyWith(
                                    fontSize: 12.sm,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  destination.airportName,
                                  style: defaultStyle.copyWith(
                                    fontSize: 11.sm,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Traveler',
                                  style: defaultStyle.copyWith(
                                    fontSize: 12.sm,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  '${transaction.amountOfTravel} Person',
                                  style: defaultStyle.copyWith(
                                    fontSize: 14.sm,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: defaultStyle.copyWith(
                                    fontSize: 12.sm,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'IDR ',
                                    decimalDigits: 0,
                                  ).format(transaction.price),
                                  style: defaultStyle.copyWith(
                                    fontSize: 14.sm,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Insurance',
                                  style: defaultStyle.copyWith(
                                    fontSize: 12.sm,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  transaction.insurance ? "YES" : "NO",
                                  style: transaction.insurance
                                      ? defaultStyle.copyWith(
                                          fontSize: 14.sm,
                                          fontWeight: FontWeight.w600,
                                        )
                                      : secondaryStyle.copyWith(
                                          fontSize: 14.sm,
                                          fontWeight: FontWeight.w600,
                                        ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Refundable',
                                  style: defaultStyle.copyWith(
                                    fontSize: 12.sm,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  transaction.refundable ? "YES" : "NO",
                                  style: transaction.refundable
                                      ? defaultStyle.copyWith(
                                          fontSize: 14.sm,
                                          fontWeight: FontWeight.w600,
                                        )
                                      : secondaryStyle.copyWith(
                                          fontSize: 14.sm,
                                          fontWeight: FontWeight.w600,
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Grand Total',
                                  style: defaultStyle.copyWith(
                                    fontSize: 12.sm,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'IDR ',
                                    decimalDigits: 0,
                                  ).format(transaction.grandTotal),
                                  style: defaultStyle.copyWith(
                                    fontSize: 14.sm,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'VAT',
                                  style: defaultStyle.copyWith(
                                    fontSize: 12.sm,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  '${(transaction.vat * 100).toStringAsFixed(0)}%',
                                  style: defaultStyle.copyWith(
                                    fontSize: 14.sm,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Seat',
                                  style: defaultStyle.copyWith(
                                    fontSize: 12.sm,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  transaction.selectedSeat,
                                  style: defaultStyle.copyWith(
                                    fontSize: 14.sm,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30.h,
                        width: 15.w,
                        decoration: BoxDecoration(
                          color: kPrimeryColor,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(50.r),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Image.asset('assets/line.png'),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 15,
                        decoration: const BoxDecoration(
                          color: kPrimeryColor,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  BlocConsumer<TransactionCubit, TransactionState>(
                    listener: (context, state) {
                      if (state is TransactionSuccess) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BookingSuccess(),
                            ),
                            (route) => false);
                      } else if (state is TransactionFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(state.error),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is TransactionLoading) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 30),
                          child: const CircularProgressIndicator(),
                        );
                      }
                      return InkWell(
                        onTap: () {
                          context
                              .read<TransactionCubit>()
                              .creatTransaction(transaction);
                          context.read<SeatCubit>().state.clear();
                        },
                        child: Container(
                          height: 55,
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: kPrimeryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Booking Now',
                              style: whiteStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        );

    Widget content() {
      return Expanded(
        child: Container(
          child: informationContent(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kPrimeryColor,
      body: Column(
        children: [
          flightStatus(),
          content(),
        ],
      ),
    );
  }
}
