import 'dart:async';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/helpers/spinner_text.dart';


class DigitalClock extends StatefulWidget {
  DigitalClock({
    this.is24HourTimeFormat,
    this.showSecondsDigit,
    this.areaWidth,
    this.areaHeight,
    this.areaDecoration,
    this.areaAligment,
    this.hourMinuteDigitDecoration,
    this.secondDigitDecoration,
    this.digitAnimationStyle,
    this.hourMinuteDigitTextStyle,
    this.secondDigitTextStyle,
    this.amPmDigitTextStyle, required this.hour, required this.minute, required this.seconds, required this.type,
  });

  final bool? is24HourTimeFormat;
  final bool? showSecondsDigit;
  final double? areaWidth;
  final double? areaHeight;
  final BoxDecoration? areaDecoration;
  final AlignmentDirectional? areaAligment;
  final BoxDecoration? hourMinuteDigitDecoration;
  final BoxDecoration? secondDigitDecoration;
  final Curve? digitAnimationStyle;
  final TextStyle? hourMinuteDigitTextStyle;
  final TextStyle? secondDigitTextStyle;
  final TextStyle? amPmDigitTextStyle;
  final String hour;
  final String minute;
  final String seconds;
      final String type;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late DateTime _dateTime;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    // _clockModel = ClockModel();
    // _clockModel.is24HourFormat = widget.is24HourTimeFormat ?? true;

    _dateTime = DateTime.now();
    // _clockModel.hour = _dateTime.hour;
    // _clockModel.minute = _dateTime.minute;
    // _clockModel.second = _dateTime.second;

    // _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    //   _dateTime = DateTime.now();
    //   _clockModel.hour = _dateTime.hour;
    //   _clockModel.minute = _dateTime.minute;
    //   _clockModel.second = _dateTime.second;
    //
    //   setState(() {});
    // });

  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.areaWidth ??
          (widget.hourMinuteDigitTextStyle != null
              ? widget.hourMinuteDigitTextStyle!.fontSize! * 7
              : 180),
      height: widget.areaHeight ?? null,
      child: Container(
        alignment: widget.areaAligment ?? AlignmentDirectional.bottomCenter,
        decoration: widget.areaDecoration ??
            BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 3, 12, 84),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            hour(0,1),
            hour(0,1),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: SpinnerText(
                  text: ":",
                  textStyle: widget.hourMinuteDigitTextStyle ?? null,
                )),
            minute(0,1),
            minute(0,1),
            second(0,1),
             second(0,1),
             _amPm,
            _amPm2,
          ],
        ),
      ),
    );
  }

  Widget hour(index,index2) => Container(
    padding: EdgeInsets.symmetric(horizontal: 2),
    decoration: widget.hourMinuteDigitDecoration ??
        BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5)),
    child: SpinnerText(
      text: widget.hour.substring(index,index2 ),
      animationStyle: widget.digitAnimationStyle ?? null,
      textStyle: widget.hourMinuteDigitTextStyle ?? null,
    ),
  );

  Widget  minute(index,index2) => Container(
    decoration: widget.hourMinuteDigitDecoration ??
        BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5)),
    child: SpinnerText(
      text: widget.minute.substring(index,index2),
      animationStyle: widget.digitAnimationStyle ?? null,
      textStyle: widget.hourMinuteDigitTextStyle ?? null,
    ),
  );

  Widget  second(index,index2) => widget.showSecondsDigit != false
      ? Container(
    margin: EdgeInsets.only(bottom: 0, left: 4, right: 2),
    decoration: widget.secondDigitDecoration ??
        BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5)),
    child: SpinnerText(
      text: widget.seconds.substring(index,index2),
      animationStyle: widget.digitAnimationStyle,
      textStyle: widget.secondDigitTextStyle ??
          TextStyle(
              fontSize: widget.hourMinuteDigitTextStyle != null
                  ? widget.hourMinuteDigitTextStyle!.fontSize! / 2
                  : 15,
              color: widget.hourMinuteDigitTextStyle != null
                  ? widget.hourMinuteDigitTextStyle!.color!
                  : Colors.white),
    ),
  )
      : Text("");

  Widget get _amPm => Container(
    margin: EdgeInsets.only(bottom: 0, left: 4, right: 2),
    decoration: widget.secondDigitDecoration ??
        BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5)),
    child: SpinnerText(
      text: widget.type.substring(0,1),
      animationStyle: widget.digitAnimationStyle,
      textStyle: widget.secondDigitTextStyle ??
          TextStyle(
              fontSize: widget.hourMinuteDigitTextStyle != null
                  ? widget.hourMinuteDigitTextStyle!.fontSize! / 2
                  : 15,
              color: widget.hourMinuteDigitTextStyle != null
                  ? widget.hourMinuteDigitTextStyle!.color!
                  : Colors.white),
    ),
  );

  Widget get _amPm2 => Container(
    margin: EdgeInsets.only(bottom: 0, left: 4, right: 2),
    decoration: widget.secondDigitDecoration ??
        BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5)),
    child: SpinnerText(
      text: widget.type.substring(1,2),
      animationStyle: widget.digitAnimationStyle,
      textStyle: widget.secondDigitTextStyle ??
          TextStyle(
              fontSize: widget.hourMinuteDigitTextStyle != null
                  ? widget.hourMinuteDigitTextStyle!.fontSize! / 2
                  : 15,
              color: widget.hourMinuteDigitTextStyle != null
                  ? widget.hourMinuteDigitTextStyle!.color!
                  : Colors.white),
    ),
  );
}
