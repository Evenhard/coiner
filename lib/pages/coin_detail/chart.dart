import 'package:crypto_app/animation/shimmer.dart';
import 'package:crypto_app/animation/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/chart.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_dimens.dart';
import '../../resources/app_styles.dart';

class Chart extends StatefulWidget {
  const Chart({
    Key? key,
    required this.isLoading,
    required this.chart,
  }) : super(key: key);

  final bool isLoading;
  final List<ChartModel>? chart;

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late TrackballBehavior trackballBehavior;

  @override
  void initState() {
    trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return Shimmer(
        linearGradient: AppStyles.SHIMMER_GRADIENT,
        child: ShimmerLoading(
          isLoading: widget.isLoading,
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.PADDING_M),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
      );
    }

    if (!widget.isLoading && (widget.chart == null || widget.chart!.isEmpty)) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/error.png'),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.PADDING_M,
              ),
              child: Text(
                'Ой, кажется, данные где-то потерялись.\nМожет, их кто-то украл?',
                style: AppStyles.H,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    return SfCartesianChart(
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
          dataSource: widget.chart!,
          xValueMapper: (ChartModel sales, _) => sales.time,
          lowValueMapper: (ChartModel sales, _) => sales.low,
          highValueMapper: (ChartModel sales, _) => sales.high,
          openValueMapper: (ChartModel sales, _) => sales.open,
          closeValueMapper: (ChartModel sales, _) => sales.close,
          animationDuration: 55,
        ),
      ],
    );
  }
}
