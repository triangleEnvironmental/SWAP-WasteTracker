import 'package:waste_tracker/app/models/index.dart';

List<T> deserializeList<T>(Map<String, dynamic> response) {
  return List.from(response['data'].map((x) => deserialize<T>(x)));
}

T deserialize<T>(Map<String, dynamic> data) {
  switch (T) {
    case Auth:
      return Auth.fromJson(data) as T;
    case User:
      return User.fromJson(data) as T;
    case LoginInfo:
      return LoginInfo.fromJson(data) as T;
    case Point:
      return Point.fromJson(data) as T;
    case Institution:
      return Institution.fromJson(data) as T;
    case Area:
      return Area.fromJson(data) as T;
    case CitizenAreaInfo:
      return CitizenAreaInfo.fromJson(data) as T;
    case Sector:
      return Sector.fromJson(data) as T;
    case ReportType:
      return ReportType.fromJson(data) as T;
    case HomePageData:
      return HomePageData.fromJson(data) as T;
    case Faq:
      return Faq.fromJson(data) as T;
    case Report:
      return Report.fromJson(data) as T;
    case ReportStatus:
      return ReportStatus.fromJson(data) as T;
    case Nameable:
      return Nameable.fromJson(data) as T;
    case Media:
      return Media.fromJson(data) as T;
    case ModerationHistory:
      return ModerationHistory.fromJson(data) as T;
    case ReportFilterOption:
      return ReportFilterOption.fromJson(data) as T;
    case Cluster:
      return Cluster.fromJson(data) as T;
    case ReportMarker:
      return ReportMarker.fromJson(data) as T;
    case Comment:
      return Comment.fromJson(data) as T;
    case FaqCategory:
      return FaqCategory.fromJson(data) as T;
    case Notification:
      return Notification.fromJson(data) as T;
    case MasterNotification:
      return MasterNotification.fromJson(data) as T;
    case HtmlPage:
      return HtmlPage.fromJson(data) as T;
    default:
      throw 'Unsupported type: add type $T to switch case at lib/utils/helpers.dart:deserialize';
  }
}
