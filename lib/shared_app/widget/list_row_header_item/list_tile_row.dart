// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_ui/core.dart';

class ListTileRow extends StatelessWidget {
  final bool isEditMode;
  final Function? onDismiss;
  final Function? onTap;
  final List<Widget> children;
  final int index;
  final bool adaptiveMode;
  final List<Widget> actions;
  const ListTileRow({
    Key? key,
    this.onDismiss,
    this.onTap,
    this.isEditMode = false,
    this.children = const [],
    this.adaptiveMode = true,
    this.actions = const [],
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isTablet = MediaQuery.of(context).size.width < 1100 &&
            MediaQuery.of(context).size.width >= 850;
        bool isDesktop = MediaQuery.of(context).size.width >= 1100;
        bool isMobile = MediaQuery.of(context).size.width < 850;

        bool tableMode = isDesktop || isTablet;
        Color rowColor = index % 2 == 0 ? Colors.grey[100]! : Colors.grey[200]!;

        if (!adaptiveMode) {
          tableMode = true;
        }
        //mobile
        return QDismissible(
          onDismiss: () {
            if (onDismiss != null) {
              onDismiss!();
            }
          },
          child: InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              onTap?.call();
            },
            child: Container(
              child: Container(
                padding: const EdgeInsets.all(0.0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: isMobile ? Colors.transparent : rowColor,
                  // border: Border.all(
                  //   width: 0.0,
                  //   color: rowColor,
                  // ),
                  // border: Border.all(
                  //   width: 0.6,
                  //   color: Color(0xffdfdfdf),
                  // ),
                ),
                child: tableMode
                    ? IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Row(
                                children: List.generate(
                                  children.length,
                                  (colIndex) {
                                    var w = children[colIndex] as dynamic;

                                    // if (w is ListRowImageItem) return SizedBox.shrink();

                                    var columns = [];
                                    var values = [];

                                    if (colIndex == 0) {
                                      columns.add(w.label);
                                    }
                                    values.add(w.value);

                                    var value = w.value;
                                    var align = TextAlign.left;

                                    if (value is int || value is double) {
                                      align = TextAlign.right;
                                    }

                                    var label =
                                        w.label.toString().toLowerCase();

                                    var (flex, width, height) =
                                        getFlexWidthHeightByLabelValue(
                                            label, value);

                                    late ListRowItem listRowItem;
                                    if (children[colIndex]
                                        is ListRowImageItem) {
                                      var listRowImageItem = children[colIndex]
                                          as ListRowImageItem;
                                      listRowItem = ListRowItem(
                                        label: listRowImageItem.label,
                                        value: listRowImageItem.value,
                                      );
                                    } else {
                                      listRowItem =
                                          children[colIndex] as ListRowItem;
                                    }
                                    return Expanded(
                                      flex: flex,
                                      child: Container(
                                        width: width,
                                        height: height,
                                        decoration: BoxDecoration(),
                                        padding: const EdgeInsets.all(12.0),
                                        child: getListTileWidget(
                                          label,
                                          value,
                                          align,
                                          listRowItem,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            //Row ACTIONS (Desktop mode)
                            if (actions.isNotEmpty)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Row(
                                  children: actions,
                                ),
                              ),
                          ],
                        ),
                      )
                    :
                    //Mobile version
                    Builder(builder: (context) {
                        List<Widget> visibleChildren = children;

                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 12.0,
                          ),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 3.0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    child: Column(
                                      children: visibleChildren,
                                    ),
                                  ),
                                  if (actions.isNotEmpty)
                                    ListViewActionRow(
                                      children: actions,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
              ),
            ),
          ),
        ).amMoveAndFadeIndex(index);
      },
    );
  }
}
