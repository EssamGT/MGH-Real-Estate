import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgh/pages/admin/adminMainHomeScreen.dart';
import 'package:mgh/pages/home/MainHomeScreen.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:mgh/state/cubit/app_state.dart';

class TheMainHomeScreen extends StatelessWidget {
  const TheMainHomeScreen({super.key});
  static const String route = 'theMainHomeScreen';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLogic, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppLogic.get(context);
        return cubit.isLooding == true
            ? Expanded(
              child: Container(
                color: Colors.white,
                child: const Center(
                    child: CircularProgressIndicator(
                    color: Color(0xFF81B4FF),
                    backgroundColor: Colors.white,
                    
                  )),
              ),
            )
            : cubit.userData['admin'] == true
                ? const AdminMainHomeScreen()
                : const MainHomeScreen();
      },
    );
  }
}
