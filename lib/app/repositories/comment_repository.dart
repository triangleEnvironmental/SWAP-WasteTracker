import 'dart:io';

import 'package:flutter/material.dart';
import 'package:waste_tracker/app/repositories/repository.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/constants/index.dart';

class CommentRepository extends Repository {
  Future<bool?> deleteComment(int commentId) async {
    try {
      final response = await delete(
        deleteCommentEndPoint.replaceAll('{id}', '$commentId'),
      );

      if (response.hasError) {
        throw response;
      }

      return true;
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Comment?> createComment({
    required int reportId,
    required String text,
    required List<File> images,
    ValueNotifier<double>? indicator,
  }) async {
    try {
      var json = await postWithFiles(
        createCommentEndPoint,
        body: {
          'report_id': reportId,
          'text': text,
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

      return deserialize<Comment>(json['data']);
    } catch (e) {
      return handleError(e);
    }
  }
}
