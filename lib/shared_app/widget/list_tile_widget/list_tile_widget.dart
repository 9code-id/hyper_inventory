import 'package:flutter/material.dart';
import 'package:hyper_supabase/shared_app/widget/list_row_header_item/list_row_header_item.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/theme/theme_config.dart';
import 'package:url_launcher/url_launcher.dart';

(
  int flex,
  double width,
  double? height,
) getFlexWidthHeightByLabelValue(String label, dynamic value) {
  label = label.toString().toLowerCase();

  var flex = 1;
  double width = 80.0;
  double? height = null;

  if (label.endsWith("values") || label.endsWith("description")) {
    flex = 0;
    width = 0;
  } else if (label == "id") {
    flex = 0;
    width = 80;
  } else if (label.contains("attach") || label.contains("image")) {
    flex = 0;
    width = 128;
    height = 128;
  } else if (label.endsWith("name")) {
    flex = 3;
    width = 128;
  }
  return (flex, width, height);
}

Widget getListTileWidget(
    String label, dynamic value, TextAlign? align, ListRowItem listRowItem) {
  if (label.endsWith("values")) {
    return SizedBox.shrink();
  }

  if (label.contains("images")) {
    var images = value.toString().split(",");
    return Container(
      width: 128.0,
      height: 128.0,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.0,
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: images.length,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var image = images[index] ??
              "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg";
          return InkWell(
            onTap: () {
              launchUrl(Uri.parse(image));
            },
            child: Image.network(
              image,
              width: 128.0,
              height: 128.0,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
  if (label.contains("attach")) {
    var images = value.toString().split(",");
    return Container(
      width: 128.0,
      height: 128.0,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.0,
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: images.length,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var image = images[index];
          var ext = image.split(".").last;
          return InkWell(
            onTap: () {
              launchUrl(Uri.parse(image));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[300]!,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$ext",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  if (label.contains("image")) {
    var image = value ??
        "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg";
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(value));
      },
      child: Image.network(
        image,
        width: 128.0,
        height: 128.0,
        fit: BoxFit.cover,
      ),
    );
  }
  dynamic formattedValue = value;

  if (label.contains("percent")) {
    formattedValue = (double.tryParse(value.toString()) as double).percentage;
  } else if (value is double) {
    formattedValue = value.currency;
  } else if (value is int) {
    formattedValue = value.toString().number;
  } else if (value is DateTime) {
    formattedValue = (value).dMMMykkmmss;
  }

  if (listRowItem.type == "date") {
    formattedValue =
        DateFormat(listRowItem.format).format(DateTime.parse(value));
  }

  return Text(
    "$formattedValue",
    textAlign: align,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 14.0,
    ),
  );
}
