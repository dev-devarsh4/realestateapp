import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/base_page.dart';
import '../../../../core/bloc/master_bloc.dart';
import 'bloc/dashboard_bloc.dart';
import 'screen/dashboard_screen.dart';


class DashboardPage extends BasePage {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DashboardPageState();
}

class DashboardPageState extends BasePageState<DashboardPage> {
  @override
  Widget getChildBlocWidget(BuildContext context) => BlocProvider(
        create: (context) => DashboardBloc(BlocProvider.of<MasterBloc>(context)),
        child: const DashboardScreen(),
      );
}
