import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/common/constants.dart';
import 'package:travel_app/data/models/destination_model.dart';
import 'package:travel_app/data/models/transaction_model.dart';
import 'package:travel_app/presentation/pages/checkout_page.dart';
import 'package:travel_app/presentation/provider/seat_cubit.dart';
import 'package:travel_app/presentation/widgets/costome_bottom.dart';
import 'package:travel_app/presentation/widgets/seat_item.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;
  const ChooseSeatPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm EEE d MMM').format(now);
    Widget flightStatus() => SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.only(
                          left: 11,
                          right: 13,
                        ),
                        decoration: BoxDecoration(
                          color: kPrimeryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset('assets/back.png'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BTJ',
                          style: defaultStyle.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'From',
                          style: defaultStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: kPrimeryColor.withOpacity(0.8)),
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                      padding: const EdgeInsets.all(5),
                      child: Image.asset('assets/flight-time-icon.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.kodeIATA,
                          style: defaultStyle.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Fly To",
                          style: defaultStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: kPrimeryColor.withOpacity(0.8)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
    Widget setStatus() => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/unavailable_icon.png'),
                          ),
                        ),
                      ),
                      Text(
                        'Unavailable',
                        style: whiteStyle.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/available_icon.png'),
                          ),
                        ),
                      ),
                      Text(
                        'Available',
                        style: whiteStyle.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/selected_icon.png'),
                          ),
                        ),
                      ),
                      Text(
                        'Selected',
                        style: whiteStyle.copyWith(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 3,
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              color: const Color(0xff527170),
            ),
          ],
        );

    Widget seatSelected() => Stack(
          children: [
            SizedBox(
              height: 420,
              child: Image.asset('assets/seat.png'),
            ),
            BlocBuilder<SeatCubit, List<String>>(
              builder: (context, state) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    Text(
                      formattedDate,
                      style: whiteStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Economy Class',
                      style: whiteStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 230,
                      // NOTE : SEAT INDICATOR
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                // height: 48,
                                width: 40,
                                child: Center(
                                  child: Text(
                                    'A',
                                    style: whiteStyle.copyWith(fontSize: 16),
                                  ),
                                ),
                              ),
                              SizedBox(
                                // height: 48,
                                width: 40,
                                child: Center(
                                  child: Text(
                                    'B',
                                    style: whiteStyle.copyWith(fontSize: 16),
                                  ),
                                ),
                              ),
                              SizedBox(
                                // height: 48,
                                width: 14,
                                child: Center(
                                  child: Text(
                                    '',
                                    style: whiteStyle.copyWith(fontSize: 16),
                                  ),
                                ),
                              ),
                              SizedBox(
                                // height: 48,
                                width: 45,
                                child: Center(
                                  child: Text(
                                    'C',
                                    style: whiteStyle.copyWith(fontSize: 16),
                                  ),
                                ),
                              ),
                              SizedBox(
                                // height: 48,
                                width: 40,
                                child: Center(
                                  child: Text(
                                    'D',
                                    style: whiteStyle.copyWith(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // NOTE : SEAT 1
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
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
                                      style: whiteStyle.copyWith(fontSize: 16),
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
                          // NOTE : SEAT 2
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: Row(
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
                                      style: whiteStyle.copyWith(fontSize: 16),
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
                          // NOTE : SEAT 3
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: Row(
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
                                      style: whiteStyle.copyWith(fontSize: 16),
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
                          // NOTE : SEAT 4
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: Row(
                              children: [
                                const SeatItem(
                                  id: 'A4',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const SeatItem(
                                  id: 'B4',
                                  isAvailable: false,
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Center(
                                    child: Text(
                                      '4',
                                      style: whiteStyle.copyWith(fontSize: 16),
                                    ),
                                  ),
                                ),
                                const SeatItem(
                                  id: 'C4',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const SeatItem(
                                  id: 'D4',
                                  isAvailable: false,
                                ),
                              ],
                            ),
                          ),
                          // NOTE : SEAT 5
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: Row(
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
                                      style: whiteStyle.copyWith(fontSize: 16),
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
                    )
                  ],
                );
              },
            )
          ],
        );

    Widget informationSeat() => BlocBuilder<SeatCubit, List<String>>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'From',
                      style: secondaryStyle.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Banda Aceh',
                      style: whiteStyle.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Image.asset('assets/flight-router.png'),
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
                const SizedBox(
                  height: 10,
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
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
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
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: 'IDR ',
                        decimalDigits: 0,
                      ).format(state.length * destination.price),
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
                const SizedBox(
                  height: 15,
                ),
                CustomBottom(
                  width: 100,
                  title: 'Checkout',
                  color: kWhiteColor,
                  onPressed: () {
                    int price = destination.price * state.length;
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
                            grandTotal: price + (price * 0.05).toInt(),
                          ),
                          destination,
                        ),
                      ),
                    );
                  },
                )
              ],
            );
          },
        );

    Widget chooseSeat() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              seatSelected(),
              informationSeat(),
            ],
          ),
        );

    Widget contentInformation() {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.only(top: 35),
          decoration: const BoxDecoration(
            color: kPrimeryColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              setStatus(),
              chooseSeat(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          flightStatus(),
          contentInformation(),
        ],
      ),
    );
  }
}
