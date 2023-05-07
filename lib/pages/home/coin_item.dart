import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:crypto_app/model/coin.dart';
import 'package:crypto_app/pages/coin_detail.dart';
import 'package:crypto_app/resources/app_colors.dart';
import 'package:flutter/material.dart';

import '../../resources/app_dimens.dart';
import '../../resources/app_styles.dart';

class CoinItem extends StatelessWidget {
  const CoinItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CoinModel item;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Card(
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS),
        //set border radius more than 50% of height and width to make circle
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.PADDING_M,
        vertical: AppDimens.PADDING_S,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CoinDetail(item: item),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.PADDING_M),
          child: Row(
            children: [
              SizedBox(
                height: 50,
                child: Image.network(
                  item.image,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: AppStyles.H,
                    ),
                    Text(
                      item.symbol.toUpperCase(),
                      style: AppStyles.P2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  // color: Colors.green,
                  height: 60,
                  // width: 70,
                  child: Sparkline(
                    data: item.sparklineIn7D.price,
                    lineWidth: 1.5,
                    lineColor: item.marketCapChangePercentage24H < 0
                        ? AppColors.SPARK_RED
                        : AppColors.SPARK_GREEN,
                    // fillMode: FillMode.below,
                    // fillGradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   stops: [0.0, 0.7],
                    //   colors: [Colors.red, Colors.red.shade100],
                    // ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${item.currentPrice.toStringAsFixed(2)}',
                      style: AppStyles.H,
                    ),
                    Text(
                      '${item.marketCapChangePercentage24H.toStringAsFixed(2)}%',
                      style: AppStyles.P2.merge(
                        TextStyle(
                          color: item.marketCapChangePercentage24H < 0
                              ? AppColors.SPARK_RED
                              : AppColors.SPARK_GREEN,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
