import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/base_bloc_widget.dart';
import '../../../../core/colors/color_list.dart';
import '../../../../routes/routes.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';

class SplashScreen extends BaseBlocWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends BaseBlocWidgetState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    callFetchUsers();
  }

  callFetchUsers() =>
      BlocProvider.of<SplashBloc>(context).add(FetchUsersEvent());

  // loadSplash(context) async {
    // await Future.delayed(const Duration(seconds: 1000));

  // }

  @override
  Widget getCustomBloc() => BlocListener<SplashBloc, SplashState>(
        listener: (_, state) {
          if (state is FetchUsersState) {
            navigateAndRemoveAll(context, Routes.dashboard, Routes.dashboard);
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: Text('Splash Screen'),
          ),
        ),
      );
}
