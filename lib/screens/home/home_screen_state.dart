import 'package:flutter/material.dart';
import 'package:flutter_base/assets/translations/localization.dart';
import 'package:flutter_base/screens/home/children/favorites/favorites_screen.dart';
import 'package:flutter_base/screens/home/children/generator/generator_screen.dart';
import 'package:flutter_base/screens/home/home_screen.dart';
import 'package:flutter_base/screens/home/home_screen_arguments.dart';
import 'package:flutter_base/utils/navigation_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;
  var isHelloUserShown = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isHelloUserShown) return;
      isHelloUserShown = true;

      final homeScreenArguments =
          NavigationUtils.getArguments<HomeScreenArguments>(context);
      final userName = homeScreenArguments?.userName;
      final helloUserName =
          userName != null ? LocalizationText.homeHelloUser(userName) : "";
      Fluttertoast.showToast(msg: helloUserName);
    });

    Widget page;
    switch (selectedIndex) {
      case 1:
        page = FavoritesScreen();
        break;
      default:
        page = GeneratorScreen();
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(LocalizationText.home),
        ),
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text(LocalizationText.home),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text(LocalizationText.favorite),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
