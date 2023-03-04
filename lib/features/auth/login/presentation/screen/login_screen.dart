import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestateapp/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:realestateapp/features/auth/login/presentation/bloc/login_state.dart';

import '../../../../../core/base/base_bloc_widget.dart';
import '../../../../../core/colors/color_list.dart';

class LoginScreen extends BaseBlocWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends BaseBlocWidgetState<LoginScreen> {
  @override
  void initState() {
    super.initState();
    loadSplash();
  }

  // callFetchUsers() =>
  //     BlocProvider.of<SplashBloc>(context).add(FetchUsersEvent());

  loadSplash() {
    Future.delayed(const Duration(seconds: 2000), () async {
      //navigateAndRemoveAll(context, Routes.home, Routes.home);
    });
  }

  @override
  Widget getCustomBloc() => BlocListener<LoginBloc, LoginState>(
        listener: (_, state) {},
        child: Container(color: ColorList.blueColor, child: Text('Forget password')),
      );
}
