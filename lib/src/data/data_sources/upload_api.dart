import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:lms_pptik/src/data/models/item_model.dart';

abstract class UploadApi {
  Future<List<ItemModel>> uploadFile(String token, List<File> files);
}

class UploadApiImpl implements UploadApi {
  final Client client;

  UploadApiImpl(this.client);

  @override
  Future<List<ItemModel>> uploadFile(String token, List<File> files) async {
    Uri url =
        Uri.parse('https://lms.pptik.id/webservice/upload.php?token=$token');
    final request = MultipartRequest('POST', url);
    for (File file in files) {
      final httpFile = MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: file.path.split('/').last,
      );
      request.files.add(httpFile);
    }
    final response = await request.send();

    // Get response data from Server
    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      log('Response Data: $responseData');
      final result = jsonDecode(responseData) as List;
      return result
          .map<ItemModel>(
            (e) => ItemModel.fromJson(e),
          )
          .toList();
    } else {
      throw Exception('Failed to upload file');
    }
  }
}
