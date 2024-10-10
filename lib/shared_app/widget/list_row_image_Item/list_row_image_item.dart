// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class ListRowImageItem extends StatelessWidget {
  final dynamic label;
  final dynamic value;
  const ListRowImageItem({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (label.toString().toLowerCase().contains("images") ||
        value.toString().contains(",")) {
      var images = value.toString().split(",");

      return Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        margin: EdgeInsets.only(
          bottom: 12,
        ),
        child: Container(
          constraints: BoxConstraints(
            minHeight: 120,
          ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // color: Colors.grey[300],
              ),
          child: GridView.builder(
            padding: const EdgeInsets.all(12.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.0,
              crossAxisCount: 3,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
            ),
            itemCount: images.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var file = images[index];
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      "${file}",
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    }
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(
        //   Radius.circular(12.0),
        // ),
        border: Border.all(
          width: 0.0,
          color: Colors.transparent,
        ),
      ),
      child: AspectRatio(
        aspectRatio: 1 / 0.5,
        child: Image.network(
          value ??
              "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
