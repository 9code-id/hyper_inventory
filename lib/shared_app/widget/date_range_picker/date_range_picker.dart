import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class QDateRangePicker extends StatefulWidget {
  const QDateRangePicker({
    required this.label,
    required this.onChanged,
    super.key,
    this.fromValue,
    this.toValue,
    this.validator,
    this.hint,
    this.helper,
  });
  final String label;
  final DateTime? fromValue;
  final DateTime? toValue;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final Function(DateTime from, DateTime to) onChanged;

  @override
  State<QDateRangePicker> createState() => _QDateRangePickerState();
}

class _QDateRangePickerState extends State<QDateRangePicker> {
  DateTime? from;
  DateTime? to;
  String? optionValue;

  @override
  void initState() {
    super.initState();
    from = widget.fromValue;
    to = widget.toValue;
    // optionValue = getOptionByCurrentFromAndTo();
    getFilter();
    setValueOptionByFromAndTo();
    printr("optionValue: $optionValue");
  }

  List filters = [];

  getFilter() {
    filters = [
      {
        "label": "Today",
        "condition": () {
          var definedFrom = now;
          var definedTo = now;
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = now;
          var definedTo = now;
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "Yesterday",
        "condition": () {
          var definedFrom = now.subtract(Duration(days: 1));
          var definedTo = now.subtract(Duration(days: 1));
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = now.subtract(Duration(days: 1));
          var definedTo = now.subtract(Duration(days: 1));
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "Tomorrow",
        "condition": () {
          var definedFrom = now.add(Duration(days: 1));
          var definedTo = now.add(Duration(days: 1));
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = now.add(Duration(days: 1));
          var definedTo = now.add(Duration(days: 1));
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "Last 3 days",
        "condition": () {
          var definedFrom = now.subtract(Duration(days: 2));
          var definedTo = now;
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = now.subtract(Duration(days: 2));
          var definedTo = now;
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "This week working days",
        "condition": () {
          var definedFrom = now.subtract(Duration(days: now.weekday - 1));
          var definedTo = now;
          // Exclude weekends
          if (definedFrom.weekday == DateTime.saturday) {
            definedFrom = definedFrom.add(Duration(days: 2));
          } else if (definedFrom.weekday == DateTime.sunday) {
            definedFrom = definedFrom.add(Duration(days: 1));
          }
          if (definedTo.weekday == DateTime.saturday) {
            definedTo = definedTo.subtract(Duration(days: 1));
          } else if (definedTo.weekday == DateTime.sunday) {
            definedTo = definedTo.subtract(Duration(days: 2));
          }
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = now.subtract(Duration(days: now.weekday - 1));
          var definedTo = now;
          // Exclude weekends
          if (definedFrom.weekday == DateTime.saturday) {
            definedFrom = definedFrom.add(Duration(days: 2));
          } else if (definedFrom.weekday == DateTime.sunday) {
            definedFrom = definedFrom.add(Duration(days: 1));
          }
          if (definedTo.weekday == DateTime.saturday) {
            definedTo = definedTo.subtract(Duration(days: 1));
          } else if (definedTo.weekday == DateTime.sunday) {
            definedTo = definedTo.subtract(Duration(days: 2));
          }
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "This week weekends",
        "condition": () {
          var definedFrom = now.subtract(Duration(days: now.weekday - 1));
          var definedTo = now;
          // Include weekends
          if (definedFrom.weekday != DateTime.saturday) {
            definedFrom = definedFrom
                .add(Duration(days: DateTime.saturday - definedFrom.weekday));
          }
          if (definedTo.weekday != DateTime.sunday) {
            definedTo = definedTo
                .add(Duration(days: DateTime.sunday - definedTo.weekday));
          }
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = now.subtract(Duration(days: now.weekday - 1));
          var definedTo = now;
          // Include weekends
          if (definedFrom.weekday != DateTime.saturday) {
            definedFrom = definedFrom
                .add(Duration(days: DateTime.saturday - definedFrom.weekday));
          }
          if (definedTo.weekday != DateTime.sunday) {
            definedTo = definedTo
                .add(Duration(days: DateTime.sunday - definedTo.weekday));
          }
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "Last 7 days",
        "condition": () {
          var definedFrom = now.subtract(Duration(days: 6));
          var definedTo = now;
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = now.subtract(Duration(days: 6));
          var definedTo = now;
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "This week",
        "condition": () {
          var definedFrom = now.subtract(Duration(days: now.weekday - 1));
          var definedTo = now;
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = now.subtract(Duration(days: now.weekday - 1));
          var definedTo = now;
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "Previous week",
        "condition": () {
          var definedFrom = now.subtract(Duration(days: now.weekday + 6));
          var definedTo = now.subtract(Duration(days: now.weekday));
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = now.subtract(Duration(days: now.weekday + 6));
          var definedTo = now.subtract(Duration(days: now.weekday));
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "Next week",
        "condition": () {
          var definedFrom = now.add(Duration(days: 8 - now.weekday));
          var definedTo = now.add(Duration(days: 14 - now.weekday));
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = now.add(Duration(days: 8 - now.weekday));
          var definedTo = now.add(Duration(days: 14 - now.weekday));
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "This month",
        "condition": () {
          var definedFrom = DateTime(now.year, now.month, 1);
          var definedTo = DateTime(now.year, now.month + 1, 0);
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = DateTime(now.year, now.month, 1);
          var definedTo = DateTime(now.year, now.month + 1, 0);
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "Previous month",
        "condition": () {
          var definedFrom = DateTime(now.year, now.month - 1, 1);
          var definedTo = DateTime(now.year, now.month, 0);
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = DateTime(now.year, now.month - 1, 1);
          var definedTo = DateTime(now.year, now.month, 0);
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "Next month",
        "condition": () {
          var definedFrom = DateTime(now.year, now.month + 1, 1);
          var definedTo = DateTime(now.year, now.month + 2, 0);
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = DateTime(now.year, now.month + 1, 1);
          var definedTo = DateTime(now.year, now.month + 2, 0);
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "This year",
        "condition": () {
          var definedFrom = DateTime(now.year, 1, 1);
          var definedTo = DateTime(now.year, 12, 31);
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = DateTime(now.year, 1, 1);
          var definedTo = DateTime(now.year, 12, 31);
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "Previous year",
        "condition": () {
          var definedFrom = DateTime(now.year - 1, 1, 1);
          var definedTo = DateTime(now.year - 1, 12, 31);
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = DateTime(now.year - 1, 1, 1);
          var definedTo = DateTime(now.year - 1, 12, 31);
          from = definedFrom;
          to = definedTo;
        },
      },
      {
        "label": "Next year",
        "condition": () {
          var definedFrom = DateTime(now.year + 1, 1, 1);
          var definedTo = DateTime(now.year + 1, 12, 31);
          return from!.isSame(definedFrom) && to!.isSame(definedTo);
        },
        "setValue": () {
          var definedFrom = DateTime(now.year + 1, 1, 1);
          var definedTo = DateTime(now.year + 1, 12, 31);
          from = definedFrom;
          to = definedTo;
        },
      },
    ];
  }

  void setValueOptionByFromAndTo() {
    if (from == null || to == null) return;
    var index = filters.indexWhere((i) => i["condition"]() == true);
    if (index == -1) {
      optionValue = null;
    } else {
      optionValue = filters[index]["label"];
    }
    print("set Label to $optionValue");
    setState(() {});
  }

  void setValueByOption(String option) {
    var index = filters.indexWhere((i) => i["label"] == option);
    if (index == -1) {
      from == null;
      to == null;
    } else {
      filters[index]["setValue"]();
    }
    setState(() {});
    widget.onChanged(from!, to!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.label}",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              Expanded(
                child: QDatePicker(
                  key: Key("from_value_$from"),
                  label: "From",
                  validator: Validator.required,
                  value: from,
                  onChanged: (value) {
                    print("value: $value");
                    from = value;
                    if (from != null && to != null)
                      widget.onChanged(from!, to!);
                  },
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: QDatePicker(
                  key: Key("to_value_$to"),
                  label: "To",
                  validator: Validator.required,
                  value: to,
                  onChanged: (value) {
                    print("value: $value");
                    to = value;
                    if (from != null && to != null)
                      widget.onChanged(from!, to!);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -10, 0),
            child: QCategoryWrapPicker(
              items: filters.map((i) {
                return {
                  "label": i["label"],
                  "value": i["label"],
                };
              }).toList(),
              value: optionValue,
              onChanged: (index, label, value, item) {
                // setRange(value);
                setValueByOption(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
