<<<<<<< HEAD


class AppUser {
  int id;
  String email;
  String? phone_number;
  String first_name;
  String last_name;
  String gender;
  String? fcm_token;
  String refresh_token;
  String access_token;
  bool is_staff;
  bool is_active;
  DateTime token_expire;
  // String department;
  List<String> groups;
  String? avatar;

  AppUser({
    required this.id,
    required this.email,
    this.phone_number,
    required this.first_name,
    required this.last_name,
    required this.gender,
    this.fcm_token,
    required this.access_token,
    required this.refresh_token,
    required this.token_expire,
    required this.is_staff,
    required this.is_active,
    // this.department,
    required this.groups,
    this.avatar,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
        id: json["id"] as int,
        email: json["email"],
        phone_number: json["phone_number"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        gender: json["gender"],
        fcm_token: json["fcm_token"],
        access_token: json["access_token"] ?? '',
        refresh_token: json["refresh_token"] ?? "",
        is_staff: json["is_staff"] ?? false,
        is_active: json["actif"] ?? true,
        avatar: json["avatar"],
        // department: json["department"],
        // groups: json["groups"] != null && json["groups"]?.cast<String>().,
      groups: ((json["groups"] as List)
            .map((obj) =>
                obj["name"] as String
              )
            .toList() ??
            []),
      token_expire: DateTime.now().add(Duration(days: 30, hours: -1)),
    );

  }

  factory AppUser.fromLocalJson(Map<String, dynamic> json) {
    return AppUser(
        id: json["id"],
        email: json["email"],
        phone_number: json["phone_number"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        gender: json["gender"],
        fcm_token: json["fcm_token"],
        access_token: json["access_token"],
        refresh_token: json["refresh_token"],
        avatar: json["avatar"],
        is_staff: json["is_staff"] == 0 ? false : true,
        is_active: json["is_active"] == 0 ? false : true,
        // department: json["department"],
        groups: json["groups"] != null ?
        (json["groups"].toString().split(",") )
         : [],
        token_expire: DateTime.now().add(Duration(days: 30, hours: -1)),
    );

  }

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "email": this.email,
        "phone_number": this.phone_number,
        "first_name": this.first_name,
        "last_name": this.last_name,
        "gender": this.gender,
        "fcm_token": this.fcm_token,
        "avatar": this.avatar,
        "access_token": this.access_token,
        "refresh_token": this.refresh_token,
        "is_staff": is_staff == true ? 1 : 0,
        "is_active": is_active == true ? 1 : 0,
        "groups": groups.join(","),
        "token_expire": token_expire.toString()
      };

  Map<String, dynamic> toJsonPost() => {
        "email": this.email,
        "phone_number": this.phone_number,
        "first_name": this.first_name,
        "last_name": this.last_name,
        "gender": this.gender,
        "access_token": this.access_token,
        "refresh_token": this.refresh_token,
        "fcm_token": this.fcm_token,
        "is_staff": this.is_staff,
        "is_active": this.is_active,
        "groups": groups.map((e) => e).toList(),
  };
}
=======


class AppUser {
  int id;
  String email;
  String? phone_number;
  String first_name;
  String last_name;
  String gender;
  String? fcm_token;
  String refresh_token;
  String access_token;
  bool is_staff;
  bool is_active;
  DateTime token_expire;
  // String department;
  List<String> groups;
  String? avatar;

  AppUser({
    required this.id,
    required this.email,
    this.phone_number,
    required this.first_name,
    required this.last_name,
    required this.gender,
    this.fcm_token,
    required this.access_token,
    required this.refresh_token,
    required this.token_expire,
    required this.is_staff,
    required this.is_active,
    // this.department,
    required this.groups,
    this.avatar,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
        id: json["id"] as int,
        email: json["email"],
        phone_number: json["phone_number"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        gender: json["gender"],
        fcm_token: json["fcm_token"],
        access_token: json["access_token"] ?? '',
        refresh_token: json["refresh_token"] ?? "",
        is_staff: json["is_staff"] ?? false,
        is_active: json["actif"] ?? true,
        avatar: json["avatar"],
        // department: json["department"],
        // groups: json["groups"] != null && json["groups"]?.cast<String>().,
      groups: ((json["groups"] as List)
            .map((obj) =>
                obj["name"] as String
              )
            .toList() ??
            []),
      token_expire: DateTime.now().add(Duration(days: 30, hours: -1)),
    );

  }

  factory AppUser.fromLocalJson(Map<String, dynamic> json) {
    return AppUser(
        id: json["id"],
        email: json["email"],
        phone_number: json["phone_number"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        gender: json["gender"],
        fcm_token: json["fcm_token"],
        access_token: json["access_token"],
        refresh_token: json["refresh_token"],
        avatar: json["avatar"],
        is_staff: json["is_staff"] == 0 ? false : true,
        is_active: json["is_active"] == 0 ? false : true,
        // department: json["department"],
        groups: json["groups"] != null ?
        (json["groups"].toString().split(",") )
         : [],
        token_expire: DateTime.now().add(Duration(days: 30, hours: -1)),
    );

  }

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "email": this.email,
        "phone_number": this.phone_number,
        "first_name": this.first_name,
        "last_name": this.last_name,
        "gender": this.gender,
        "fcm_token": this.fcm_token,
        "avatar": this.avatar,
        "access_token": this.access_token,
        "refresh_token": this.refresh_token,
        "is_staff": is_staff == true ? 1 : 0,
        "is_active": is_active == true ? 1 : 0,
        "groups": groups.join(","),
        "token_expire": token_expire.toString()
      };

  Map<String, dynamic> toJsonPost() => {
        "email": this.email,
        "phone_number": this.phone_number,
        "first_name": this.first_name,
        "last_name": this.last_name,
        "gender": this.gender,
        "access_token": this.access_token,
        "refresh_token": this.refresh_token,
        "fcm_token": this.fcm_token,
        "is_staff": this.is_staff,
        "is_active": this.is_active,
        "groups": groups.map((e) => e).toList(),
  };
}
>>>>>>> main
