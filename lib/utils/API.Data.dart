import 'package:prefs/prefs.dart';
class V2APIData {
  // static const SOCKET_SERVER = 'http://157.245.87.70:3000';
  // static const BASE_URL = "http://192.168.1.40:8000";
  // static const BASE_URL = "http://192.168.1.19:3000";
  // static const BASE_URL = "http://192.168.43.219:3000";
  // static const BASE_URL = "http://154.66.132.109";
  // static const BASE_URL = "http://192.168.0.121:8000";
  // static const BASE_URL = "http://154.66.132.109";
  // static const BASE_URL = "http://192.168.0.121:8000";
  // static const BASE_URL = "http://192.168.1.142:8000";

  static const BASE_URL = "http://81.91.231.22";
  // static const BASE_URL = "http://192.168.96.37:8000";
  // static const BASE_URL = "http://127.0.0.1:8000";

  static const SIGNALEMENTS =       "$BASE_URL/api/cases/signalements";
  static const CREATE_SIGNALEMENT = "$BASE_URL/api/cases/signalements";
  static const SIGNALEMENTS_RDV_ENTRETIENS = "$BASE_URL/api/cases/signalementcs";
  static const UPDATE_SIGNALEMENT = "$BASE_URL/api/cases/signalements";
  static const LOGIN = "$BASE_URL/auth/login/";
  static const CHANGE_PASS = "$BASE_URL/users/change-password/";
  static const REGISTER = "$BASE_URL/auth/registration";
  static const USER_DETAILS = "$BASE_URL/users/me";
  static const ALL_USERS = "$BASE_URL/users/all";
  static const ENTRETIENS = "$BASE_URL/api/cases/entretiens";
  static const CREATE_ENTRETIENS = "$BASE_URL/api/cases/entretiens";
  static const RDVS = "$BASE_URL/api/cases/rdvs";
  static const CREATE_RDVS = "$BASE_URL/api/cases/rdvs";
  static const UPDATE_RDVS = "$BASE_URL/api/cases/rdvs";
  static const GET_STATS = "$BASE_URL/api/cases/stats";
  static const NEW_FCM = "$BASE_URL/devices/";


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



class APIData {
  // static const base_url = "https://alodo.online/api";
  // static const SOCKET_SERVER = 'http://157.245.87.70:3001';
  static const SOCKET_SERVER = 'http://157.245.87.70:3000';
  // static const base_url = "http://192.168.1.40:3000";
  static const base_url = "http://192.168.1.19:3000";
  static const auth_url = "$base_url/auth/";
  static const user_url = "$base_url/users/";
  static const roles = "$base_url/roles/";
  static const cases_url = "$base_url/cases";
  static const colleges_url = "$base_url/colleges/";
  static const questions_url = "$base_url/questions/";
  static const responses_url = "$base_url/responses/";
  static const interview_types_url = "$base_url/interview-types/";
  static const interviews_url = "$base_url/interviews";
  static const appointments_url = "$base_url/appointements";
  static const file_upload_url = "$base_url/files";
  static const file_download_url = "$base_url/FileDownloadController";
  static const channel_url = "$base_url/room";
  static const message_url = "$base_url/messages";
  static const chat_room = "$base_url/room";

  //Don't touch
  static Map<String, String> headers(token) {
    return {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  static Map<String, String> headersWithoutToken() =>
      {"Content-type": "application/json"};
}
