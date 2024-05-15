import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_events/core/components/app_bottom_navigation_bar.dart';
import 'package:sport_events/core/components/app_floating_action_button.dart';
import 'package:sport_events/core/components/user_button.dart';
import 'package:sport_events/core/theme.dart';
import 'package:sport_events/core/typography.dart';
import 'package:sport_events/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Sport Events',
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      home: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          bottomNavigationBar: const AppButtonNavigationBar(),
          floatingActionButton: const AppFloatingActionButton(),
          body: Container(),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Sport Events"),
      actions: const [
        UserButton(),
        SizedBox(
          width: 8,
        )
      ],
    );
  }
}
