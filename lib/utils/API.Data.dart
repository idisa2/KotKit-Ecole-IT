import 'package:prefs/prefs.dart';

class V2APIData {
  static const BASE_URL = "http:// 192.168.1.38:3000";

  static const LOGIN = "$BASE_URL/auth/login/";
  static const CHANGE_PASS = "$BASE_URL/users/change-password/";
  static const REGISTER = "$BASE_URL/auth/registration/";
  static const USER_DETAILS = "$BASE_URL/users/me";
  static const ALL_USERS = "$BASE_URL/users/all";
  static const VIDEOS = "$BASE_URL/api/kitkot/videos";

  //Don't touch ;d;?2021
  static Map<String, String> headers(token) {
    return {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  static Map<String, String> headersWithoutToken() =>
      {"Content-type": "application/json"};
}



// class APIData {
//   // static const base_url = "https://alodo.online/api";
//   // static const SOCKET_SERVER = 'http://157.245.87.70:3001';
//   static const SOCKET_SERVER = 'http://157.245.87.70:3000';
//   // static const base_url = "http://192.168.1.40:3000";
//   static const base_url = "http://192.168.1.19:3000";
//   static const auth_url = "$base_url/auth/";
//   static const user_url = "$base_url/users/";
//   static const roles = "$base_url/roles/";
//   static const cases_url = "$base_url/cases";
//   static const colleges_url = "$base_url/colleges/";
//   static const questions_url = "$base_url/questions/";
//   static const responses_url = "$base_url/responses/";
//   static const interview_types_url = "$base_url/interview-types/";
//   static const interviews_url = "$base_url/interviews";
//   static const appointments_url = "$base_url/appointements";
//   static const file_upload_url = "$base_url/files";
//   static const file_download_url = "$base_url/FileDownloadController";
//   static const channel_url = "$base_url/room";
//   static const message_url = "$base_url/messages";
//   static const chat_room = "$base_url/room";

//   //Don't touch
//   static Map<String, String> headers(token) {
//     return {
//       "Content-type": "application/json",
//       "Authorization": "Bearer $token"
//     };
//   }

//   static Map<String, String> headersWithoutToken() =>
//       {"Content-type": "application/json"};
// }
