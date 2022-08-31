import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/data/models/destination_model.dart';
import 'package:travel_app/presentation/provider/auth_cubit.dart';
import 'package:travel_app/presentation/provider/destination_cubit.dart';
import 'package:travel_app/presentation/widgets/destination_card.dart';

import '../../common/constants.dart';
import '../widgets/new_destination_tile.dart';
import '../widgets/tag_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestination();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget appBar() => BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hai,\n${state.user.name}',
                          style: blackStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Where to go today?',
                          style: greyStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          image: AssetImage('assets/image_profile.png'),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        );

    Widget recomendedTag() => Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Container(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            height: 35,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: tagListItem.length,
              itemBuilder: (BuildContext context, index) {
                return tagListItem[index];
              },
            ),
          ),
        );

    Widget destination(List<DestinationModel> destination) => Container(
          width: width,
          margin: const EdgeInsets.only(
            top: 15,
          ),
          height: 300,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: destination.map(
                (DestinationModel destination) {
                  return DestinationCard(destination);
                },
              ).toList(),
            ),
          ),
        );

    Widget newDestinations(List<DestinationModel> destinations) => Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'New This Year',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: destinations.map(
                  (DestinationModel destinations) {
                    return NewDestinationCard(destinations);
                  },
                ).toList(),
              )
            ],
          ),
        );

    return Scaffold(
      backgroundColor: kBackGroundColor,
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<DestinationCubit, DestinationState>(
        listener: (context, state) {
          if (state is DestinationFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is DestinationSuccess) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  appBar(),
                  recomendedTag(),
                  destination(state.destinations),
                  newDestinations(state.destinations),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
