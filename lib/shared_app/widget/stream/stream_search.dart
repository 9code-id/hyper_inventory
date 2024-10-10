import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class StreamSearch extends StatefulWidget {
  final Function? onFilter;
  final Function? onReset;
  final Function? onDeleteAll;
  final bool enableDeleteAll;
  final bool filterMode;
  final List<Widget> widgets;

  const StreamSearch({
    this.onFilter,
    this.onDeleteAll,
    this.onReset,
    this.filterMode = false,
    this.widgets = const [],
    this.enableDeleteAll = true,
    super.key,
  });

  @override
  State<StreamSearch> createState() => _StreamSearchState();
}

class _StreamSearchState extends State<StreamSearch> {
  _showDialog() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(0.0),
          content: Container(
            margin: const EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              maxWidth: 400.0,
            ),
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 24,
                          offset: Offset(0, 11),
                        ),
                      ],
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey[300]!,
                      ),
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            controller: ScrollController(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...widget.widgets,
                              ],
                            ),
                          ),
                        ),
                        //ACTION
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: QButton(
                                label: "Cancel",
                                color: disabledColor,
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                              child: QButton(
                                label: "Search",
                                onPressed: () async {
                                  widget.onFilter!();
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                              widget.onReset?.call();
                            },
                            child: Text(
                              "Reset",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.enableDeleteAll)
          if ((widget.onDeleteAll != null && isDevMode) ||
              widget.enableDeleteAll)
            IconButton(
              onPressed: () {
                widget.onDeleteAll!();
              },
              icon: Stack(
                children: [
                  const Icon(
                    Icons.delete_sweep_outlined,
                  ),
                ],
              ),
            ),
        IconButton(
          onPressed: _showDialog,
          icon: Stack(
            children: [
              const Icon(
                Icons.search,
              ),
              if (widget.filterMode)
                const Positioned(
                  right: 4,
                  bottom: 0,
                  child: Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 8,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
