import 'package:flutter/material.dart';

class StreamGridList extends StatelessWidget {
  const StreamGridList({
    required this.stream,
    super.key,
    this.itemBuilder,
    this.itemsBuilder,
    this.listener,
    this.onEmpty,
    this.padding,
    this.controller,
    this.shrinkWrap = false,
  });

  final Stream stream; // Menggunakan Stream untuk data Supabase
  final Function(Map<String, dynamic> item, int index)? itemBuilder;
  final Function(List<Map<String, dynamic>> items)? itemsBuilder;
  final Function(int itemCount)? listener;
  final Function? onEmpty;
  final EdgeInsets? padding;
  final bool shrinkWrap;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Container(); // Handle error dengan menampilkan container kosong
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return onEmpty != null ? onEmpty!() : Container();
        }

        final items = snapshot.data!;
        if (itemsBuilder != null) {
          return itemsBuilder!(items);
        }

        listener?.call(items.length);

        var crossAxisCount = 2;
        if (MediaQuery.of(context).size.width > 480) {
          crossAxisCount = (MediaQuery.of(context).size.width / 240).floor();
        }

        return GridView.builder(
          controller: controller,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0 / 1.1,
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: items.length,
          shrinkWrap: shrinkWrap,
          padding: padding ?? const EdgeInsets.all(20),
          physics: shrinkWrap ? const NeverScrollableScrollPhysics() : null,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return itemBuilder!(item, index);
          },
        );

        return ListView.builder(
          controller: controller,
          itemCount: items.length,
          shrinkWrap: shrinkWrap,
          padding: padding ?? const EdgeInsets.all(20),
          physics: shrinkWrap ? const NeverScrollableScrollPhysics() : null,
          itemBuilder: (context, index) {
            final item = items[index];
            return itemBuilder!(item, index);
          },
        );
      },
    );
  }
}
