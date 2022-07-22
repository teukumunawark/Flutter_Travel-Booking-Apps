import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/presentation/pages/splash_page.dart';
import 'package:travel_app/presentation/provider/auth_cubit.dart';
import 'package:travel_app/presentation/provider/destination_cubit.dart';
import 'package:travel_app/presentation/provider/seat_cubit.dart';
import 'package:travel_app/presentation/provider/transaction_cubit.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/main_page.dart';
import 'presentation/pages/register_page.dart';
import 'presentation/provider/page_cubit.dart';
import 'presentation/provider/tag_recomended_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> _firebadeMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase
      .initializeApp(); // options: DefaultFirebaseConfig.platformOptions
  // ignore: avoid_print
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebadeMessagingBackgroundHandler);

  runApp(const MyApp());
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}
