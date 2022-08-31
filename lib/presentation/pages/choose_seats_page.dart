import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/presentation/pages/checkout_page.dart';
import 'package:travel_app/presentation/provider/seat_cubit.dart';
import 'package:travel_app/presentation/widgets/text%20style%20widget/app_large_text.dart';
import 'package:travel_app/presentation/widgets/text%20style%20widget/app_text.dart';

import '../../common/constants.dart';
import '../../data/models/destination_model.dart';
import '../../data/models/transaction_model.dart';
import '../widgets/costome_bottom.dart';
import '../widgets/seat_item.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;
  const ChooseSeatPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appBar(context),
            informationRouter(context, height),
            content(context, height),
          ],
        ),
      ),
    );
  }

  Widget informationRouter(BuildContext context, height) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AppLargeText(
                  text: "BTJ",
                  size: 35,
                  color: kPrimeryColor,
                ),
                AppText(
                  text: "From",
                  color: kPrimeryColor,
                )
              ],
            ),
            Image.asset(
              'assets/flight-time-icon.png',
              width: 120,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLargeText(
                  text: destination.kodeIATA,
                  size: 35,
                  color: kPrimeryColor,
                ),
                const AppText(
                  text: "Fly To",
                  color: kPrimeryColor,
                )
              ],
            ),
          ],
        ),
      );

  Widget appBar(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              borderRadius: BorderRadius.circular(12),
              color: kPrimeryColor,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                borderRadius: BorderRadius.circular(12),
                child: const SizedBox(
                  height: 55,
                  width: 55,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: kWhiteColor,
                  ),
                ),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(12),
              color: kPrimeryColor,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(12),
                child: const SizedBox(
                  height: 55,
                  width: 55,
                  child: Icon(
                    Icons.info_outline,
                    color: kWhiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget content(BuildContext context, height) => Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: const BoxDecoration(
            color: kPrimeryColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/unavailable_icon.png',
                    width: 15.w,
                  ),
                  const SizedBox(width: 5),
                  const AppText(
                    text: "Unavailable",
                    color: kWhiteColor,
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/available_icon.png',
                    width: 15,
                  ),
                  const SizedBox(width: 5),
                  const AppText(
                    text: "Available",
                    color: kWhiteColor,
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/selected_icon.png',
                    width: 15,
                  ),
                  const SizedBox(width: 5),
                  const AppText(
                    text: "Selected",
                    color: kWhiteColor,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(
                thickness: 1,
                color: kWhiteColor.withOpacity(0.6),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  BlocBuilder<SeatCubit, List<String>>(
                    builder: (context, state) {
                      return Flexible(
                        flex: 3,
                        child: Container(
                          height: height * 0.55,
                          width: double.maxFinite,
                          padding: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: kWhiteColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                DateFormat('kk:mm EEE d MMM').format(
                                  DateTime.now(),
                                ),
                                style: whiteStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Economy Class',
                                style: whiteStyle.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 35,
                                    child: Center(
                                      child: Text(
                                        'A',
                                        style: whiteStyle.copyWith(
                                            fontSize: 16.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                    child: Center(
                                      child: Text(
                                        'B',
                                        style: whiteStyle.copyWith(
                                            fontSize: 16.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 14,
                                    child: Center(
                                      child: Text(
                                        '',
                                        style: whiteStyle.copyWith(
                                            fontSize: 16.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                    child: Center(
                                      child: Text(
                                        'C',
                                        style: whiteStyle.copyWith(
                                            fontSize: 16.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                    child: Center(
                                      child: Text(
                                        'D',
                                        style: whiteStyle.copyWith(
                                            fontSize: 16.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              // SEAT 1
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 5,
                                  left: 5,
                                  right: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SeatItem(
                                      id: 'A1',
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SeatItem(
                                      id: 'B1',
                                      isAvailable: false,
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: Text(
                                          '1',
                                          style:
                                              whiteStyle.copyWith(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    const SeatItem(
                                      id: 'C1',
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SeatItem(
                                      id: 'D1',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              //SEAT 2
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 5,
                                  left: 5,
                                  right: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SeatItem(
                                      id: 'A2',
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SeatItem(
                                      id: 'B2',
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: Text(
                                          '2',
                                          style:
                                              whiteStyle.copyWith(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    const SeatItem(
                                      id: 'C2',
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SeatItem(
                                      id: 'D2',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              // SEAT 3
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 5,
                                  left: 5,
                                  right: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SeatItem(
                                      id: 'A3',
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SeatItem(
                                      id: 'B3',
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: Text(
                                          '3',
                                          style:
                                              whiteStyle.copyWith(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    const SeatItem(
                                      id: 'C3',
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SeatItem(
                                      id: 'D3',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              // SEAT 4
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 5,
                                  left: 5,
                                  right: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SeatItem(
                                      id: 'A5',
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SeatItem(
                                      id: 'B5',
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: Text(
                                          '5',
                                          style:
                                              whiteStyle.copyWith(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    const SeatItem(
                                      id: 'C5',
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SeatItem(
                                      id: 'D5',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<SeatCubit, List<String>>(
                    builder: (context, state) {
                      return Flexible(
                        flex: 2,
                        child: Container(
                          height: height * 0.55,
                          color: kPrimeryColor,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'From',
                                      style: secondaryStyle.copyWith(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Banda Aceh',
                                      style: whiteStyle.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      child: Image.asset(
                                          'assets/flight-router.png'),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      '1h 37m',
                                      style: whiteStyle.copyWith(),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'To',
                                      style: secondaryStyle.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      destination.city,
                                      style: whiteStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          state.join(', '),
                                          style: secondaryStyle.copyWith(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Seat',
                                      style: whiteStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'IDR ',
                                        decimalDigits: 0,
                                      ).format(
                                          state.length * destination.price),
                                      style: secondaryStyle.copyWith(
                                          fontWeight: semibold, fontSize: 16),
                                    ),
                                    Text(
                                      'Ticket Price',
                                      style: whiteStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                CustomBottom(
                                  width: 100.w,
                                  title: 'Checkout',
                                  color: kWhiteColor,
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius),
                                  onPressed: () {
                                    int price =
                                        destination.price * state.length;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CheckoutPage(
                                          TransactionModel(
                                            destination: destination,
                                            amountOfTravel: state.length,
                                            selectedSeat: state.join(', '),
                                            insurance: true,
                                            refundable: false,
                                            vat: 0.05,
                                            price: price,
                                            grandTotal:
                                                price + (price * 0.05).toInt(),
                                          ),
                                          destination,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      );
}
