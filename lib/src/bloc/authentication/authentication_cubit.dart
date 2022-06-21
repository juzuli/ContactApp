import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'authentication_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthRepository _authenticationRepository;
  AuthenticationCubit(this._authenticationRepository) : super(AuthenticationInitial());
  loginWithEmailPassword(String email, String password) async {
    emit(AuthenticationLoading());
    try {
      UserCredential userCredential = await _authenticationRepository
          .loginWithEmailPassword(email, password);
      if (userCredential == null) {
        emit(AuthenticationLoadError());
      } else {
        emit(AuthenticationSuccess(userCredential));
      }
    } catch (ex) {
      //  showErrorMessage(ex.toString());
      emit(AuthenticationLoadError());
    }
  }

  registerWithEmailPassword(String email, String password,) async {
    emit(AuthenticationLoading());
    try {
      UserCredential userCredential = await _authenticationRepository.registerWithEmailPassword(email, password);
      if (userCredential != null) {
        emit(AuthenticationSuccess(userCredential));
      } else {
        emit(AuthenticationLoadError());
      }
    } catch (ex) {
      //showErrorMessage(ex.toString());
      emit(AuthenticationLoadError());
    }
  }
}
