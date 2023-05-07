import 'package:crypto_app/model/coin.dart';
import 'package:crypto_app/pages/home/coins_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_notification/in_app_notification.dart';

import '../api.dart';
import '../resources/app_dimens.dart';
import '../widgets/message.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getCoinMarket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        // color: const Color(0xFFF8F9FA),
        width: width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppDimens.PADDING_S),
              child: Text('data'),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => getCoinMarket(),
                child: CoinsList(
                  isLoading: isLoading,
                  list: coinMarket!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isLoading = true;

  List<CoinModel>? coinMarket = [];

  Future<void> getCoinMarket() async {
    setState(() {
      isLoading = true;
    });

    List<CoinModel>? tempList = await Api().getCoinMarket(context);

    setState(() {
      isLoading = false;
      coinMarket = tempList;
    });
  }
}
