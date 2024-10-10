import 'package:flutter/material.dart';

class StreamCounter extends StatelessWidget {
  const StreamCounter({
    required this.stream,
    super.key,
    this.itemBuilder,
    this.onEmpty,
    this.padding,
    this.shrinkWrap = false,
  });

  final Stream stream; // Menerima Stream tanpa tipe data
  final Function(List<dynamic> items)? itemBuilder;
  final Function? onEmpty;
  final EdgeInsets? padding;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // StreamBuilder juga tanpa tipe data
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Container();
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          if (onEmpty == null) return Container();
          return onEmpty!();
        }
        final items = snapshot.data;
        return itemBuilder!(items!);
      },
    );
  }
}
