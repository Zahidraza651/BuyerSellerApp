class UserData {
  String? message;
  String? redirect;
  bool? success;
  var token;
  User? user;

  UserData(
      {required this.message,
      required this.redirect,
      required this.success,
      required this.token,
      required this.user});

  factory UserData.fromjson(Map<String, dynamic> comjson) {
    return UserData(
        message: comjson['message'],
        redirect: comjson['redirect'],
        success: comjson['success'],
        token: comjson['token'],
        user: User.fromjson(comjson['user']));
  }
}

class User {
  String? address;
  String? deviceID;
  String? bussinessName;
  String? coordinates;
  int? countryID;
  String? createdON;
  String? deletedAt;
  String? dob;
  String? education;
  String? email;
  String? verifyEmailAt;
  int? featured;
  String? firebaseMail;
  String? gender;
  int? userid;
  String? idPhoto;
  String? iosDeviceID;
  int? isOnline;
  String? languages;
  String? locale;
  String? mobileNumber;
  String? name;
  String? nicPassport;
  int? openStatus;
  var photo;
  int? role;
  int? roomStatus;
  String? social;
  int? status;
  int? tableStatus;
  String? theme;
  String? type;
  String? updatedAt;
  int? userType;
  String? userName;
  String? vendorType;
  String? webDeviceID;
  String? token;

  User(
      {required this.deviceID,
      required this.bussinessName,
      required this.coordinates,
      required this.countryID,
      required this.createdON,
      required this.deletedAt,
      required this.dob,
      required this.education,
      required this.email,
      required this.verifyEmailAt,
      required this.featured,
      required this.firebaseMail,
      required this.gender,
      required this.userid,
      required this.idPhoto,
      required this.iosDeviceID,
      required this.isOnline,
      required this.languages,
      required this.locale,
      required this.mobileNumber,
      required this.name,
      required this.nicPassport,
      required this.openStatus,
      required this.photo,
      required this.role,
      required this.roomStatus,
      required this.social,
      required this.status,
      required this.tableStatus,
      required this.theme,
      required this.type,
      required this.updatedAt,
      required this.userType,
      required this.userName,
      required this.vendorType,
      required this.webDeviceID,
      required this.token,
      required this.address});

  factory User.fromjson(Map<String?, dynamic> json) {
    return User(
        deviceID: json['android_device_id'],
        bussinessName: json['business_name'],
        coordinates: json['coordinates'],
        countryID: json['country_id'],
        createdON: json['created_at'],
        deletedAt: json['deleted_at'],
        dob: json['dob'],
        education: json['education'],
        email: json['email'],
        verifyEmailAt: json['email_verified_at'],
        featured: json['featured'],
        firebaseMail: json['firebase_email'],
        gender: json['gender'],
        userid: json['id'],
        idPhoto: json['id_photo'],
        iosDeviceID: json['ios_device_id'],
        isOnline: json['is_online'],
        languages: json['languages'],
        locale: json['locale'],
        mobileNumber: json['mobile'],
        name: json['name'],
        nicPassport: json['nic_passport'],
        openStatus: json['is_online'],
        photo: json['photo'],
        role: json['role'],
        roomStatus: json['room_status'],
        social: json['social'],
        status: json['status'],
        tableStatus: json['table_status'],
        theme: json['theme'],
        type: json['type'],
        updatedAt: json['updated_at'],
        userType: json['user_type'],
        userName: json['username'],
        vendorType: json['vendor_type'],
        webDeviceID: json['web_device_id'],
        token: json['token'],
        address: json['address']);
  }
}
