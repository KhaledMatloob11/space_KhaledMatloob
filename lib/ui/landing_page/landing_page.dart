import 'package:flutter/material.dart';
import 'package:space/core/assets/app_images.dart';
import 'package:space/core/constants/routes.dart';
import 'package:space/core/constants/strings.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          alignment: Alignment.centerLeft ,
        children:[
          Image.asset(
            AppImages.splashImage,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(Routes.homeRoute);
                },
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Strings.exploreTheUniverse,
                        style: Theme.of(context).textTheme.bodyLarge),
                    const Icon(Icons.arrow_forward)
                  ],
                ) ),
          )

        ],
      )
    );
  }
}
