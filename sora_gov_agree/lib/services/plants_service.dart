import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:sora_gov_agree/constants/app_constants.dart';
import 'dart:convert';

import 'package:sora_gov_agree/models/crop.dart';
import 'package:sora_gov_agree/services/dio_service.dart';
import 'package:sora_gov_agree/services/service_locator.dart';

class PlantsService {
  Future<List<Crop>> getData() async {
    final keyword = "crop";
    var response;

    final url = "${AppConstants.BASE_URL}${AppConstants.PLANTS_JSON_URL}";

    var dio = locator<DioService>().getDio();

    try {
      response = await dio
          .get(
            "$url",
            queryParameters: {'k': keyword},
            options: buildCacheOptions(
              Duration(days: AppConstants.CACHE_DURATION),
              forceRefresh: true,
            ),
          )
          .timeout(
            Duration(seconds: 5),
          );
    } catch (e) {
      print(e);
      throw Exception(
          'PlantsService.getData:  Error requesting Plants data: $e');
    }

    if (response.statusCode == 200) {
      try {
        return (json.decode(response.body) as List)
            .map((data) => Crop.fromJson(data))
            .toList();
      } catch (e) {
        print(e);
        throw Exception("PlantsService.getData: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "PlantsService.getData: statusCode ${response.statusCode}");
    }
  }
}
