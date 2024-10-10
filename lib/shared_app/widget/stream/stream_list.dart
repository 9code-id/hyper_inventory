import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class StreamList extends StatefulWidget {
  StreamList({
    this.stream,
    this.future,
    super.key,
    this.isEditMode = false,
    this.adaptiveMode = true,
    this.itemBuilder,
    this.itemsBuilder,
    this.listener,
    this.onEmpty,
    this.padding,
    this.controller,
    this.shrinkWrap = false,
    this.actionButton = false,
    this.headers = const [],
  });
  final bool isEditMode;
  final bool adaptiveMode;
  final bool actionButton;
  final Stream? stream;
  final Future? future;
  final List<ListRowHeaderItem> headers;
  final Function(Map<String, dynamic> item, int index)? itemBuilder;
  final Function(List<Map<String, dynamic>> items)? itemsBuilder;
  final Function(int itemCount)? listener;
  final Function? onEmpty;
  // Important: Default padding must be 0.0
  // Or you will have UI/UX Issue
  final EdgeInsets? padding;
  final bool shrinkWrap;
  final ScrollController? controller;

  @override
  State<StreamList> createState() => _StreamListState();
}

class _StreamListState extends State<StreamList> {
  bool loading = true;
  bool get futureMode => widget.future != null;
  @override
  void initState() {
    super.initState();
    getData();
  }

  List values = [];
  getData() async {
    if (futureMode == true) {
      loading = true;
      if (mounted) setState(() {});

      var response = await widget.future;

      values = List.from(response);

      loading = false;
      if (mounted) setState(() {});
    }
  }

  onItemsBuilder(items) {
    bool isTablet = MediaQuery.of(context).size.width < 1100 &&
        MediaQuery.of(context).size.width >= 850;
    bool isDesktop = MediaQuery.of(context).size.width >= 1100;
    bool isMobile = MediaQuery.of(context).size.width < 850;
    bool tableMode = isDesktop || isTablet;

    if (widget.adaptiveMode == false) {
      tableMode = true;
    }

    if (tableMode) {
      //Desktop version
      return Padding(
        padding: widget.padding ?? const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  ...List.generate(
                    widget.headers.length,
                    (index) {
                      var header = widget.headers[index];

                      var (flex, width, height) =
                          getFlexWidthHeightByLabelValue(
                        header.label,
                        null,
                      );

                      return Expanded(
                        flex: flex,
                        child: Container(
                          width: width,
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            // color: Colors
                            //     .green[900 - (index < 8 ? index * 100 : 0)]!,
                            color: secondaryColor,
                            border: Border.all(
                              width: 0.0,
                              color: secondaryColor,
                            ),
                          ),
                          child: Text(
                            "${header.label}",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  if (widget.actionButton)
                    Expanded(
                      flex: 0,
                      child: Container(
                        width: 100,
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          // color: Colors
                          //     .green[900 - (index < 8 ? index * 100 : 0)]!,
                          color: secondaryColor,
                          border: Border.all(
                            width: 0.0,
                            color: secondaryColor,
                          ),
                        ),
                        child: Text(
                          "Actions",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ).amMoveAndFade,
            Expanded(
              child: ListView.builder(
                controller: widget.controller,
                itemCount: items.length,
                shrinkWrap: widget.shrinkWrap,
                physics:
                    widget.shrinkWrap ? NeverScrollableScrollPhysics() : null,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return widget.itemBuilder!(item, index);
                },
              ),
            ),
          ],
        ),
      );
    } else {
      ///Mobile version
      return Padding(
        padding: widget.padding ?? const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Expanded(
              flex: widget.shrinkWrap == true ? 0 : 1,
              child: ListView.builder(
                controller: widget.controller,
                itemCount: items.length,
                shrinkWrap: widget.shrinkWrap,
                physics:
                    widget.shrinkWrap ? NeverScrollableScrollPhysics() : null,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return widget.itemBuilder!(item, index);
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (futureMode && loading) return Container();

    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onLongPress: () async {
          showLoading();
          await Future.delayed(Duration(seconds: 1));
          hideLoading();
        },
        child: RefreshIndicator(
          onRefresh: () {
            setState(() {});
            return Future.value(true);
          },
          child: Column(
            children: [
              if (futureMode == true && widget.itemsBuilder == null)
                Expanded(
                  child: Builder(
                    builder: (context) {
                      return onItemsBuilder(values);
                    },
                  ),
                ),
              if (futureMode == true && widget.itemsBuilder != null)
                widget.itemsBuilder!(List<Map<String, dynamic>>.from(values)),
              if (futureMode == false)
                Expanded(
                  flex: widget.shrinkWrap ? 0 : 1,
                  child: StreamBuilder(
                    stream: widget.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Container(); // Handle error dengan menampilkan container kosong
                      }

                      var d = snapshot.data;
                      if (d is String) {
                        d = jsonDecode(d);
                      }

                      List items = d ?? [];

                      if (widget.itemsBuilder != null) {
                        if ((!snapshot.hasData || snapshot.data!.isEmpty)) {
                          return widget.onEmpty != null
                              ? widget.onEmpty!()
                              : Container();
                        }
                        return widget.itemsBuilder!(
                            List<Map<String, dynamic>>.from(items));
                      }

                      widget.listener?.call(items.length);

                      return onItemsBuilder(items);
                    },
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
