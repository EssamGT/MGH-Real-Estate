import 'package:mgh/pages/home/bottom_nav/models/rive_model.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;
  NavItemModel({required this.title, required this.rive});
}

List<NavItemModel> bottomNavItems = [

  NavItemModel(
    title: "home",
    rive: RiveModel(
        src: 'assets/RiveAssets/icons.riv',
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
  ),


NavItemModel(
  title: "Search",
 rive: RiveModel(
  src: 'assets/RiveAssets/icons.riv', 
  artboard: "SEARCH", 
  stateMachineName: "SEARCH_Interactivity"),),

// NavItemModel(
//     title: "Chat",
//     rive: RiveModel(
//         src: 'assets/RiveAssets/icons.riv',
//         artboard: "CHAT",
//         stateMachineName: "CHAT_Interactivity"),
//   ),

NavItemModel(
  title: "star",
 rive: RiveModel(
  src: 'assets/RiveAssets/icons.riv', 
  artboard: "LIKE/STAR", 
  stateMachineName: "STAR_Interactivity"),),

NavItemModel(
  title: "Profile",
 rive: RiveModel(
  src: 'assets/RiveAssets/icons.riv', 
  artboard: "USER", 
  stateMachineName: "USER_Interactivity"),),
  
NavItemModel(
  title: "settings",
 rive: RiveModel(
  src: 'assets/RiveAssets/icons.riv', 
  artboard: "SETTINGS", 
  stateMachineName: "SETTINGS_Interactivity"),),

];
