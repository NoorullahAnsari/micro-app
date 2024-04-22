// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:fl_chart/fl_chart.dart';

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({
    Key? key,
    this.width,
    this.height,
    required this.xLabels,
    required this.yValues,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> xLabels;
  final List<int> yValues;

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  @override
  Widget build(BuildContext context) {
    // Calculate the width of each bar based on the number of bars and available space
    final double barWidth = widget.width! / widget.xLabels.length;

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 300,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: widget.yValues
                  .reduce((value, element) => value > element ? value : element)
                  .toDouble() +
              10,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.blueGrey,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  widget.xLabels[rodIndex],
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '\nValue: ${widget.yValues[rodIndex]}',
                      style: TextStyle(color: Colors.yellowAccent),
                    ),
                  ],
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              getTextStyles: (value) =>
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              margin: 20,
              getTitles: (double value) {
                if (value >= 0 && value < widget.xLabels.length) {
                  return widget.xLabels[value.toInt()];
                }
                return '';
              },
            ),
            leftTitles: SideTitles(
              showTitles: true,
              getTextStyles: (value) =>
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              interval: 20,
            ),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false), // Hide border of bars
          barGroups: List.generate(
            widget.xLabels.length,
            (index) => BarChartGroupData(
              x: index,
              barsSpace: 0, // Remove space between bars
              barRods: [
                BarChartRodData(
                  y: widget.yValues[index].toDouble(),
                  width: barWidth, // Set bar width
                  colors: _getBarColors(index),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Color> _getBarColors(int index) {
    switch (index) {
      case 0:
        return [Colors.green]; // Pipeline
      case 1:
        return [Colors.purple]; // Orders to Hand
      case 2:
        return [Colors.blue]; // Sales
      case 3:
        return [Colors.pink]; // Cash to be Collected
      case 4:
        return [Colors.yellow]; // Cash Blocked
      case 5:
        return [Colors.indigo]; // Profit Ability
      default:
        return [Colors.grey];
    }
  }
}
