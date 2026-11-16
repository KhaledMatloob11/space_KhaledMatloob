import 'package:flutter/material.dart';
import 'package:space/core/assets/app_images.dart';
import 'package:space/core/constants/strings.dart';
import 'package:space/core/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.details,
    this.hasBtn = false,
  });

  final String title;
  final String details;
  final bool hasBtn;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Image.asset(
          AppImages.halfPlantImage,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: AppTheme.headerGradientDecoration,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        if(hasBtn)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                            },
                                icon: const Icon(Icons.arrow_back)),
                          ),
                        Center(
                          child: Text(
                            title,
                            style: textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      details,
                      style: textTheme.titleLarge,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}