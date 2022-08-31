import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/presentation/pages/bonus_page.dart';
import 'package:travel_app/presentation/pages/splash_page.dart';
import 'package:travel_app/presentation/provider/auth_cubit.dart';
import 'package:travel_app/presentation/provider/destination_cubit.dart';
import 'package:travel_app/presentation/provider/seat_cubit.dart';
import 'package:travel_app/presentation/provider/transaction_cubit.dart';
import 'presentation/pages/auth/sign_in_page.dart';
import 'presentation/pages/auth/sign_up_page.dart';
import 'presentation/pages/main_page.dart';
import 'presentation/provider/page_cubit.dart';
import 'presentation/provider/tag_recomended_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => TagRecommendedCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        )
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const SplashPage(),
            '/bonus-page': (context) => const BonusPage(),
            '/register': (context) => const RegisterPage(),
            '/login': (context) => const LoginPage(),
            '/main': (context) => const MainPage(),
          },
        ),
        designSize: const Size(360, 640),
      ),
    );
  }
}
