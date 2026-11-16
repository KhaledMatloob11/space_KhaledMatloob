import 'package:flutter/material.dart';

class PlanetInfo extends StatelessWidget {
  const PlanetInfo({super.key, required this.title,
  required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {

       final TextTheme textTheme = Theme.of(context).textTheme;

    return Text.rich(TextSpan( children:
    [TextSpan(text: "$title:" ,
        style: textTheme.titleMedium
        ?.copyWith(decoration: TextDecoration.underline)),
           TextSpan(text: value, style: textTheme.bodyLarge),
    ]));
  }
}
