import 'package:crypto_app/model/coin.dart';
import 'package:crypto_app/pages/home/coins_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_notification/in_app_notification.dart';

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

    // For testing
    // await Future.delayed(const Duration(milliseconds: 2500));

    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&locale=en';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      setState(() {
        coinMarket = coinModelFromJson(response.body);
      });
    } else {
      print(response.statusCode);
      InAppNotification.show(
        context: context,
        onTap: () => print('Notification tapped!'),
        child: Message(
          messageType: MessageType.error,
        ),
      );
    }
  }
}
