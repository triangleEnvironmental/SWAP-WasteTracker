import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_tracker/app/globals/index.dart';
import 'package:waste_tracker/app/repositories/repository.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/constants/index.dart';

class ReportRepository extends Repository {
  Future<Report?> createReport({
    required LocationWithAddress location,
    required List<File> images,
    required String description,
    ReportType? reportType,
    bool isAnonymous = true,
    ValueNotifier<double>? indicator,
  }) async {
    try {
      var json = await postWithFiles(
        createReportEndPoint,
        body: {
          'description': description,
          'latitude': location.latitude,
          'longitude': location.longitude,
          'report_type_id': reportType?.id,
          'is_anonymous': isAnonymous,
        },
        files: {
          'images': images,
        },
        compressImage: true,
        uploadProgress: (progress) {
          if (indicator != null) {
            indicator.value = progress / 100.0;
          }
        },
      );

      return deserialize<Report>(json['data']);
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Pagination> listReport({
    int page = 1,
    required ReportFilter filter,
  }) async {
    try {
      final filterRequestBody = filter.requestBody;
      print(filterRequestBody);
      return await getPagination(
        listReportEndPoint,
        body: {
          'page': page,
          ...filterRequestBody,
        },
      );
    } catch (e) {
      throw getErrorMessage(e);
    }
  }

  Future<ReportFilterOption?> getFilterOptions() async {
    try {
      return await getData<ReportFilterOption>(
        getFilterOptionsEndPoint,
        body: {},
      );
    } catch (e) {
      print('[SILENT ERROR]');
      print(getErrorMessage(e));
      // return handleError(e);
    }
    return null;
  }

  Future<List<ReportMarker>?> mapQuery({
    required LatLngBounds bounds,
    required double zoom,
    required ReportFilter filter,
  }) async {
    try {
      return await getList<ReportMarker>(
        mapQueryEndPoint,
        body: {
          'minLng': bounds.southwest.longitude,
          'minLat': bounds.southwest.latitude,
          'maxLat': bounds.northeast.latitude,
          'maxLng': bounds.northeast.longitude,
          'zoom': zoom.round(),
          ...filter.requestBody,
        },
      );
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Report> detail(int id) async {
    return await getData<Report>(
      reportDetailEndPoint.replaceAll('{id}', '$id'),
      body: {},
    );
  }

  Future<Pagination> listComments({
    required int reportId,
    int page = 1,
  }) async {
    return await getPagination(
      listCommentsEndPoint.replaceAll('{id}', '$reportId'),
      body: {
        'page': page,
      },
    );
  }

  Future<Pagination> reportHistoryList({
    int page = 1,
    required ReportFilter filter,
  }) async {
    try {
      return await getPagination(
        reportHistoryListEndPoint,
        body: {
          'page': page,
          ...filter.requestBody,
        },
      );
    } catch (e) {
      throw getErrorMessage(e);
    }
  }
}