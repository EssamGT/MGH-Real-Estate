class UsersData {
  String uId;
  String uEmail;
  String uFName;
  String uLName;
  int phoneNumber;
  bool admin = false;
  List userFavoritsList = [];
  UsersData(
      {required this.uId,
      required this.uEmail,
      required this.uFName,
      required this.uLName,
      required this.phoneNumber});
}
