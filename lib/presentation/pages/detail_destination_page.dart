import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/common/constants.dart';
import 'package:travel_app/data/models/destination_model.dart';
import 'package:travel_app/presentation/pages/choose_seats_page.dart';
import 'package:travel_app/presentation/widgets/costome_bottom.dart';
import 'package:travel_app/presentation/widgets/glass_effect.dart';
import 'package:travel_app/presentation/widgets/text%20style%20widget/app_large_text.dart';
import 'package:travel_app/presentation/widgets/text%20style%20widget/app_text.dart';

class DetaiDestinationPage extends StatelessWidget {
  final DestinationModel destination;
  const DetaiDestinationPage(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          background(context, height),
          appBar(context),
          content(context, height),
          buttomBar(context),
        ],
      ),
    );
  }

  Widget background(BuildContext context, height) => Container(
        height: height * 0.55,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(45),
          ),
          image: DecorationImage(
            image: NetworkImage(destination.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(45),
            ),
          ),
        ),
      );

  Widget appBar(BuildContext context) => SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const GlassEffect(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: kWhiteColor,
                  ),
                ),
              ),
              const GlassEffect(
                child: Icon(
                  Icons.bookmark_outline_rounded,
                  color: kWhiteColor,
                ),
              )
            ],
          ),
        ),
      );

  Widget content(BuildContext context, height) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: height * 0.72,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLargeText(
                text: destination.name,
                color: kWhiteColor,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.location_on_sharp,
                    color: kWhiteColor,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  AppText(
                    text: destination.city,
                    size: 17,
                    fontWeight: FontWeight.w600,
                    color: kWhiteColor,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45),
                    ),
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 25),
                    children: [
                      const AppLargeText(
                        text: "About city",
                        size: 18,
                      ),
                      const SizedBox(height: 10),
                      AppText(
                        text: destination.aboutcity,
                        size: 12,
                        maxLines: 5,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 155,
                        child: Stack(
                          children: [
                            Container(
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(destination.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 180,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: kPrimeryColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: AppText(
                                    text: "see more",
                                    fontWeight: FontWeight.w500,
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buttomBar(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 75,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
          decoration: const BoxDecoration(
            color: kPrimeryColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(destination.price),
                    style: defaultStyle.copyWith(
                      fontSize: 18,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const AppText(
                    text: "per orang",
                    color: kWhiteColor,
                  ),
                ],
              ),
              CustomBottom(
                width: 140,
                title: "Book now",
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                color: kWhiteColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseSeatPage(destination),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
}
