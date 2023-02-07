
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/globals/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/repositories/index.dart';

import 'index.dart';

class AuthService extends GetxService {
  User? _user;
  Auth? _auth;
  String? idToken;
  late Box authBox;

  ValueListenable<Box> get listenable {
    return authBox.listenable();
  }

  Future<AuthService> init() async {
    authBox = await Hive.openBox(AppStrings.authBox);
    _user = authBox.get('user', defaultValue: null);
    _auth = authBox.get('auth', defaultValue: null);
    return this;
  }

  updateUser() async {
    if (isLoggedIn) {
      final authRepository = AuthRepository();
      var data = await authRepository.profile();
      if (data != null) {
        setUser(data);
      }
    }
  }

  User? get user => _user;

  Auth? get auth => _auth;

  bool get isLoggedIn {
    return _auth != null;
  }

  setUser(User user) async {
    _user = user;
    await authBox.put('user', user);
  }

  setAuth(Auth auth) async {
    _auth = auth;
    await authBox.put('auth', auth);
    await setUser(auth.user);
    try {
      final informationService = Get.find<InformationService>();
      informationService.afterLogin();
    } catch (e) {
      print("Information service after login");
      print(e);
    }
    updateFcmTokenOnDatabase();
  }

  clear() async {
    _user = null;
    _auth = null;
    await authBox.delete('user');
    await authBox.delete('auth');
  }
}