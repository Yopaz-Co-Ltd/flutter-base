import 'package:flutter/material.dart';
import 'package:flutter_base/app_state.dart';
import 'package:flutter_base/assets/translations/localization.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var favorites = appState.favorites;

    return SafeArea(
      child: ListView(
        children: [
          Text(LocalizationText.favoritesCount(favorites.length)),
          ...favorites.map((favorite) {
            return Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                      color: Colors.orangeAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          favorite.asLowerCase,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ))),
            );
          }).toList()
        ],
      ),
    );
  }
}
