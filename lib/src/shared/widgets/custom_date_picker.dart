import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../utils/constant.dart';

class CustomDatePicker {
  static singleDatePicker(
    context, {
    DateTime? initialSelectedDate,
    dynamic Function(Object?)? onSubmit,
  }) {
    showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return m.Dialog(
          alignment: Alignment.center,
          child: Container(
            height: 300,
            width: 300,
            padding: const EdgeInsets.all(Constant.minPadding),
            child: SfDateRangePicker(
              headerHeight: 60,
              headerStyle: const DateRangePickerHeaderStyle(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              showNavigationArrow: true,
              onSubmit: (v) {
                if (onSubmit != null) {
                  onSubmit(v);
                }
                Navigator.of(context).pop();
              },
              showTodayButton: true,
              selectionShape: DateRangePickerSelectionShape.rectangle,
              onCancel: () {
                Navigator.of(context).pop();
              },
              toggleDaySelection: true,
              showActionButtons: true,
              initialSelectedDate: initialSelectedDate,
              initialDisplayDate: initialSelectedDate,
            ),
          ),
        );
      },
    );
  }
}
