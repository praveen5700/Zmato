import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zomato/src/core/di/injector.dart';
import 'package:zomato/src/core/utility/utilis.dart';
import 'package:zomato/src/domain/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  //FirebaseAuth auth = FirebaseAuth.instance;
  EmailOTP myauth = injector<EmailOTP>();

  //send otp on mail
  @override
  Future<bool> sendOTPonMail(String userEmail) async {
     bool res = false;
    debugPrint(userEmail);
    myauth.setConfig(
        appEmail: "zomato@food.com",
        appName: "Zomato",
        userEmail: userEmail,
        otpLength: 6,
        otpType: OTPType.digitsOnly);
    if (await myauth.sendOTP() == true) {
        res = true;
    }
    return res;
  }
//  @override
//   Future<bool?> registerUserWithEmailPassword(String email, String password) async{
//     bool? res;
//     await auth.createUserWithEmailAndPassword(email: email, password: password)
//     .then((value) async {
//       res = true;
//       debugPrint("Success SignUp");
//       // Send verification email
//        await sendVerificationEmail();
//     }).onError((error, stackTrace) {
//       debugPrint("Error While SignUp $error");
//       res = false;

//     });
//     return res;
//   }

//   @override
//   Future<void> sendVerificationEmail() async {
//     await auth.currentUser!.sendEmailVerification();
//     Utilis.showSuccessMessage("Verification email sent");
//   }

//   @override
//   Future<bool?> logOut() async {
//     bool? res;
//     await auth.signOut().then((value) {
//       debugPrint("Logout Success");
//       res = true;
//     }).onError((error, stackTrace) {
//       res = false;
//     });
//     return res;
//   }

// //Methos to login using email password
//  @override
// Future<bool?> loginUsingEmailAndPassword(String email, String password) async {
//   bool? res;
//   debugPrint("Email :$email \n Password: $password");
//   await auth.signInWithEmailAndPassword(
//     email: email,
//     password: password,
//   ).then((value) async{
//     await auth.currentUser!.reload();
//      // Handle the case when the user's email is verified
//     if (value.user!.emailVerified) {
//       debugPrint("User logged in successfully");
//       res = true;
//     }
//      // Handle the case when the user's email is not verified
//     else {
//       Utilis.showSuccessMessage("User's email is not verified");
//       res = false;
//     }
//   }).onError((error, stackTrace) {
//     res = false;
//     debugPrint("Error is $error");
//   });

//   return res;
// }
// @override
// Future<bool?> resetPassword(String email) async {
//   bool? res;
//   try {
//     await auth.sendPasswordResetEmail(email: email);
//     res = true;
//     debugPrint("Password reset email sent");
//   } catch (e) {
//     res = false;
//     debugPrint("Failed to send password reset email: $e");
//   }
//   return res;
// }

//  @override
// Future<bool> changePassword(String currentPassword, String newPassword) async {
//   try {
//     User? user = auth.currentUser;
//     if (user != null) {
//       // Reauthenticate the user using the provided current password
//       AuthCredential credential = EmailAuthProvider.credential(
//         email: user.email!,
//         password: currentPassword,
//       );

//       await user.reauthenticateWithCredential(credential);
//       // Change the user's password
//       await user.updatePassword(newPassword);
//       return true;
//     } else {
//       debugPrint('User not signed in');
//       return false;
//     }
//   } catch (e) {
//    Utilis.showErrorMessage('Error changing password');
//     return false;
//   }
// }
}
