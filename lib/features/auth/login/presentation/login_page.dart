import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/base_page.dart';
import '../../../../core/bloc/master_bloc.dart';
import 'bloc/login_bloc.dart';
import 'screen/login_screen.dart';


class LoginPage extends BasePage {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends BasePageState<LoginPage> {
  @override
  Widget getChildBlocWidget(BuildContext context) => BlocProvider(
        create: (context) => LoginBloc(BlocProvider.of<MasterBloc>(context)),
        child: const LoginScreen(),
      );
}
