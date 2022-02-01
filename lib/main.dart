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
          SafeArea(
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
                ),
              ),
              child: SfDateRangePicker(
                monthViewSettings: const DateRangePickerMonthViewSettings(
                    dayFormat: 'EEE',
                    firstDayOfWeek: 1,
                    showTrailingAndLeadingDates: true,
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(textStyle: TextStyle(
                      color: Color(0xff5E5E5E),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )),
                    numberOfWeeksInView: 1),
                monthCellStyle: const DateRangePickerMonthCellStyle(
                    todayTextStyle:  TextStyle(
                      color: Color(0xff5E5E5E),
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    todayCellDecoration:  BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.rectangle,
                      border: Border(
                        bottom: BorderSide(
                          width: 3.0, color: Color(0xff3161F1),),
                      ),
                    ),
                    textStyle:  TextStyle(
                      color: Color(0xff5E5E5E),
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    disabledDatesTextStyle: TextStyle(
                      color: Color(0xffC3C9D7),
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    )),
                onSelectionChanged: selectionChanged,
                enablePastDates: false,
                allowViewNavigation: false,
                selectionColor: Colors.transparent,
                selectionMode: DateRangePickerSelectionMode.single,
                selectionTextStyle: const TextStyle(
                  color: Color(0xff3161F1),
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
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
