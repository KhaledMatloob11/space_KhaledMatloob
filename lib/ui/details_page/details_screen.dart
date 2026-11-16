import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:space/components/custom_app_bar.dart';
import 'package:space/components/planet_info.dart';
import 'package:space/core/assets/app_colors.dart';
import 'package:space/core/constants/strings.dart';
import 'package:space/models/planet.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final Flutter3DController _controller = Flutter3DController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is! Planet) {
      return const Scaffold(
        body: Center(
          child: Text('Error: Planet data not found!'),
        ),
      );
    }

    final Planet planet = args;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(
                title: planet.name,
                details: planet.title,
                hasBtn: true,
              ),
              AspectRatio(
                aspectRatio: 1,
                child: Flutter3DViewer(
                  controller: _controller,
                  progressBarColor: AppColors.red,
                  src: planet.model,
                  activeGestureInterceptor: true,
                  enableTouch: true,
                ),
              ),
              Text(
                Strings.about,
                textAlign: TextAlign.start,
                style: textTheme.titleLarge,
              ),
              Text(
                planet.about,
                style: textTheme.bodyMedium,
              ),
              const Divider(thickness: 0.5),
              PlanetInfo(
                title: Strings.distanceFromSun,
                value: planet.distanceFormSun,
              ),
              PlanetInfo(
                title: Strings.lengthOfDay,
                value: planet.lengthOfDay,
              ),
              PlanetInfo(
                title: Strings.orbitalPeriod,
                value: planet.orbitalPeriod,
              ),
              PlanetInfo(
                title: Strings.radius,
                value: planet.radius,
              ),
              PlanetInfo(
                title: Strings.mass,
                value: planet.mass,
              ),
              PlanetInfo(
                title: Strings.gravity,
                value: planet.gravity,
              ),
              PlanetInfo(
                title: Strings.surfaceArea,
                value: planet.surfaceArea,
              ),
            ],
          ),
        ),
      ),
    );
  }
}