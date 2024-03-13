import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato/src/presentation/bloc/authbloc/auth_bloc.dart';

class AppProviders{
  static List<BlocProvider> provider = [
      BlocProvider<AuthBloc>(create:(BuildContext context) => AuthBloc())
  ];
}