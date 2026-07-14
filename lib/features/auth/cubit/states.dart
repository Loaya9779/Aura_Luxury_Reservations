import 'package:aura_luxury_reservations/features/auth/model/user_model.dart';

sealed class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class SignUpSuccessState extends AuthStates {}

class LogInSuccessState extends AuthStates {
  final UserModel userModel;
  LogInSuccessState({required this.userModel});
}

class LogOutSuccessState extends AuthStates {}

class AuthErrorState extends AuthStates {
  final String error;
  AuthErrorState({required this.error});
}

class ForgetPasswordSuccessState extends AuthStates {}
class TogglePasswordVisibilityState extends AuthStates {}