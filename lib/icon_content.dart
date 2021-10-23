import 'package:bmi_densooluk_indeksi/constants.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class iconContent extends StatelessWidget {
  final IconData icon;
  final String text;
  const iconContent({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(icon, size: 85.0),
        Text(
          text,
          style: kIconTextStyle,
        ),
      ],
    );
  }
}
