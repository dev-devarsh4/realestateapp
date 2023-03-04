import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/base_page.dart';
import '../../../../core/bloc/master_bloc.dart';
import 'bloc/forget_password_bloc.dart';
import 'screen/forget_password_screen.dart';


class ForgetPasswordPage extends BasePage {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ForgetPasswordPageState();
}

class ForgetPasswordPageState extends BasePageState<ForgetPasswordPage> {
  @override
  Widget getChildBlocWidget(BuildContext context) => BlocProvider(
        create: (context) => ForgetPasswordBloc(BlocProvider.of<MasterBloc>(context)),
        child: const ForgetPasswordScreen(),
      );
}
