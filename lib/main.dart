import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato/src/config/router/app_route.dart';
import 'package:zomato/src/core/boc_list.dart';
import 'package:zomato/src/core/di/injector.dart';
void main()async{
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:AppProviders.provider,
      child: MaterialApp.router(
      routerConfig: router,
    ));
  }
}