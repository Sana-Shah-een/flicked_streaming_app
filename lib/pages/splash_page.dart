//Package
import 'dart:convert';

import 'package:flicked_app/models/app_config.dart';
import 'package:flicked_app/services/http_service.dart';
import 'package:flicked_app/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

// import '../services/http_service.dart';
// import '../models/app_config.dart';
// import '../services/movie_service.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;
  const SplashPage({super.key, required this.onInitializationComplete});

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    //   Future.delayed(Duration(seconds: 2), _onInitializationComplete);
    // }
    // void _onInitializationComplete() {
    //   widget.onInitializationComplete();
    Future.delayed(Duration(seconds: 2)).then(
      (_) => _setup(context).then((_) => widget.onInitializationComplete()),
    );
  }

  Future<void> _setup(BuildContext context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);
    getIt.registerSingleton<AppConfig>(
      AppConfig(
        configData['API_KEY'],
        configData['BASE_API_URL'],
        configData['BASE_IMAGE_API_URL'],
      ),
    );
    getIt.registerSingleton<HttpService>(HttpService());
    getIt.registerSingleton<MovieService>(MovieService());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flicked App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Container(
        color: Colors.black,
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
