import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sport_events/core/components/app_bottom_navigation_bar.dart';
import 'package:sport_events/core/components/app_floating_action_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return MaterialApp(
      title: 'Sport Events',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Sport Events"),
          ),
          bottomNavigationBar: const AppButtonNavigationBar(),
          floatingActionButton: const AppFloatingActionButton(),
          body: Container(),
        ),
      ),
    );
  }
}
