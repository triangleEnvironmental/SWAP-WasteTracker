import 'package:waste_tracker/app/globals/index.dart';
import 'package:waste_tracker/app/repositories/repository.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/constants/index.dart';

class SectorRepository extends Repository {
  Future<List<Sector>?> getAvailable(LocationWithAddress location) async {
    try {
      return await getList<Sector>(
        getAvailableEndPoint,
        body: {
          'latitude': "${location.latitude}",
          'longitude': "${location.longitude}",
        },
      );
    } catch (e) {
      print(e);
      // return handleError(e);
    }
  }
}