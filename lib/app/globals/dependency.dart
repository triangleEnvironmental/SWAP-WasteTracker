import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:timeago/timeago.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/modules/settings/controllers/settings_controller.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:path_provider/path_provider.dart';


class AppDependency {
  initLocationService(LocationService locationService) async {
    var locationService = Get.find<LocationService>();
    locationService.requestingLocation.value = true;
    await locationService.updateUserLocation(checkTimeout: false);
    locationService.requestingLocation.value = false;
  }

  inject() async {
    // https://letsencrypt.org/certs/lets-encrypt-r3.pem
    ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.cer');
    SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
    final url = Platform.isIOS ? await getLibraryDirectory() : await getApplicationDocumentsDirectory();
    Hive
      ..init(url.path)
      ..registerAdapter(AuthAdapter())
      ..registerAdapter(UserAdapter())
      ..registerAdapter(PointAdapter())
      ..registerAdapter(InstitutionAdapter())
      ..registerAdapter(AreaAdapter())
      ..registerAdapter(CitizenAreaInfoAdapter())
      ..registerAdapter(SectorAdapter())
      ..registerAdapter(ReportTypeAdapter())
      ..registerAdapter(HomePageDataAdapter())
      ..registerAdapter(FaqAdapter())
      ..registerAdapter(ReportAdapter())
      ..registerAdapter(ReportStatusAdapter())
      ..registerAdapter(NameableAdapter())
      ..registerAdapter(MediaAdapter())
      ..registerAdapter(ModerationHistoryAdapter())
      ..registerAdapter(ReportFilterOptionAdapter())
      ..registerAdapter(ClusterAdapter())
      ..registerAdapter(ReportMarkerAdapter())
      ..registerAdapter(CommentAdapter())
      ..registerAdapter(FaqCategoryAdapter())
      ..registerAdapter(NotificationAdapter())
      ..registerAdapter(MasterNotificationAdapter())
      ..registerAdapter(HtmlPageAdapter());

    final authService = AuthService();
    final locationService = LocationService();

    await Future.wait([
      Get.putAsync(() => SettingsService().init()),
      Get.putAsync(() => authService.init()),
      Get.putAsync(() => locationService.init()),
    ]);
    Get.put(InformationService()).init();

    Get.put(SettingsController());

    // if (Platform.isIOS) {
    //   await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform,
    //   );
    // } else {
    //   await Firebase.initializeApp(
    //     name: 'waste_tracker', // Don't use space or iOS will crash
    //     options: DefaultFirebaseOptions.currentPlatform,
    //   );
    // }
    // // await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 5554);
    // await initializeFCM();

    setLocaleMessages('km', KmMessages());
    authService.updateUser();
    initLocationService(locationService);
  }
}