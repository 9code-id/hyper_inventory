// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/state_util.dart';

class GridMenuItems extends StatelessWidget {
  final List items;
  GridMenuItems({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isTablet = MediaQuery.of(context).size.width < 1100 &&
          MediaQuery.of(context).size.width >= 850;
      bool isDesktop = MediaQuery.of(context).size.width >= 1100;
      bool isMobile = MediaQuery.of(context).size.width < 850;
      bool tableMode = isDesktop || isTablet;

      int crossAxis = (constraints.biggest.width / 160).floor();
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.0 / 0.6,
          crossAxisCount: crossAxis,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
        ),
        shrinkWrap: true,
        itemCount: items.length,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return InkWell(
            onTap: () async {
              if (tableMode) {
                WebMainNavigationController.instance.updateView(item["view"]);
              } else {
                Get.to(item["view"]);
              }
            },
            child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                color: Colors.grey[300],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item["icon"],
                    size: 32.0,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    item["label"]
                        .toString()
                        .replaceAll("FormView", "")
                        .replaceAll("ListView", ""),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
