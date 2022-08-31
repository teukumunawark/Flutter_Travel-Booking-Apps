import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/common/constants.dart';
import 'package:travel_app/presentation/provider/auth_cubit.dart';
import 'package:travel_app/presentation/provider/page_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget profileUser() {
      return Container(
        height: 250,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/image_profile.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
              if (state is AuthSuccess) {
                return Column(
                  children: [
                    Text(
                      state.user.name,
                      style: blackStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      state.user.email,
                      style: blackStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                );
              } else if (state is AuthLoading) {
                return Container(
                  height: 250,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const CircularProgressIndicator(),
                );
              } else {
                return Container(
                  height: 250,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(35),
                  ),
                );
              }
            })
          ],
        ),
      );
    }

    Widget logout() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error),
              ),
            );
          } else if (state is AuthInitial) {
            context.read<PageCubit>().setPage(0);
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: Material(
                color: kPrimeryColor,
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Material(
              color: kPrimeryColor,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  context.read<AuthCubit>().signOut();
                },
                child: SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'Log Out',
                      style: whiteStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: Column(
        children: [
          profileUser(),
          logout(),
        ],
      ),
    );
  }
}
