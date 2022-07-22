import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/common/constants.dart';
import 'package:travel_app/data/models/destination_model.dart';
import 'package:travel_app/data/models/transaction_model.dart';
import 'package:travel_app/presentation/pages/booking_success_page.dart';
import 'package:travel_app/presentation/provider/auth_cubit.dart';
import 'package:travel_app/presentation/provider/destination_cubit.dart';
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
    Widget flightStatus() => SafeArea(
          child: Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<DestinationCubit, DestinationState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BTJ',
                              style: whiteStyle.copyWith(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'From',
                              style: whiteStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        Container(
                          height: 100,
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            'assets/flight-time-icon.png',
                            color: kWhiteColor,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destination.kodeIATA,
                              style: whiteStyle.copyWith(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Fly To',
                              style: whiteStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );

    Widget informationContent() => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 20),
          height: MediaQuery.of(context).size.height * 0.71,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 5, right: 5),
                            height: 70,
                            child: Image.asset('assets/airplane_logo.png'),
                          ),
                        ),
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
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    'Anonymous',
                                    style: defaultStyle.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        Container(
                          height: 1.5,
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kPrimeryColor,
                            borderRadius: BorderRadius.circular(10),
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
                                    fontSize: 12,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  destination.airportName,
                                  style: defaultStyle.copyWith(
                                    fontSize: 11,
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
                                    fontSize: 12,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  '${transaction.amountOfTravel} Person',
                                  style: defaultStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
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
                                    fontSize: 12,
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
                                    fontSize: 14,
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
                                    fontSize: 12,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  transaction.insurance ? "YES" : "NO",
                                  style: transaction.insurance
                                      ? defaultStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        )
                                      : secondaryStyle.copyWith(
                                          fontSize: 14,
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
                                    fontSize: 12,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  transaction.refundable ? "YES" : "NO",
                                  style: transaction.refundable
                                      ? defaultStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        )
                                      : secondaryStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
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
                                    fontSize: 12,
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
                                    fontSize: 14,
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
                                    fontSize: 12,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  '${(transaction.vat * 100).toStringAsFixed(0)}%',
                                  style: defaultStyle.copyWith(
                                    fontSize: 14,
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
                                    fontSize: 12,
                                    color: kPrimeryColor.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  transaction.selectedSeat,
                                  style: defaultStyle.copyWith(
                                    fontSize: 14,
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
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30,
                        width: 15,
                        decoration: const BoxDecoration(
                          color: kPrimeryColor,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.1,
                        child: Image.asset('assets/line.png'),
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
                  const SizedBox(
                    height: 20,
                  ),
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

    return Scaffold(
      backgroundColor: kPrimeryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          flightStatus(),
          informationContent(),
        ],
      ),
    );
  }
}
