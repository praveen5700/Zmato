
sealed class AuthState{}

class AuthInitialState extends AuthState{}

class AuthLoadingState extends AuthState{}

class AuthSuccessState extends AuthState{}

class AuthErrorState extends AuthState{
  final String errormsg;

  AuthErrorState(this.errormsg);
}












// class AuthState {
//   final bool isLoading;
//   final bool isError;
//   final bool isSuccess;
//   final String errorMessage;
//   final List<String>? data; 

//   AuthState({
//     required this.isLoading,
//     required this.isError,
//     required this.isSuccess,
//     required this.errorMessage,
//     this.data,
//   });

//   factory AuthState.initial() {
//     return AuthState(
//       isLoading: false,
//       isError: false,
//       isSuccess: false,
//       errorMessage: '',
//       data: null,
//     );
//   }

//   factory AuthState.loading() {
//     return AuthState(
//       isLoading: true,
//       isError: false,
//       isSuccess: false,
//       errorMessage: '',
//       data: null,
//     );
//   }

//   factory AuthState.error(String message) {
//     return AuthState(
//       isLoading: false,
//       isError: true,
//       isSuccess: false,
//       errorMessage: message,
//       data: null,
//     );
//   }

//   factory AuthState.success(List<String> data) {
//     return AuthState(
//       isLoading: false,
//       isError: false,
//       isSuccess: true,
//       errorMessage: '',
//       data: data,
//     );
//   }

//   AuthState copyWith({
//     bool? isLoading,
//     bool? isError,
//     bool? isSuccess,
//     String? errorMessage,
//     List<String>? data,
//   }) {
//     return AuthState(
//       isLoading: isLoading ?? this.isLoading,
//       isError: isError ?? this.isError,
//       isSuccess: isSuccess ?? this.isSuccess,
//       errorMessage: errorMessage ?? this.errorMessage,
//       data: data ?? this.data,
//     );
//   }
// }

