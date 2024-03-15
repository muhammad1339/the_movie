import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie/features/discover_movie/data/model/discover_movies_model.dart';

import '../../../../utils/json_utils.dart';

void main() {
  DiscoverMoviesModel discoverMoviesModel = DiscoverMoviesModel(
    page: 1,
    results: [
      ResultModel(
        posterPath: '/kCGlIMHnOm8JPXq3rXM6c5wMxcT.jpg',
        adult: false,
        overview:
            'Brought back to life by an unorthodox scientist, a young woman runs off with a debauched lawyer on a whirlwind adventure across the continents. Free from the prejudices of her times, she grows steadfast in her purpose to stand for equality and liberation.',
        releaseDate: '2023-12-07',
        genreIds: const [878, 10749, 35],
        id: 792307,
        originalTitle: 'Poor Things',
        originalLanguage: 'en',
        title: 'Poor Things',
        backdropPath: '/bQS43HSLZzMjZkcHJz4fGc7fNdz.jpg',
        popularity: 1968.226,
        voteCount: 2174,
        video: false,
        voteAverage: 7.9,
      ),
    ],
    totalResults: 100,
    totalPages: 10,
  );

  test('DiscoverMoviesModel should be a subclass of DiscoverMoviesEntity', () {
    // assert
    expect(discoverMoviesModel, isA<DiscoverMoviesModel>());
  });

  test('DiscoverMoviesModel should return a valid model', () {
    // arrange - read json file
    String json = JsonUtils.readJsonFile('discover_movie_response');

    // act - convert json to model
    final result = DiscoverMoviesModel.fromJson(jsonDecode(json));

    // assert
    expect(result, equals(discoverMoviesModel));
  });

  test('DiscoverMoviesModel should return a json map containing the proper data', () {
    // arrange
    final Map<String, dynamic> result = discoverMoviesModel.toJson();

    // assert
    final expectedMap = {
      "page": 1,
      "results": [
        {
          "adult": false,
          "backdrop_path": "/bQS43HSLZzMjZkcHJz4fGc7fNdz.jpg",
          "genre_ids": [878, 10749, 35],
          "id": 792307,
          "original_language": "en",
          "original_title": "Poor Things",
          "overview":
              "Brought back to life by an unorthodox scientist, a young woman runs off with a debauched lawyer on a whirlwind adventure across the continents. Free from the prejudices of her times, she grows steadfast in her purpose to stand for equality and liberation.",
          "release_date": "2023-12-07",
          "poster_path": "/kCGlIMHnOm8JPXq3rXM6c5wMxcT.jpg",
          "popularity": 1968.226,
          "title": "Poor Things",
          "video": false,
          "vote_average": 7.9,
          "vote_count": 2174
        }
      ],
      "total_pages": 10,
      "total_results": 100
    };
    expect(result, equals(expectedMap));
  });
}
