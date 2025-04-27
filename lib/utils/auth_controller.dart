import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:logger/logger.dart';
import 'package:m360ict_flutter_task/presentations/widgets/toast.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:m360ict_flutter_task/core/route/app_route.dart';

class AuthController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ///------SharedPreferences keys------///
  static const String EMAIL_KEY = 'user_email';
  static const String PASSWORD_KEY = 'user_password';
  static const String IS_LOGGED_IN = 'is_logged_in';
  static const String USER_ID = 'user_id';
  static const String USER_NAME = 'user_name';

  ///------Check if user is already logged in------///
  Future<bool> isUserLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(IS_LOGGED_IN) ?? false;
    } catch (e) {
      return false;
    }
  }

  ///------Register a new user------///
  Future<bool> registerUser({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final bool userExists = await checkIfUserExists(email);
      if (userExists) {
        return false;
      }

      final String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

      DocumentReference docRef = await _firestore.collection('users').add({
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': hashedPassword,
        'createdAt': FieldValue.serverTimestamp(),
      });

      Logger().i('User registered with ID: ${docRef.id}');

      return true;
    } catch (e) {
      return false;
    }
  }

  ///------Login user------///
  Future<bool> loginUser({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    try {
      final QuerySnapshot result = await _firestore.collection('users').where('email', isEqualTo: email).limit(1).get();

      if (result.docs.isEmpty) {
        return false;
      }

      final DocumentSnapshot user = result.docs.first;
      final userData = user.data() as Map<String, dynamic>;
      final String storedHash = userData['password'];

      if (BCrypt.checkpw(password, storedHash)) {
        if (rememberMe) {
          await saveUserCredentials(
            email: email,
            password: password,
            userId: user.id,
            userName: userData['name'],
          );
        } else {
          await clearSavedCredentials();
        }

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  ///------Check if user exists by email------///
  Future<bool> checkIfUserExists(String email) async {
    try {
      final QuerySnapshot result = await _firestore.collection('users').where('email', isEqualTo: email).limit(1).get();

      return result.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  ///------Save user credentials to SharedPreferences------///
  Future<void> saveUserCredentials({
    required String email,
    required String password,
    required String userId,
    required String userName,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(EMAIL_KEY, email);
      await prefs.setString(PASSWORD_KEY, password);
      await prefs.setString(USER_ID, userId);
      await prefs.setString(USER_NAME, userName);
      await prefs.setBool(IS_LOGGED_IN, true);
    } catch (e) {
      toastShow(text: "Error saving user credentials", color: AppColors.red);
    }
  }

  ///------Load saved credentials------///
  Future<Map<String, String>> loadSavedCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString(EMAIL_KEY) ?? '';
      final password = prefs.getString(PASSWORD_KEY) ?? '';
      final userId = prefs.getString(USER_ID) ?? '';
      final userName = prefs.getString(USER_NAME) ?? '';

      return {
        'email': email,
        'password': password,
        'userId': userId,
        'userName': userName,
      };
    } catch (e) {
      return {
        'email': '',
        'password': '',
        'userId': '',
        'userName': '',
      };
    }
  }

  ///------Clear saved credentials------///
  Future<void> clearSavedCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(EMAIL_KEY);
      await prefs.remove(PASSWORD_KEY);
      await prefs.remove(USER_ID);
      await prefs.remove(USER_NAME);
      await prefs.remove(IS_LOGGED_IN);
    } catch (e) {
      toastShow(text: "Error clearing saved credentials", color: AppColors.red);
    }
  }

  ///------Logout user------///
  Future<void> logout() async {
    try {
      await clearSavedCredentials();
      Get.offAllNamed(AppRoute.loginScreen);
    } catch (e) {
      toastShow(text: "Error logging out", color: AppColors.red);
    }
  }
}
