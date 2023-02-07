import 'package:waste_tracker/app/repositories/repository.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/constants/index.dart';

class FaqRepository extends Repository {
  Future<Pagination> listPage({
    int page = 1,
    required int sectorId,
  }) async {
    return await getPagination(
      faqListEndPoint,
      body: {
        'page': page,
        'sector_id': sectorId,
      },
    );
  }

  Future<Faq> detail(int id) async {
    return await getData<Faq>(
      faqDetailEndPoint.replaceAll('{id}', '$id'),
      body: {},
    );
  }
}