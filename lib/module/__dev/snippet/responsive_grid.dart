/*

//#TEMPLATE grid_responsive
LayoutBuilder(builder: (context,
  BoxConstraints constraints) {
  var maxWidth = 180;
  var crossAxisCount =
      (constraints.maxWidth / maxWidth)
          .ceil();

  return GridView.builder(
    padding: EdgeInsets.zero,
    gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 1.0 / 0.4,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
    ),
    itemCount: items.length,
    shrinkWrap: true,
    physics: const ScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      var item = items[index];
      return InkWell(
        onTap: () {
          
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Text(
                "Menu \$index",
                textAlign:
                    TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
  }),
//#END
*/
