import 'package:bloc/bloc.dart';
import 'package:zomato/src/presentation/bloc/authbloc/auth_event.dart';
import 'package:zomato/src/presentation/bloc/authbloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc(): super(AuthInitialState());
}