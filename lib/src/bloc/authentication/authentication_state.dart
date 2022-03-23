part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationSuccess extends AuthenticationState {
  final UserCredential userCredential;
  const AuthenticationSuccess(this.userCredential);

  @override
  List<Object> get props => [userCredential];
}

class AuthenticationLoadError extends AuthenticationState {
  @override
  List<Object> get props => [];
}
