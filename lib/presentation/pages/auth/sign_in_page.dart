import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/presentation/widgets/text%20style%20widget/app_large_text.dart';
import 'package:travel_app/presentation/widgets/text%20style%20widget/app_text.dart';
import '../../../common/colors.dart';
import '../../../common/constants.dart';
import '../../provider/auth_cubit.dart';
import '../../widgets/auth%20widgets/custome_form_email.dart';
import '../../widgets/auth%20widgets/custome_form_password.dart';
import '../../widgets/costome_bottom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget titleApp() => Padding(
          padding: const EdgeInsets.only(top: 85, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AppLargeText(
                text: "Let's Enjoy",
                size: 40,
                color: AppColors.kWhiteColor,
                fontWeight: FontWeight.w800,
              ),
              AppText(
                text:
                    "Find a place for travel, campaign, hiking, \nRelax and cherish your dreams to the fullest",
                size: 14,
                color: AppColors.kWhiteColor,
              ),
            ],
          ),
        );

    Widget emailInput() => CustomeFormEmail(
        title: 'your email', controller: emailController, icon: Icons.email);

    Widget passwordInput() => CustomeFormPassword(
        title: 'your password',
        controller: passwordController,
        icon: Icons.lock);

    Widget submitButton() => BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            } else if (state is AuthFailed) {
              if (state.error ==
                  "[firebase_auth/unknown] Given String is empty or null") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: AppText(
                      text: 'Form harus diisi',
                      color: AppColors.kWhiteColor,
                    ),
                  ),
                );
              } else if (state.error ==
                  "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: AppText(
                      text: 'Password yang anda masukkan salah',
                      color: AppColors.kWhiteColor,
                    ),
                  ),
                );
              } else if (state.error ==
                  "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: AppText(
                      text: 'Email yang anda masukkan tidak ditemukan/salahmun',
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
              title: 'Login',
              borderRadius: BorderRadius.circular(defaultRadius),
              textColor: AppColors.kWhiteColor,
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
            const AppText(
              text: "Don’t have an account yet?",
              color: AppColors.kWhiteColor,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const AppText(
                text: 'Register',
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
