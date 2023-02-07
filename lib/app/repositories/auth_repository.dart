import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/repositories/repository.dart';
import 'package:waste_tracker/app/constants/index.dart';

class AuthRepository extends Repository {
  Future<LoginInfo?> firebaseLogin(String idToken) async {
    try {
      return await postData<LoginInfo>(
        firebaseLoginEndPoint,
        body: {
          'firebase_id_token': idToken,
          'device_id': await getDeviceId(),
        },
      );
    } catch (e) {
      return handleError(e);
    }
  }

  Future<LoginInfo?> firebaseDemoLogin(String phone, String otp) async {
    try {
      return await postData<LoginInfo>(
        firebaseDemoLoginEndPoint,
        body: {
          'phone': phone,
          'otp': otp,
          'device_id': await getDeviceId(),
        },
      );
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Auth?> register({
    required String firstName,
    required String lastName,
    required String idToken,
  }) async {
    try {
      return await postData<Auth>(
        registerEndPoint,
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'firebase_id_token': idToken,
          'device_id': await getDeviceId(),
        },
      );
    } catch (e) {
      return handleError(e);
    }
  }

  Future logout() async {
    try {
      return await post(
        logoutEndPoint,
        {},
      );
    } catch (_) {}
    return null;
  }

  Future<User?> profile() async {
    try {
      return await getData<User>(
        userInfoEndPoint,
        body: {},
      );
    } catch (e) {
      return handleError(e);
    }
  }

  Future<User?> updateAddress({
    required LatLng location,
    required String address,
  }) async {
    try {
      return await postData<User>(
        updateAddressEndPoint,
        body: {
          'latitude': location.latitude,
          'longitude': location.longitude,
          'address': address,
        },
      );
    } catch (e) {
      return handleError(e);
    }
  }

  Future<User?> updateName({
    required String firstName,
    required String lastName,
  }) async {
    try {
      return await postData<User>(
        updateProfileEndPoint,
        body: {
          'first_name': firstName,
          'last_name': lastName,
        },
      );
    } catch (e) {
      return handleError(e);
    }
  }

  Future<User?> updateProfilePhoto(File? profilePhoto) async {
    try {
      final response = await postWithFiles(
        updateProfilePhotoEndPoint,
        files: {
          'profile': profilePhoto,
        },
        compressImage: true,
      );

      return User.fromJson(response['data']);
    } catch (e) {
      return handleError(e);
    }
  }
}
