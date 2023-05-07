class ChartModel {
  final int time;
  final double? open;
  final double? high;
  final double? low;
  final double? close;

  ChartModel({
    required this.time,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  factory ChartModel.fromJson(List l) {
    return ChartModel(
      time: l[0],
      open: l[1],
      high: l[2],
      low: l[3],
      close: l[4],
    );
  }
}
