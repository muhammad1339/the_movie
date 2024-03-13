import 'package:the_movie/network/api/api.dart';

import 'api_client.dart';

class ApiService {
  ApiService._();

  static final instance = ApiService._();

  final _apiClient = ApiClient.instance.getApiClient();

  // https://api.themoviedb.org/3/discover/movie?api_key=799a7636fa97467d0ec35f8c6d4c4666&page=1
  Future<dynamic> discoverMovie({
    required page,
  }) async {
    final response = await _apiClient.get('/discover/movie?api_key=${ServiceConst.apiKey}&page=$page');
    return response;
  }
}
