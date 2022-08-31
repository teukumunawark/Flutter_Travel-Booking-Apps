import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/presentation/provider/auth_cubit.dart';

import '../../common/constants.dart';
import '../widgets/costome_bottom.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return const SizedBox(
        height: 50,
      );
    }

    Widget content() {
      return Center(
        child: Container(
          height: 195,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
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
              Image.asset(
                'assets/card.png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
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
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'IDR ',
                                          decimalDigits: 0,
                                        ).format(state.user.balance),
                                        style: whiteStyle.copyWith(
                                          fontSize: 18,
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
                                    state.user.name.toUpperCase(),
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
                                    '20-04-2025',
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
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '**** **** ****',
                                        style: whiteStyle.copyWith(
                                          fontSize: 18,
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
      );
    }

    Widget nextButtom() {
      return CustomBottom(
        borderRadius: BorderRadius.circular(defaultRadius),
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
        title: 'Get Started',
        textColor: kWhiteColor,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        },
      );
    }

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        header(),
        content(),
        nextButtom(),
      ],
    ));
  }
}
