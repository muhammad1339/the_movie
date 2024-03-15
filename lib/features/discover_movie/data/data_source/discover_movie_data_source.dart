import 'package:dio/dio.dart';
import 'package:the_movie/features/discover_movie/data/model/discover_movies_model.dart';
import 'package:the_movie/network/api/utils/service_const.dart';

import '../../../../utils/logger.dart';

abstract class DiscoverMovieDataSource {
  Future<DiscoverMoviesModel> discoverMovies({required int page});
}

class DiscoverMovieDataSourceImpl implements DiscoverMovieDataSource {
  final Dio apiClient;

  DiscoverMovieDataSourceImpl({required this.apiClient});

  @override
  Future<DiscoverMoviesModel> discoverMovies({required int page}) async {
    final Response response = await apiClient.get(ServiceConst.discoverMovie(page: page));

    if (response.statusCode == 200) {
      return DiscoverMoviesModel.fromJson(response.data);
    } else {
      throw DioException(
        requestOptions: RequestOptions(path: ServiceConst.discoverMovie(page: page)),
        response: response,
        message: response.statusMessage ?? 'Unknown error',
      );
    }
  }
}
