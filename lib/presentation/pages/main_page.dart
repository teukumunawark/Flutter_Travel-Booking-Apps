import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/common/constants.dart';
import 'package:travel_app/presentation/pages/history_page.dart';
import 'package:travel_app/presentation/pages/home_page.dart';
import 'package:travel_app/presentation/pages/setting_page.dart';
import 'package:travel_app/presentation/pages/wallet_page.dart';
import 'package:travel_app/presentation/provider/page_cubit.dart';

import '../widgets/costom_bottom_navigation_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const HistoryPage();
        case 2:
          return const WalletPage();
        case 3:
          return const SettingPage();
        default:
          return const HomePage();
      }
      // return HomePage();
    }

    Widget buttonNavigation() => Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 65,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: kPrimeryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomBottomNavigationItem(
                  imgUrl: 'assets/home_icon.png',
                  index: 0,
                ),
                CustomBottomNavigationItem(
                  imgUrl: 'assets/transaction_icon.png',
                  index: 1,
                ),
                CustomBottomNavigationItem(
                  imgUrl: 'assets/wallet_icon.png',
                  index: 2,
                ),
                CustomBottomNavigationItem(
                  imgUrl: 'assets/setting_icon.png',
                  index: 3,
                ),
              ],
            ),
          ),
        );

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                buildContent(currentIndex),
                buttonNavigation(),
              ],
            ),
          ),
        );
      },
    );
  }
}
