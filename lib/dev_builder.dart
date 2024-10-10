import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_supabase/module_sorter.dart';

class DevBuilder extends StatefulWidget {
  final Widget? child;
  const DevBuilder({
    super.key,
    this.child,
  });

  @override
  State<DevBuilder> createState() => DevBuilderState();
}

class DevBuilderState extends State<DevBuilder> {
  static late DevBuilderState instance;
  @override
  void initState() {
    super.initState();
    instance = this;
  }

  refresh() {
    setState(() {});
  }

  Widget devText(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: Text(
        "$label",
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget devAction(
    String text,
    String code, [
    String? customClass,
  ]) {
    return InkWell(
      onTap: () => viewCode(
        type: '$code',
        customClass: customClass,
      ),
      child: devText(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) return widget.child!;
    return Column(
      children: [
        Expanded(
          child: widget.child!,
        ),
        if (kDebugMode)
          Material(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => Get.to(ModuleSorterView()),
                    child: Icon(
                      Icons.sort,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  InkWell(
                    onTap: () {
                      //if context can back?
                      if (Navigator.of(globalContext).canPop()) {
                        Navigator.of(globalContext).pop();
                      }
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  InkWell(
                    onTap: () => Get.to(DeveloperView()),
                    child: Icon(
                      Icons.developer_mode,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
