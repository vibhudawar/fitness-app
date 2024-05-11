import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  static String routeName = '/details-page';
  final String? lastWeight;
  final int? monthNumber;
  const LineChartSample2({super.key, this.lastWeight, this.monthNumber});

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  List<FlSpot> spotsData = [];

  @override
  void initState() {
    super.initState();
    // Initialize the spotsData list with existing data if available
    if (widget.lastWeight != null && widget.monthNumber != null) {
      spotsData.add(FlSpot(
          widget.monthNumber!.toDouble(), double.parse(widget.lastWeight!)));
    }
  }

  @override
  void didUpdateWidget(covariant LineChartSample2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update spotsData list when new data is available
    if (widget.lastWeight != null && widget.monthNumber != null) {
      setState(() {
        spotsData.add(FlSpot(
            widget.monthNumber!.toDouble(), double.parse(widget.lastWeight!)));
      });
    }
  }

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              color: Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Kgs',
              style: TextStyle(
                  fontSize: 12,
                  color:
                      showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Colors.white,
    );
    String text;
    if (value >= 10 && value <= 100 && value % 20 == 0) {
      // value is between 10 and 100 and is a multiple of 20
      text = value.toString();
    } else {
      return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Colors.white,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Jan', style: style);
        break;
      case 2:
        text = const Text('Feb', style: style);
        break;
      case 3:
        text = const Text('Mar', style: style);
        break;
      case 4:
        text = const Text('Apr', style: style);
        break;
      case 5:
        text = const Text('May', style: style);
        break;
      case 6:
        text = const Text('Jun', style: style);
        break;
      case 7:
        text = const Text('Jul', style: style);
        break;
      case 8:
        text = const Text('Aug', style: style);
        break;
      case 9:
        text = const Text('Sep', style: style);
        break;
      case 10:
        text = const Text('Oct', style: style);
        break;
      case 11:
        text = const Text('Nov', style: style);
        break;
      case 12:
        text = const Text('Dec', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.white,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 32,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: Colors.white,
            width: 2,
          )),
      minX: 1,
      maxX: 13,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: spotsData,
          isCurved: true,
          color: Colors.amber,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
