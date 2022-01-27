import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

void main() => runApp(const WeekNumber());

class WeekNumber extends StatelessWidget {
  const WeekNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeekNumberState(),
    );
  }
}

class WeekNumberState extends StatefulWidget {
  const WeekNumberState({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<WeekNumberState> {
  late String headerString;

  @override
  void initState() {
    // TODO: implement initState
    headerString = DateFormat('dd - MMMM - yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            child: SafeArea(
              child: SfDateRangePicker(
                monthViewSettings: const DateRangePickerMonthViewSettings(
                    dayFormat: 'EEE',
                    showTrailingAndLeadingDates: true,
                    numberOfWeeksInView: 1),
                monthCellStyle: DateRangePickerMonthCellStyle(
                ),
                onSelectionChanged: selectionChanged,
                selectionShape: DateRangePickerSelectionShape.rectangle,
                enablePastDates: false,
                selectionRadius: 5,
                allowViewNavigation: false,
                todayHighlightColor: Colors.transparent,
                selectionColor: Colors.transparent,
                selectionTextStyle:TextStyle(
                  color: Colors.indigoAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            height: 140,
            width: double.maxFinite,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  height: 50,
                  width: 360,
                  child: Text(
                    headerString,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    headerString = DateFormat('dd - MMMM - yyyy').format(args.value).toString();
    setState(() {});
  }
}
