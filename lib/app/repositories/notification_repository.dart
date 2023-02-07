import 'package:waste_tracker/app/repositories/repository.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/constants/index.dart';

class NotificationRepository extends Repository {
  Future<bool?> saveToken({
    required String token,
  }) async {
    try {
      final response = await post(
        saveTokenEndPoint,
        {
          'fcm_token': token,
          'device_id': await getDeviceId(),
        },
      );

      if (response.hasError) {
        throw response;
      }

      return true;
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Notification> detail(int id) async {
    return await getData<Notification>(
      detailEndPoint.replaceAll('{id}', '$id'),
      body: {},
    );
  }

  Future<Pagination> list({
    int page = 1,
  }) async {
    return await getPagination(
      listEndPoint,
      body: {
        'page': page,
      },
    );
  }

  Future<Notification?> read(int id) async {
    try {
      return await putData<Notification>(
        readEndPoint.replaceAll('{id}', '$id'),
        body: {},
      );
    } catch (e) {
      print(e);
      // return handleError(e);
    }
  }

  Future<bool?> deleteNotification(int id) async {
    try {
      final response = await delete(
        deleteEndPoint.replaceAll('{id}', '$id'),
      );

      if (response.hasError) {
        throw response;
      }

      return true;
    } catch (e) {
      return handleError(e);
    }
  }

  Future<int?> countUnread() async {
    try {
      final response = await get(
        countUnreadEndPoint,
      );
      return response.body['data'];
    } catch (e) {
      print(e);
    }
  }

  Future<bool?> markAsReadAll() async {
    try {
      final response = await put(
        markAsReadAllEndPoint,
        {},
      );

      if (response.hasError) {
        throw response;
      }

      return true;
    } catch (e) {
      return handleError(e);
    }
  }
}