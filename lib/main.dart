import 'package:baseapp/repositories/data_repository.dart';
import 'package:baseapp/repositories/user_repository.dart';
import 'package:baseapp/services/firebase_service.dart';
import 'package:baseapp/simple_bloc_delegate.dart';
import 'package:baseapp/views/bottom_nav_bar.dart';
import 'package:baseapp/views/loading_screen.dart';
import 'package:baseapp/views/login/login_screen.dart';
import 'package:baseapp/views/onboarding/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'blocs/authentication/bloc.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  await Firebase.initializeApp();
  FirebaseService firebaseService = new FirebaseService();
  runApp(InitLayer(
    firebaseService: firebaseService,
  ));
}

class InitLayer extends StatelessWidget {
  final FirebaseService firebaseService;

  const InitLayer({Key key, this.firebaseService})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider<DataRepository>(
          create: (context) => DataRepository(
              firebaseService: firebaseService),
        ),
      ],
      child: MaterialApp(
        title: 'Base App',
        theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Nunito"
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
              create: (context) => AuthenticationBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context),
              )..add(AppStarted()),
            ),
          ],
          child: MainScreen(),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is Uninitialized) {
          return LoadingScreen();
        }
        if (state is FirstLaunch) {
          return OnboardingScreen();
        }
        if (state is Unauthenticated) {
          return LoginScreen();
        }
        if (state is Authenticated) {
          return BottomNavBar();
        }
        return LoadingScreen();
      },
    );
  }
}