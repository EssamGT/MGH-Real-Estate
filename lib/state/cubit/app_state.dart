
abstract class AppState {}
class Init extends AppState{}
class Login extends AppState{}
class GLogin extends AppState{}
class Logout extends AppState{}
class Sinup extends AppState{}
class Loding extends AppState{} 
class IsLoding extends AppState{} 
class PassReset extends AppState{} 
class GetImage extends AppState{} 
class Clear extends AppState{} 
class GetLocation extends AppState{} 
 class myPosition extends AppState {}

class PlacesLoaded extends AppState {
  final List<dynamic> places;

  PlacesLoaded({required this.places});
}



