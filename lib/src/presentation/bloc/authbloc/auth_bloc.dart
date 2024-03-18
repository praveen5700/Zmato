import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zomato/src/domain/repositories/auth_repo.dart';
import 'package:zomato/src/presentation/bloc/authbloc/auth_event.dart';
import 'package:zomato/src/presentation/bloc/authbloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  final AuthRepo authRepo;
  AuthBloc({required this.authRepo}): super(AuthInitialState()){
  on<SignupWithEmailEvent>((event, emit)async{
    try{
     bool? res = await authRepo.registerUserWithEmailPassword(event.email, event.password);
     if(res == true){
      emit(AuthSuccessState());
     }
     else{
      emit(AuthErrorState("Failed to Sign Up"));
     }
    }catch(err){
      emit(AuthErrorState("Failed to Sign Up"));
     debugPrint(err.toString());
    }
  });

  }
}