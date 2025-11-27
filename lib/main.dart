import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/screens/no_internet_screen.dart';
import 'package:flutterstarter/stores/main_store.dart';
import 'package:flutterstarter/theme.dart';
import 'package:flutterstarter/widgets/shared/loader.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'app_router.dart';
import 'get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await Future.wait([getIt().allReady()]);

  runApp(
    MultiProvider(
      providers: [Provider<MainStore>(create: (_) => GetIt.I<MainStore>())],
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  bool isReady = false;
  Key materialAppKey = const ValueKey('');
  double scaleSizeMultiplier = 1;

  bool noInternet = false;

  @override
  void initState() {
    final mainStore = context.storeNonListened;

    reaction((r) => mainStore.isReady, (val) {
      if (!val) return;

      setState(() {
        isReady = true;
        materialAppKey = UniqueKey();
      });
    }, fireImmediately: true);

    reaction((_) => mainStore.settingsStore.scaleSize, (val) {
      setState(() {
        scaleSizeMultiplier = val.size;
      });
    }, fireImmediately: true);

    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    developer.log(state.name, name: 'app.state');

    if (!isReady || noInternet) return;

    if (state == AppLifecycleState.resumed) {}

    if (state == AppLifecycleState.paused) {}
  }

  @override
  void dispose() {
    final mainStore = context.storeNonListened;
    mainStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (noInternet) {
      return const NoInternetScreen();
    }

    if (isReady) {
      return MaterialApp.router(
        key: materialAppKey,
        debugShowCheckedModeBanner: false,
        theme: getThemeData(context),
        routerConfig: GetIt.I<AppRouter>().config(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: context.mediaQuery.copyWith(textScaler: TextScaler.linear(scaleSizeMultiplier)),
            child: child!,
          );
        },
      );
    }
    return MaterialApp(
      theme: getThemeData(context),
      builder: (context, mainStore) {
        return const Scaffold(body: Loader());
      },
    );
  }
}
