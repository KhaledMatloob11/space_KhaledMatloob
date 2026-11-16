import 'package:flutter/material.dart';

class CustomElevateBtn extends StatelessWidget {
  const CustomElevateBtn({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}