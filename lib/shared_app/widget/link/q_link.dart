import 'package:flutter/material.dart';

class QLink extends StatelessWidget {
  final Function onTap;
  final String label;
  const QLink({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
