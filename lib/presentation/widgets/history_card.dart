import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/data/models/transaction_model.dart';
import 'package:travel_app/presentation/provider/auth_cubit.dart';

import '../../common/constants.dart';

class HistoryCard extends StatelessWidget {
  final TransactionModel transaction;
  const HistoryCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimeryColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5, right: 5),
                    height: 70,
                    child: Image.asset(
                      'assets/airplane_logo.png',
                      color: kWhiteColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Passenger',
                      style: whiteStyle.copyWith(),
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthSuccess) {
                          return Text(
                            state.user.name.toUpperCase(),
                            style: whiteStyle.copyWith(
                              fontSize: 24.sm,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return Text(
                            'Anonymous',
                            style: whiteStyle.copyWith(
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
                  height: 1.5,
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
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
                          style: whiteStyle.copyWith(
                            fontSize: 12.sm,
                            color: kWhiteColor.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            transaction.airportName,
                            style: whiteStyle.copyWith(
                              fontSize: 11.sm,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Traveler',
                          style: whiteStyle.copyWith(
                            fontSize: 12.sm,
                            color: kWhiteColor.withOpacity(0.4),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${transaction.amountOfTravel} Person',
                          style: whiteStyle.copyWith(
                            fontSize: 14.sm,
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
                          style: whiteStyle.copyWith(
                            fontSize: 12.sm,
                            color: kWhiteColor.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'IDR ',
                            decimalDigits: 0,
                          ).format(transaction.price),
                          style: whiteStyle.copyWith(
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
                          style: whiteStyle.copyWith(
                            fontSize: 12.sm,
                            color: kWhiteColor.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          transaction.insurance ? "YES" : "NO",
                          style: transaction.insurance
                              ? whiteStyle.copyWith(
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
                          style: whiteStyle.copyWith(
                            fontSize: 12.sm,
                            color: kWhiteColor.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          transaction.refundable ? "YES" : "NO",
                          style: transaction.refundable
                              ? whiteStyle.copyWith(
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
                          style: whiteStyle.copyWith(
                            fontSize: 12.sm,
                            color: kWhiteColor.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'IDR ',
                            decimalDigits: 0,
                          ).format(transaction.grandTotal),
                          style: whiteStyle.copyWith(
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
                          style: whiteStyle.copyWith(
                            fontSize: 12.sm,
                            color: kWhiteColor.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          '${(transaction.vat * 100).toStringAsFixed(0)}%',
                          style: whiteStyle.copyWith(
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
                          style: whiteStyle.copyWith(
                            fontSize: 12.sm,
                            color: kWhiteColor.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          transaction.selectedSeat,
                          style: whiteStyle.copyWith(
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
                  color: kWhiteColor,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(50),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Image.asset(
                    'assets/line.png',
                    color: kWhiteColor,
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 15,
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(50),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.asset(
              'assets/scan_code.png',
              width: 260,
            ),
          )
        ],
      ),
    );
  }
}
