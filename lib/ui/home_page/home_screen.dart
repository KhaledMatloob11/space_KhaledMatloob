import 'package:flutter/material.dart';
import 'package:space/components/custom_app_bar.dart';
import 'package:space/core/constants/routes.dart';
import 'package:space/core/constants/strings.dart';
import 'package:space/models/planet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(
                title: Strings.explore,
                details: Strings.homeTitleQuestion,
              ),
              SizedBox(
                height: size.height * 0.45,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index % Planet.Planets.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        Planet.Planets[index % Planet.Planets.length].image,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Text(
                      Planet.Planets[selectedIndex].name,
                      style: textTheme.titleLarge,
                    ),
                    IconButton(
                      onPressed: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      Routes.detailsRoute,
                      arguments: Planet.Planets[selectedIndex],
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${Strings.explore} ${Planet.Planets[selectedIndex].name}",
                        style: textTheme.bodyLarge,
                      ),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}