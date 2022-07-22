import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/common/constants.dart';
import 'package:travel_app/data/models/destination_model.dart';
import 'package:travel_app/presentation/pages/choose_seats_page.dart';

import '../widgets/glass_effect.dart';

class DetaiDestinationPage extends StatelessWidget {
  final DestinationModel destination;
  const DetaiDestinationPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() => Container(
          width: double.infinity,
          height: 385,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
            image: DecorationImage(
              image: NetworkImage(destination.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        );

    Widget costumeShadow() => Container(
          width: double.infinity,
          height: 385,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.85),
              ],
            ),
          ),
        );

    Widget content() => SafeArea(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
            // color: kWhiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 220,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: GlassEffect(
                          padding: const EdgeInsets.only(
                            left: 11,
                            right: 13,
                          ),
                          child: Image.asset('assets/back.png'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                destination.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                destination.country,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GlassEffect(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/hotel.png'),
                                    Text(
                                      'Hotel',
                                      style: whiteStyle.copyWith(
                                        fontSize: 9,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GlassEffect(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      destination.rating.toString(),
                                      style: whiteStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      destination.rating.toString(),
                                      style: whiteStyle.copyWith(
                                        fontSize: 9,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 30),
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: blackStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          destination.aboutcity,
                          style: blackStyle.copyWith(
                            fontWeight: light,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Top Activity',
                              style: blackStyle.copyWith(
                                fontSize: 16,
                                fontWeight: semibold,
                              ),
                            ),
                            Text(
                              'View All',
                              style: defaultStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semibold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 155,
                          child: Stack(
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: NetworkImage(destination.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 50,
                                  width: 170,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  decoration: BoxDecoration(
                                    color: kPrimeryColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        destination.name,
                                        style: whiteStyle.copyWith(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      // Text(
                                      //   '5.4k',
                                      //   style: whiteStyle.copyWith(
                                      //       fontWeight: FontWeight.w700),
                                      // ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

    Widget bottomBar() => Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
            decoration: const BoxDecoration(
              color: kPrimeryColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: 'IDR ',
                        decimalDigits: 0,
                      ).format(destination.price),
                      style: whiteStyle.copyWith(
                          fontSize: 18, fontWeight: semibold),
                    ),
                    Text(
                      'per orang',
                      style: whiteStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseSeatPage(destination),
                    ),
                  ),
                  child: Container(
                    height: 53,
                    width: 145,
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Book Now',
                        style:
                            defaultStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );

    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: Stack(
        children: [
          backgroundImage(),
          costumeShadow(),
          content(),
          bottomBar(),
        ],
      ),
    );
  }
}
