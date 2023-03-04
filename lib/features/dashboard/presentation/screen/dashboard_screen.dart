import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestateapp/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:realestateapp/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:realestateapp/features/dashboard/presentation/bloc/dashboard_state.dart';

import '../../../../../core/base/base_bloc_widget.dart';

class DashboardScreen extends BaseBlocWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends BaseBlocWidgetState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  loadSplash() {
    Future.delayed(const Duration(seconds: 2000), () async {
      //navigateAndRemoveAll(context, Routes.home, Routes.home);
    });
  }

  @override
  Widget getCustomBloc() => Scaffold(
        appBar: AppBar(title: Text('Dashboard')),
        body: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (_, state) {
            print('adsfasdf bloc listener called $state');
            if (state is LoadProductState) {
              state.product;

              return ListView.builder(
                  itemCount: state.product.length,
                  itemBuilder: (_, index) {
                    return Text(' item $index');
                  });
            }

            return GestureDetector(
                onTap: () {
                  BlocProvider.of<DashboardBloc>(context)
                      .add(LoadProductEvent());
                },
                child: Text(
                  "Click",
                  style: TextStyle(fontSize: 38),
                ));
          },
        ),
      );
}
