import 'package:flutter/material.dart';
import 'package:project_base/models/state/app_state.dart';
import 'package:project_base/models/state/login_state.dart';
import 'package:project_base/utils/constants.dart';
import 'package:project_base/utils/local_storage_helper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final loginStateModel = context.watch<LoginStateModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email from provider: ${loginStateModel.email}'),
            Text(
              'Email from Shared preferences: ${LocalStorageHelper.getString(Constants.prefsEmail)}',
            ),
            const SizedBox(
              height: 48,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                context.read<AppStateModel>().logout();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Text(
                  'LogOut',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
