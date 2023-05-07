import 'dart:convert';

import 'package:crypto_app/model/chart.dart';
import 'package:crypto_app/resources/app_dimens.dart';
import 'package:crypto_app/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/coin.dart';
import '../resources/app_colors.dart';

class CoinDetail extends StatefulWidget {
  const CoinDetail({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CoinModel item;

  @override
  _CoinDetailState createState() => _CoinDetailState();
}

class _CoinDetailState extends State<CoinDetail> {
  late TrackballBehavior trackballBehavior;

  @override
  void initState() {
    getChart();
    trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // shadowColor: null,
        elevation: 1,
        title: Row(
          children: [
            SizedBox(
              height: 30,
              child: Image.network(
                widget.item.image,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: AppStyles.H,
                ),
                Text(
                  widget.item.symbol.toUpperCase(),
                  style: AppStyles.P2,
                ),
              ],
            ),
          ],
        ),
        titleTextStyle: AppStyles.P1,
        backgroundColor: Colors.white,
        foregroundColor: AppColors.SELECTED_COLOR,
        // actions: _getActionButtons(context, theme, data),
        // bottom: PreferredSize(
        //   child: Container(
        //     color: Colors.grey,
        //     height: 1.0,
        //   ),
        //   preferredSize: const Size.fromHeight(0.0),
        // ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text('data'),
              const SizedBox(height: AppDimens.PADDING_S),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Минимум',
                        style: AppStyles.H,
                      ),
                      Text(
                        '\$${widget.item.low24H.toStringAsFixed(2)}',
                        style: AppStyles.H,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Максимум',
                        style: AppStyles.H,
                      ),
                      Text(
                        '\$${widget.item.high24H.toStringAsFixed(2)}',
                        style: AppStyles.H,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.PADDING_M),
              Container(
                height: 400,
                // color: Colors.amber,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : chart == null || chart!.isEmpty
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimens.PADDING_M),
                              child: Text(
                                'Это бесплатная API, будь добр, не жамкай слишком часто запросы. Подожди немного и давай по новой...',
                                style: AppStyles.H,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : SfCartesianChart(
                            trackballBehavior: trackballBehavior,
                            zoomPanBehavior: ZoomPanBehavior(
                              enablePinching: true,
                              zoomMode: ZoomMode.x,
                            ),
                            series: <CandleSeries>[
                              CandleSeries<ChartModel, num>(
                                enableSolidCandles: true,
                                enableTooltip: true,
                                bullColor: AppColors.SPARK_GREEN,
                                bearColor: AppColors.SPARK_RED,
                                dataSource: chart!,
                                xValueMapper: (ChartModel sales, _) =>
                                    sales.time,
                                lowValueMapper: (ChartModel sales, _) =>
                                    sales.low,
                                highValueMapper: (ChartModel sales, _) =>
                                    sales.high,
                                openValueMapper: (ChartModel sales, _) =>
                                    sales.open,
                                closeValueMapper: (ChartModel sales, _) =>
                                    sales.close,
                                animationDuration: 55,
                              ),
                            ],
                          ),
              ),
              const SizedBox(height: AppDimens.PADDING_M),
              Container(
                height: 30,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: timeType.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.PADDING_S,
                      ),
                      child: Container(
                        width: 50,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: timeTypeBool[index] == true
                              ? AppColors.BLUE_LIGHT
                              : AppColors.INACTIVE,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: timeTypeBool[index] == true
                                ? AppColors.SELECTED_COLOR
                                : AppColors.INACTIVE_BORDER,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (isLoading) return;

                            setState(() {
                              timeTypeBool = [
                                false,
                                false,
                                false,
                                false,
                                false,
                                false
                              ];
                              timeTypeBool[index] = true;
                            });
                            setDays(timeType[index]);
                            getChart();
                          },
                          child: Center(
                            child: Text(
                              timeType[index],
                              style: AppStyles.H.merge(
                                TextStyle(
                                  color: timeTypeBool[index] == true
                                      ? AppColors.TEXT
                                      : AppColors.INACTIVE_TEXT,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> timeType = ['Д', 'Н', 'М', '3М', '6М'];
  List<bool> timeTypeBool = [false, false, true, false, false];

  int days = 30;

  setDays(String txt) {
    if (txt == 'Д') {
      days = 1;
    } else if (txt == 'Н') {
      days = 7;
    } else if (txt == 'М') {
      days = 30;
    } else if (txt == '3М') {
      days = 90;
    } else if (txt == '6М') {
      days = 180;
    }
  }

  bool isLoading = true;

  List<ChartModel>? chart = [];

  Future<void> getChart() async {
    setState(() {
      isLoading = true;
    });

    String url =
        'https://api.coingecko.com/api/v3/coins/${widget.item.id}/ohlc?vs_currency=usd&days=$days';
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
      Iterable x = jsonDecode(response.body);
      setState(() {
        chart = x.map((e) => ChartModel.fromJson(e)).toList();
      });
    } else {
      print(response.statusCode);
    }
  }
}
