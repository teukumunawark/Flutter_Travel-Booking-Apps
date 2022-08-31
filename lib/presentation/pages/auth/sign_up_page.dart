import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/common/constants.dart';
import 'package:travel_app/presentation/widgets/text%20style%20widget/app_text.dart';
import '../../../common/colors.dart';
import '../../provider/auth_cubit.dart';
import '../../widgets/costome_bottom.dart';
import '../../widgets/scroll_behavior.dart';
import '../../widgets/auth widgets/custome_form_email.dart';
import '../../widgets/auth widgets/custome_form_password.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController passwordConfirmedController =
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

    Widget nameInput() => CustomeFormEmail(
        title: 'your name', controller: nameController, icon: Icons.person);

    Widget emailInput() => CustomeFormEmail(
        title: 'your email', controller: emailController, icon: Icons.email);

    Widget passwordInput() => CustomeFormPassword(
        title: 'your password',
        controller: passwordController,
        icon: Icons.lock);

    Widget passwordConfirmedInput() => CustomeFormPassword(
          title: 'Confirme password',
          controller: passwordConfirmedController,
          icon: Icons.lock,
        );

    Widget submitButton() => BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/bonus-page', (route) => false);
            } else if (state is AuthFailed) {
              if (state.error ==
                  "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: AppText(
                      text: 'Email sudah tidak tersedia',
                      color: AppColors.kWhiteColor,
                    ),
                  ),
                );
              } else if (state.error ==
                  "[firebase_auth/invalid-email] The email address is badly formatted.") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: AppText(
                      text: 'Format email yang anda masukan salah',
                      color: AppColors.kWhiteColor,
                    ),
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Container(
                height: 55,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, top: 30),
                decoration: BoxDecoration(
                  color: AppColors.kPrimeryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return CustomBottom(
              borderRadius: BorderRadius.circular(defaultRadius),
              title: 'Create Account',
              textColor: AppColors.kWhiteColor,
              margin: const EdgeInsets.only(bottom: 10, top: 30),
              onPressed: () {
                if (passwordConfirmedController.text !=
                    passwordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "Password tidak cocok!",
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                } else {
                  if (nameController.text != '') {
                    context.read<AuthCubit>().signUp(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "User name tidak boleh kosong!",
                          style: GoogleFonts.montserrat(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  }
                }
              },
            );
          },
        );

    Widget registerTextButtom() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppText(
              text: "Don’t have an account yet?",
              color: AppColors.kWhiteColor,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const AppText(
                text: 'Login',
                color: AppColors.kPrimeryColor,
                fontWeight: FontWeight.w700,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
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
                                nameInput(),
                                emailInput(),
                                passwordInput(),
                                passwordConfirmedInput(),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
