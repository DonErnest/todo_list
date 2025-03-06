import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/theme/colors.dart';
import 'package:todo_list/util.dart';

class _BarChart extends StatelessWidget {
  final List<Task> tasksForStatistics;
  late final List<DateTime> lastWeek;

  _BarChart(this.tasksForStatistics) {
    lastWeek = getLastWeekDates;
  }

  int getCompletedCountByWeekDay(int weekDay) {
    var today = DateTime.now();
    return tasksForStatistics
        .where((task) =>
            task.done &&
            task.completedOn != null &&
            task.completedOn!.isAfter(today.subtract(Duration(days: 7))) &&
            task.completedOn!.weekday == weekDay)
        .length;
  }

  List<DateTime> get getLastWeekDates {
    List<DateTime> dates = [];
    var today = DateTime.now();
    for (int daysAgo = 6; daysAgo >= 0; daysAgo--) {
      dates.add(today.subtract(Duration(days: daysAgo)));
    }
    return dates;
  }

  String getWeekDayDisplayTitle(int weekDay) =>
      formatDateShort(lastWeek.firstWhere((day) => day.weekday == weekDay));

  @override
  Widget build(BuildContext context) {
    final customCheckBoxColor = Theme.of(context).extension<CustomColors>()!;
    return BarChart(
      BarChartData(
          barTouchData: barTouchData,
          titlesData: titlesData,
          borderData: borderData,
          barGroups: barGroups,
          gridData: const FlGridData(show: false),
          alignment: BarChartAlignment.spaceAround,
          maxY: 20,
          // backgroundColor: Color.fromRGBO(28, 36, 57, 1)
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Color.fromRGBO(0, 255, 230, 1.0),
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Color.fromRGBO(0, 255, 230, 1.0),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = getWeekDayDisplayTitle(value.toInt());
    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient {
    return LinearGradient(
      colors: [
        Color.fromRGBO(37, 124, 195, 1),
        Color.fromRGBO(77, 222, 252, 1),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
  }

  List<BarChartGroupData> get barGroups {
    return lastWeek
        .map((weekDay) => BarChartGroupData(
              x: weekDay.weekday,
              barRods: [
                BarChartRodData(
                  toY: getCompletedCountByWeekDay(weekDay.weekday).toDouble(),
                  gradient: _barsGradient,
                )
              ],
              showingTooltipIndicators: [0],
            ))
        .toList();
  }
}

class TasksBarChart extends StatefulWidget {
  final List<Task> tasks;

  const TasksBarChart({super.key, required this.tasks});

  @override
  State<StatefulWidget> createState() => TasksBarChartState();
}

class TasksBarChartState extends State<TasksBarChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: _BarChart(widget.tasks),
    );
  }
}
