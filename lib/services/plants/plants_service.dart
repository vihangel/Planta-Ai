import 'package:dio/dio.dart';

import 'package:planta_ai/data/models/plants/page_plants_model.dart';

import 'package:planta_ai/shared/constants.dart';
import 'package:retrofit/http.dart';

part 'plants_service.g.dart';

@RestApi(baseUrl: Constants.URL_PEXEL_SERVICE)
abstract class PlantsServices {
  factory PlantsServices(Dio dio, {String baseUrl}) = _PlantsServices;
//PlantsModel
  @GET('query={query}&per_page={page}')
  Future<PagesPlantsModel> getPlants(@Header("Authorization") String apiKey,
      @Path() String query, @Path() int page);
}
