import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/presentation/provider/transaction_cubit.dart';
import 'package:travel_app/presentation/widgets/history_card.dart';

import '../../common/constants.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        toolbarHeight: 65,
        title: Center(
          child: Text(
            'Transaction History',
            style:
                blackStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TransactionSuccess) {
            if (state.transactions.isEmpty) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/empty.png',
                    width: 230,
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  Text(
                    'Your transaction\nis still empty!',
                    style: blackStyle.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ));
            } else {
              return SafeArea(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: state.transactions.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  itemBuilder: (context, index) {
                    return HistoryCard(
                      state.transactions[index],
                    );
                  },
                ),
              );
            }
          }

          return const Center(
            child: Text('Transaction Page'),
          );
        },
      ),
    );
  }
}
