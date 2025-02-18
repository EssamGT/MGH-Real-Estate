import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mgh/Classes/property.dart';
import 'package:mgh/componets/g_location.dart';
import 'package:mgh/componets/mess.dart';
import 'package:mgh/pages/Login/login_page.dart';
import 'package:mgh/pages/admin/adminMainHomeScreen.dart';
import 'package:mgh/pages/home/MainHomeScreen.dart';
import 'package:mgh/pages/home/theMainHomeScreen.dart';
import 'package:mgh/state/cubit/app_state.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLogic extends Cubit<AppState> {
  AppLogic() : super(Init()) {
    if (FirebaseAuth.instance.currentUser != null) {
      getUserData();
    }
    // getMyCurrentPosition();
    getAppData();
  }

  Position? myposition;
  static AppLogic get(context) => BlocProvider.of(context);
  static CacheManager customCacheManger = CacheManager.custom(Config(
    'customCacheMangerKey',
    stalePeriod: const Duration(days: 15),
    maxNrOfCacheObjects: 200,
  ));
  Mess me = Mess();
  TextEditingController uemail = TextEditingController();
  TextEditingController uPassword = TextEditingController();
  //
  TextEditingController nemail = TextEditingController();
  TextEditingController nPassword = TextEditingController();
  TextEditingController nUserFName = TextEditingController();
  TextEditingController nUserLName = TextEditingController();
  TextEditingController nUphoneNuber = TextEditingController();
  //
  TextEditingController titel = TextEditingController();
  TextEditingController sstate = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController discription = TextEditingController();
  TextEditingController ttype = TextEditingController();
  TextEditingController rooms = TextEditingController();
  TextEditingController brooms = TextEditingController();
  TextEditingController level = TextEditingController();
  TextEditingController payment = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController finished = TextEditingController();
  TextEditingController furnished = TextEditingController();
  //

  List<Map<String, dynamic>> appData = [];
  List<File> images = [];

  bool isLooding = false;
  bool pass = false;
  Map<String, dynamic> userData = {};
  final credential = FirebaseAuth.instance.currentUser;
  // final Dcredential = FirebaseFirestore.instance.collection('users').where(arrayContains: credential?.uid);

// log & User Data//////////////////////////////////////////////////////////////////////////
  login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: uemail.text, password: uPassword.text);
      getUserData();
      Navigator.pushNamedAndRemoveUntil(
          context, TheMainHomeScreen.route, ModalRoute.withName('/'));
    } on FirebaseAuthException catch (e) {
      print('333333333333333333333333333333333333333333333333333333${e.code}');
      if (e.code == 'invalid-credential') {
        me.mess('Wrong Email or Password');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    emit(Login());
  }

  createacc(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: nemail.text,
        password: nPassword.text,
      );
      print('okk');
      await createUserDocument(
          userId: credential.user!.uid,
          userFname: nUserFName.text,
          userLname: nUserLName.text,
          userEmail: nemail.text,
          userPhoneNumber: int.parse(nUphoneNuber.text));
      print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print('333333333333333333333333333333333333333333333333333333${e.code}');
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        me.mess('The password  is too weak');
      } else if (e.code == 'email-already-in-use') {
        me.mess('The account already exists for that email');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    emit(Sinup());
  }

  Future<void> createUserDocument({
    required String userId,
    required String userFname,
    required String userLname,
    required String userEmail,
    required int userPhoneNumber,
  }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Get the currently signed-in user's UID
      final User? user = auth.currentUser;

      if (user == null) {
        print('No user is signed in.');
        return;
      }

      final String userId = user.uid;

      // Define the user data
      final Map<String, dynamic> userData = {
        'userId': userId,
        'userFName': userFname,
        'userLName': userLname,
        'userEmail': userEmail,
        'userPhoneNumber': userPhoneNumber,
        'userFavoritsList': [],
        'admin': false,
        'createdAt': FieldValue.serverTimestamp(),
      };

      // Create a document in Firestore with the user's UID as the document ID
      await firestore.collection('users').doc(userId).set(userData);

      print('User document created successfully!');
    } catch (e) {
      print('Error creating user document: $e');
    }
  }

  Future<void> getUserData() async {
    isLooding = true;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    if (auth.currentUser == null) {
      print('No user found');
      return;
    }

    try {
      final String uid = auth.currentUser!.uid;

      // Fetch the document from Firestore
      final DocumentSnapshot doc =
          await firestore.collection('users').doc(uid).get();

      // Check if the document exists
      if (doc.exists) {
        // Convert the document to a Map
        userData = doc.data() as Map<String, dynamic>;
        print('User data: $userData');
      } else {
        print('User document does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
    isLooding = false;
    emit(Loding());
  }

  getAppData() async {
    isLooding = true;

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Fetch all documents from the 'property' collection
      QuerySnapshot querySnapshot =
          await firestore.collection('property').get();

      // Check if there are any documents
      if (querySnapshot.docs.isNotEmpty) {
        // Initialize appData if it's not already initialized
        appData = []; // Ensure appData is initialized

        // Loop through each document and add its data to appData
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

          if (data != null) {
            appData.add(data);
          } else {
            print('Document ${doc.id} has null data');
          }
        }

        print('All app data: $appData');
      } else {
        print('No documents found in the collection');
      }
    } catch (e) {
      print('Error fetching app data: $e');
    }
    isLooding = false;
    emit(Loding());
  }

  // getAppData() async {
  //   try {
  //     isLooding = true;
  //     final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //     final DocumentSnapshot doc =
  //         await firestore.collection('property').doc().get();
  //     // Check if the document exists
  //     if (doc.exists) {
  //       // Convert the document to a Map
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //       appData.add(data);
  //       print('App data: $appData');
  //     } else {
  //       print('app document does not exist');
  //     }
  //   } catch (e) {
  //     print('Error fetching app data: $e');
  //   }
  //   isLooding = false;
  //   emit(Loding());
  // }

  logout(context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed(LoginPage.route);
    userData.clear();
    emit(Logout());
  }

  passReset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: uemail.text);
    emit(PassReset());
  }

  Future signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushNamedAndRemoveUntil(
        context, TheMainHomeScreen.route, ModalRoute.withName('/'));
    emit(GLogin());
  }

  clear() {
    area.clear();
    titel.clear();
    price.clear();
    location.clear();
    ttype.clear();
    rooms.clear();
    sstate.clear();
    brooms.clear();
    level.clear();
    finished.clear();
    furnished.clear();
    payment.clear();
    discription.clear();
    images.clear();
    emit(Clear());
  }
// log & User Data//////////////////////////////////////////////////////////////////////////

// Fun /////////////////////////////////////////

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> selectedImages = await picker.pickMultiImage();
    images = selectedImages.map((image) => File(image.path)).toList();
    emit(GetImage());
  }

  Future downloadImagesUrls(List<String> imageUrl) async {
    final cacheManger =
        CacheManager(Config('key', stalePeriod: Duration(days: 15)));
    for (String url in imageUrl) {
      await cacheManger.downloadFile(url);
      return imageUrl;
    }
  }
// Fun /////////////////////////////////////////'

//Location//////////////////////////////////////////////////////////////////////////

  // Future getMyCurrentPosition() async {
  //   await GLocation.currentPosition();
  //   myposition = await Geolocator.getLastKnownPosition().whenComplete(() {
  //     emit(myPosition());
  //   });
  // }

  // void emitPlaceSuggestions(String place, String sessionToken) {
  //   mapRepostery.fetchsuggestaions(place, sessionToken).then((suggestions) {
  //     emit(PlacesLoaded(places: suggestions));
  //   });
  // }

  //   mapRepostery.placeLocation(placeId, sessionToken).then((place) {
  //     emit(PlaceLocationloaded(place));
  //   });
  // }

  //Location//////////////////////////////////////////////////////////////////////////

  void uploadData(BuildContext context) async {
    emit(IsLoding());

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    List<String> imagesUrl = [];
    final Property pro = Property();
    String id = pro.unitId;

    if (images.isNotEmpty) {
      try {
        final storageRef = FirebaseStorage.instance.ref();
        for (int i = 0; i < images.length; i++) {
          String imageName =
              '${DateTime.now().millisecondsSinceEpoch}_${basename(images[i].path)}';

          final propertyref = storageRef.child(imageName);
          final poropertyImagesRef =
              storageRef.child('property/$id/$imageName');
          await poropertyImagesRef.putFile(images[i]);
          print("Uploading image: $imageName");

          String imageUrl = await poropertyImagesRef.getDownloadURL();
          imagesUrl.add(imageUrl);
          pro.imagesUrl = imagesUrl;
        }
        print("Image uploaded successfully: $imagesUrl");
      } on FirebaseException catch (e) {
        print("Failed to upload image: ${e.message}");
      } catch (e) {
        print("An unexpected error occurred: $e");
      }
    }

    pro.title = titel.text;
    pro.price = int.parse(price.text);
    pro.area = int.parse(area.text);
    pro.location = location.text;
    pro.state = sstate.text;
    pro.bedrooms = rooms.text;
    pro.bathrooms = brooms.text;
    pro.level = level.text;
    pro.finishin = finished.text;
    pro.paymentOption = payment.text;
    pro.description = discription.text;
    pro.type = ttype.text;
    pro.furnished = furnished.text;

    Map<String, dynamic> proprtty = {
      'puplishingUserName': userData['userFName'],
      'puplishingUserId': userData['userId'],
      'unitid': pro.unitId,
      'images': pro.imagesUrl,
      'title': pro.title,
      'price': pro.price,
      'area': pro.area,
      'location': pro.location,
      'state': pro.state,
      'type': pro.type,
      'bedrooms': pro.bedrooms,
      'bathrooms': pro.bathrooms,
      'level': pro.level,
      'finifhin': pro.finishin,
      'payment': pro.paymentOption,
      'description': pro.description,
      'furnished': pro.furnished,
    };
    // await firestore.collection('property').doc(pro.unitId).set(proprtty);
    // appData .clear();
    // await clear();
    // await getAppData();
    isLooding = false;
    emit(Loding());

    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.success,
      title: 'Upload Success',
    ).show();
  }

  deleteProperty(BuildContext context, String id) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child("property/$id");
      await storageRef.delete();
      print('File deleted successfully');
    } catch (e) {
      print('Error deleting file: $e');
    }
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('property').doc(id).delete();
      appData = [];
      await getAppData();
      print('data deleted successfully');
    } catch (e) {
      print('Error deleting data: $e');
    }

    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.success,
      title: 'Deleted Successfully',
    ).show();
  }

  editProperty(String id,  ) async {
    isLooding = true;
    emit(IsLoding());

    CollectionReference data =
        FirebaseFirestore.instance.collection('property');

    final storageRef = FirebaseStorage.instance.ref();
    final Property pro = Property();

     await data.doc(id).update({
        'title': titel.text,
        'price': int.parse(price.text),
        'pro.area': int.parse(area.text),
        'location': location.text,
        'state': sstate.text,
        'type': ttype.text,
        'bedrooms': rooms.text,
        'bathrooms': brooms.text,
        'level': level.text,
        'finifhin': finished.text,
        'payment': payment.text,
        'description': discription.text,
        'furnished': furnished.text,
      }).then((onValue)=> print("#################### Data Updated")).catchError((error)=> print(error));
    

    appData.clear();
  await  getAppData();
    isLooding = false;
    emit(Loding());
    

  
  }

  Future<void> makePhoneCall(String number) async {
    final Uri callUri = Uri.parse('tel:$number');
    try {
      if (await canLaunchUrl(callUri)) {
        await launchUrl(callUri);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> makeSms(String number) async {
    final Uri callUri = Uri.parse('sms:$number');
    try {
      if (await canLaunchUrl(callUri)) {
        await launchUrl(callUri);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> makeWhatsapp(
    String phoneNumber,
  ) async {
    final String message = "Hello! I'm interested in your service.";
    final Uri whatsappUri = Uri.parse(
        "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      throw 'Could not launch $whatsappUri';
    }
  }

  // void uploadImage() async {
  //   var imagesRef = FirebaseStorage.instance.ref();
  //   await imagesRef.putFile(images[0]);
  //   var url = await imagesRef.getDownloadURL();
  // }
}
