import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/presentation/provider/auth_cubit.dart';
import 'package:travel_app/presentation/widgets/costome_bottom.dart';

import '../../common/constants.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget titleApp() => Padding(
          padding: const EdgeInsets.only(top: 85, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's Enjoy",
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Find a place for travel, campaign, hiking, \nRelax and cherish your dreams to the fullest',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: kWhiteColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        );

    Widget emailInput() => Container(
          height: 52,
          width: width,
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: blackStyle.copyWith(fontSize: 14),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              hintText: 'Your Email Address',
              hintStyle: greyStyle.copyWith(
                fontWeight: medium,
                fontSize: 15,
              ),
              icon: const Icon(
                Icons.email,
              ),
              border: InputBorder.none,
            ),
          ),
        );
    Widget passwordInput() => Container(
          height: 52,
          width: width,
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.emailAddress,
            style: blackStyle.copyWith(fontSize: 14),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              hintText: 'Your password',
              hintStyle: greyStyle.copyWith(
                fontWeight: medium,
                fontSize: 15,
              ),
              icon: const Icon(
                Icons.lock,
              ),
              border: InputBorder.none,
            ),
          ),
        );

    Widget submitButton() => BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Container(
                height: 55,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, top: 30),
                decoration: BoxDecoration(
                  color: kPrimeryColor,
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return CustomBottom(
              title: 'Login',
              textColor: kWhiteColor,
              margin: const EdgeInsets.only(bottom: 10, top: 30),
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
            );
          },
        );

    Widget registerTextButtom() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don’t have an account yet?",
              style: whiteStyle.copyWith(),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                "Register",
                style: defaultStyle.copyWith(
                  fontWeight: semibold,
                ),
              ),
            ),
          ],
        );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/auth_screen_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          titleApp(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    child: Container(
                      width: width,
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 25, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          emailInput(),
                          passwordInput(),
                          submitButton(),
                          registerTextButtom(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
