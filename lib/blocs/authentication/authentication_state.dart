import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class FirstLaunch extends AuthenticationState {}

class LoggingIn extends AuthenticationState {}

class OnBoardingPersonality extends AuthenticationState {}

class OnBoardingPreferences extends AuthenticationState {}

class Authenticated extends AuthenticationState {}

class AuthenticatedOnBoard extends AuthenticationState {}

class Unauthenticated extends AuthenticationState {}