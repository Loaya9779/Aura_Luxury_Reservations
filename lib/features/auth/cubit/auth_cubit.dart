import 'package:aura_luxury_reservations/features/auth/cubit/states.dart';
import 'package:aura_luxury_reservations/features/auth/model/user_model.dart';
import 'package:aura_luxury_reservations/core/data_source/firebase_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  bool isPasswordHidden = true;

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(TogglePasswordVisibilityState());
  }

  Future<void> signUp(
    String userName,
    String email,
    String password,
    String phone,
  ) async {
    emit(AuthLoadingState());
    try {
      await firebaseDataSource.signUp(email, password, userName, phone);
      emit(SignUpSuccessState());
    } catch (e) {
      emit(AuthErrorState(error: e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoadingState());
    try {
      UserModel? userModel = await firebaseDataSource.signIn(email, password);
      if (userModel != null) {
        emit(LogInSuccessState(userModel: userModel));
      }
    } catch (e) {
      emit((AuthErrorState(error: e.toString())));
    }
  }

  Future<void> forgetPassword(String email) async {
    emit(AuthLoadingState());
    try {
      await firebaseDataSource.forgetPassword(email);
      emit(ForgetPasswordSuccessState());
    } catch (e) {
      emit(AuthErrorState(error: e.toString()));
    }
  }
}
