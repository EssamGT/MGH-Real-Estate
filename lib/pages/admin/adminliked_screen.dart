import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:mgh/state/cubit/app_state.dart';

class AdminLikedScreen extends StatelessWidget {
  List Favorits = [];

  AdminLikedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLogic, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppLogic.get(context);
        return Favorits.isEmpty
            ? const Center(
                child: Text('No Properties Added To The Favorite List !'))
            : const Column(
                children: [
                  Text('a77laa mesa lnas el kwysa'),
                ],
              );
      },
    );
  }
}
