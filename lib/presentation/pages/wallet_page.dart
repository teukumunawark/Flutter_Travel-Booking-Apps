import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/common/constants.dart';
import 'package:travel_app/presentation/provider/auth_cubit.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        automaticallyImplyLeading: true,
        toolbarHeight: 65,
        title: Center(
          child: Text(
            'Your Wallet',
            style: blackStyle.copyWith(
                fontSize: 18.sm, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: 195,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 20,
                offset: const Offset(2, 7), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/card.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'CARD SALDO',
                                        style: whiteStyle.copyWith(
                                          fontSize: 14.sm,
                                        ),
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'IDR ',
                                          decimalDigits: 0,
                                        ).format(state.user.balance),
                                        style: whiteStyle.copyWith(
                                          fontSize: 18.sm,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    'assets/visa.png',
                                    width: 40,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CARD HOLDERNAME',
                                    style: whiteStyle.copyWith(
                                      fontSize: 14.sm,
                                    ),
                                  ),
                                  Text(
                                    state.user.name.toUpperCase(),
                                    style: whiteStyle.copyWith(
                                      fontSize: 18.sm,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'EXPIRY DATE',
                                    style: whiteStyle.copyWith(
                                      fontSize: 14.sm,
                                    ),
                                  ),
                                  Text(
                                    '20-04-2025',
                                    style: whiteStyle.copyWith(
                                      fontSize: 18.sm,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'CARD SALDO',
                                        style: whiteStyle.copyWith(
                                          fontSize: 14.sm,
                                        ),
                                      ),
                                      Text(
                                        '**** **** ****',
                                        style: whiteStyle.copyWith(
                                          fontSize: 18.sm,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    'assets/visa.png',
                                    width: 40,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CARD HOLDERNAME',
                                    style: whiteStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '......',
                                    style: whiteStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'EXPIRY DATE',
                                    style: whiteStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '00-00-0000',
                                    style: whiteStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
