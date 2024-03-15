import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:the_movie/features/discover_movie/data/data_source/discover_movie_data_source.dart';
import 'package:the_movie/features/discover_movie/data/model/discover_movies_model.dart';
import 'package:the_movie/network/api/service/api_client.dart';
import 'package:the_movie/network/api/utils/service_const.dart';

import '../../../../utils/json_utils.dart';

void main() {
  final dio = ApiClient.instance.getApiClient();

  final dioAdapter = DioAdapter(
    dio: dio,
  );

  late DiscoverMovieDataSourceImpl discoverMovieDataSourceImpl;
  setUp(() {
    dio.httpClientAdapter = dioAdapter;
    discoverMovieDataSourceImpl = DiscoverMovieDataSourceImpl(apiClient: dio);
  });

  group('discover movies api test', () {
    test('should return DiscoverMoviesModel when result is OK', () async {
      // arrange
      dioAdapter.onGet(
        ServiceConst.discoverMovie(page: 1),
        (server) => server.reply(200, jsonDecode(JsonUtils.readJsonFile('discover_movie_response'))),
      );
      // act
      final result = await discoverMovieDataSourceImpl.discoverMovies(page: 1);
      // assert
      expect(result, isA<DiscoverMoviesModel>());
    });

    test('should throw an exception when result is not OK', () async {
      // arrange
      dioAdapter.onGet(
        ServiceConst.discoverMovie(page: 1),
        (server) => server.throws(
          404,
          DioException(
            requestOptions: RequestOptions(path: ServiceConst.discoverMovie(page: 1)),
          ),
        ),
      );
      // act  
      // assert
      expect(discoverMovieDataSourceImpl.discoverMovies(page: 1), throwsA(isA<DioException>()));
    });
  });
}
