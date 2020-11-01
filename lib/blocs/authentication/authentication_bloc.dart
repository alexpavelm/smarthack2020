import 'dart:async';
import 'package:baseapp/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    } else if (event is GoToPersonalityOnBoarding) {
      yield* _mapGoToPersonalityOnBoardingToState();
    } else if (event is GoToPreferencesOnBoarding) {
      yield* _mapGoToPreferencesOnBoardingToState();
    } else if (event is FinishedOnBoarding) {
      yield* _mapFinishedOnBoardingToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    final isSignedIn = _userRepository.isSignedIn();
    if (isSignedIn) {
      yield Authenticated();
    } else {
      if (await _userRepository.isFirstTime()) {
        _userRepository.setUserFirstTime();
        yield FirstLaunch();
      } else {
        yield Unauthenticated();
      }
    }
  }

  Stream<AuthenticationState> _mapFinishedOnBoardingToState() async* {
    yield Unauthenticated();
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield LoggingIn();
    UserCredential userCredential = await _userRepository.signInAnonymously();
    if (userCredential != null) {
      yield Authenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    _userRepository.signOut();
    yield Unauthenticated();
  }

  Stream<AuthenticationState> _mapGoToPersonalityOnBoardingToState() async* {
    yield OnBoardingPersonality();
  }

  Stream<AuthenticationState> _mapGoToPreferencesOnBoardingToState() async* {
    yield OnBoardingPreferences();
  }
}