import 'package:email_otp/email_otp.dart';
import 'package:get_it/get_it.dart';
import 'package:zomato/src/core/service/api_service.dart';
import 'package:zomato/src/data/repository_impl/auth_repo_impl.dart';
import 'package:zomato/src/domain/repositories/auth_repo.dart';
import 'package:zomato/src/presentation/bloc/authbloc/auth_bloc.dart';
final GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {


  // ---------------- Api Service ---------------- //
  injector.registerSingleton<ApiService>(ApiService());
  injector.registerSingleton<EmailOTP>(EmailOTP());

// ---------------- Repository ---------------- //

 injector.registerSingleton<AuthRepo>(AuthRepoImpl());

  // ---------------- UseCases ---------------- //

  // 1. Auth
  // injector.registerSingleton<OTPRequestUseCase>(OTPRequestUseCase(injector()));
  // injector.registerSingleton<VerifyOTPUseCase>(VerifyOTPUseCase(injector()));

  // 2. Profile



  // ---------------- Bloc injectors ---------------- //
  injector.registerFactory<AuthBloc>(() => AuthBloc(authRepo:injector()));

}
