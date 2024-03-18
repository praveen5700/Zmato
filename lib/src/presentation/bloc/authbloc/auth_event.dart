sealed class AuthEvent{}

class LoginWithMobileEvent extends AuthEvent{}

class SendOTPonMailEvent extends AuthEvent{
  final String email;
  SendOTPonMailEvent(this.email);
}

class  VerifyMobileOtpEvent extends AuthEvent{
 final String otpCode;

  VerifyMobileOtpEvent({required this.otpCode});
}

class SignupWithEmailEvent extends AuthEvent{
  final String email;
  final String password;

  SignupWithEmailEvent(this.email, this.password);
}

class VerifyMailOTPEvent extends AuthEvent{
  final String otpCode;
  VerifyMailOTPEvent(this.otpCode);
}