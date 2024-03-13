import 'package:go_router/go_router.dart';
import 'package:zomato/src/config/router/route_constant.dart';
import 'package:zomato/src/presentation/ui/authScreen/screens/mobile_otp_verification.dart';
import 'package:zomato/src/presentation/ui/authScreen/screens/signup_screen.dart';
import 'package:zomato/src/presentation/ui/splashscreen/splash_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SpalshScreen(),
    ),

    // Using Path Parameter
    // GoRoute(
    //     path: '/signup/:id/:name',
    //     builder: (context, state) {
    //       String id = state.pathParameters['id'] ?? '';
    //       String name = state.pathParameters['name'] ?? '';
    //       return SignupScreen(userId:id,userName: name,);
    //     })
   GoRoute(
  path: RouteConstants.signup,
  builder: (context, state) {
    String userName = state.uri.queryParameters['userName'] ?? '';
    String id = state.uri.queryParameters['id'] ?? '';
    return SignupScreen(userName: userName, userId: id);
  },
),

GoRoute(
  path:RouteConstants.motpverifctn,
  builder: (context, state) => const MobileOTPVerfication(), 
  )



  ],
);
