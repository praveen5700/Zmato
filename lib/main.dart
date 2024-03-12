import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato/src/presentation/bloc/authbloc/auth_bloc.dart';
import 'package:zomato/src/presentation/ui/authScreen/screens/signup_screen.dart';

void main(){
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
      providers:[
      BlocProvider(create:(context) => AuthBloc())
    ], child:const MaterialApp(
      home: SignupScreen(),
    ));
  }
}