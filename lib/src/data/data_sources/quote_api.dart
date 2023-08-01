import 'dart:convert';

import 'package:lms_pptik/src/utils/exceptions.dart';
import 'package:lms_pptik/src/utils/helper/ssl_pinning/ssl_pinning.dart';

import '../models/quote_model.dart';
import '../models/tag_model.dart';

abstract class QuoteApi {
  Future<List<TagModel>> getTags();
  Future<QuoteModel> getQuoteByTag(String tag);
}

class QuoteApiImpl implements QuoteApi {
  final SslPinningHelper client = SslPinningHelper();

  QuoteApiImpl();

  @override
  Future<QuoteModel> getQuoteByTag(String tag) async {
    final url = Uri.https('https://api.quotable.io/', 'random', {'tags': tag});
    final response = await SslPinningHelper.client.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return QuoteModel.fromJson(result);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TagModel>> getTags() async {
    final response =
        await SslPinningHelper.client.get(Uri.https('api.quotable.io', 'tags'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return List<TagModel>.from(result.map((x) => TagModel.fromJson(x)));
    } else {
      throw ServerException();
    }
  }
}
