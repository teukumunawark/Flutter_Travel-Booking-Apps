import 'package:flutter/material.dart';
import 'package:travel_app/presentation/widgets/seat_item.dart';

import '../../common/constants.dart';

class ChooseSeat extends StatelessWidget {
  const ChooseSeat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                width: 20,
                child: Center(
                  child: Text(
                    '',
                    style: whiteStyle.copyWith(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                // height: 48,
                width: 40,
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
                  isAvailable: false,
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
                  isAvailable: false,
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
    );
  }
}
