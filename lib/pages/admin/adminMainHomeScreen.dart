import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgh/pages/admin/adminMassage_screen.dart';
import 'package:mgh/pages/admin/adminProfile_screen.dart';
import 'package:mgh/pages/admin/adminSearch_screen.dart';
import 'package:mgh/pages/admin/adminSetttings_screen.dart';
import 'package:mgh/pages/admin/adminhome_screen.dart';
import 'package:mgh/pages/admin/adminliked_screen.dart';
import 'package:mgh/pages/admin//bottom_nav/models/nav_item_model.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:mgh/state/cubit/app_state.dart';
import 'package:rive/rive.dart';

const Color bottomNavBgColor = Color(0xFF17203A);

class AdminMainHomeScreen extends StatefulWidget {
  const AdminMainHomeScreen({super.key});
  static const String route = 'AdminmainHomeScreen';

  @override
  State<AdminMainHomeScreen> createState() => _AdminMainHomeScreenState();
}

class _AdminMainHomeScreenState extends State<AdminMainHomeScreen> {
  List pages = [
    AdminHomeScreen(),
    AdminSearchScreen(),
    AdminLikedScreen(),
     const AdminProfileScreen(),
     const AdminSetttingsScreen(),
  ];

  List<StateMachineController> controllers = [];
  List<SMIBool?> riveIconInput =
      List<SMIBool?>.filled(bottomNavItems.length, null);
  int slectedIndex = 0;

  void animateTheIcon(index) {
    if (riveIconInput[index] != null) {
      riveIconInput[index]!.change(true);
    } else {
      print('Error: riveIconInput[$index] is not initialized yet.');
    }
    Future.delayed(const Duration(seconds: 3), () {
      riveIconInput[index]!.change(false);
    });
  }

  void riveOnInIt(Artboard artboard, index,
      {required String stateMachineController}) async {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineController);

    if (controller == null) {
      print('Error: Controller could not be created for index $index.');
      return;
    }

    artboard.addController(controller);
    controllers.add(controller);
    final input = controller.findInput<bool>('active') as SMIBool?;
    if (input == null) {
      print('Error: "active" input not found for index $index.');
      return;
    }

    riveIconInput[index] = input;
    print('Controller and input successfully initialized for index $index.');
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLogic, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppLogic.get(context);
        return cubit.isLooding==true? const Center(
          child: CircularProgressIndicator(
          color: Color(0xFF17203A),
          backgroundColor: Colors.white,
        )): Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          appBar: AppBar(
            
            backgroundColor: bottomNavBgColor,
            title: const Text(
              'MGH GROUP Admin',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: pages[slectedIndex],
          ),
          bottomNavigationBar: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: bottomNavBgColor.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: bottomNavBgColor.withOpacity(0.3),
                      offset: const Offset(0, 20),
                      blurRadius: 20,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    bottomNavItems.length,
                    (index) {
                      final riveIcon = bottomNavItems[index].rive;
                      return GestureDetector(
                        onTap: () {
                          animateTheIcon(index);
                          setState(() {
                            slectedIndex = index;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedBar(isActive: slectedIndex == index),
                            SizedBox(
                              height: 36,
                              width: 36,
                              child: Opacity(
                                opacity: slectedIndex == index ? 1 : 0.5,
                                child: RiveAnimation.asset(
                                  riveIcon.src,
                                  artboard: riveIcon.artboard,
                                  onInit: (artboard) async {
                                    riveOnInIt(artboard, index,
                                        stateMachineController:
                                            riveIcon.stateMachineName);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )),
          )),
        );
      },
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 25 : 0,
      decoration: const BoxDecoration(
        color: Color(0xFF81B4FF),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
