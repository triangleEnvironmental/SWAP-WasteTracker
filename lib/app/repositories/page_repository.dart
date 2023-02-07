import 'package:waste_tracker/app/globals/location_picked_result.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/repositories/repository.dart';
import 'package:waste_tracker/app/constants/index.dart';

class PageRepository extends Repository {
  Future<HomePageData?> getHomePageData(LocationWithAddress location) async {
    // try {
    return await getData<HomePageData>(
      getHomePageDataEndPoint,
      body: {
        'latitude': "${location.latitude}",
        'longitude': "${location.longitude}",
      },
    );
    // } catch (e) {
    //   return handleError(e);
    // }
  }

  Future<HtmlPage> aboutPage() async {
    return await getData<HtmlPage>(
      aboutPageEndPoint,
      body: {},
    );
  }

  Future<HtmlPage> termsPage() async {
    return await getData<HtmlPage>(
      termsPageEndPoint,
      body: {},
    );
  }

  Future<HtmlPage> policyPage() async {
    return await getData<HtmlPage>(
      policyPageEndPoint,
      body: {},
    );
  }
}