import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie/features/discover_movie/data/data_source/discover_movie_data_source.dart';
import 'package:the_movie/features/discover_movie/data/model/discover_movies_model.dart';
import 'package:the_movie/features/discover_movie/data/repository/discover_movie_repository_impl.dart';
import 'package:the_movie/features/discover_movie/domain/entities/discover_movies_entity.dart';
import 'package:the_movie/network/api/api.dart';

class DiscoverMovieDataSourceMock extends Mock implements DiscoverMovieDataSource {}

void main() {
  late DiscoverMovieDataSourceMock movieDataSourceMock;
  late DiscoverMovieRepositoryImpl discoverMovieRepositoryImpl;

  setUp(() {
    movieDataSourceMock = DiscoverMovieDataSourceMock();
    discoverMovieRepositoryImpl = DiscoverMovieRepositoryImpl(dataSource: movieDataSourceMock);
  });

  const discoverMovieModel = DiscoverMoviesModel(
    page: 1,
    results: [
      MovieItemModel(
        adult: false,
        backdropPath: '/path',
        genreIds: [1, 2],
        id: 1,
        originalLanguage: 'en',
        originalTitle: 'title',
        overview: 'overview',
        popularity: 1.0,
        posterPath: '/path',
        releaseDate: '2021-01-01',
        title: 'title',
        video: false,
        voteAverage: 1.0,
        voteCount: 1,
      ),
    ],
    totalPages: 1,
    totalResults: 1,
  );

  const discoverMovieEntity = DiscoverMoviesEntity(
    page: 1,
    results: [
      MovieItemEntity(
        adult: false,
        backdropPath: '/path',
        genreIds: [1, 2],
        id: 1,
        originalLanguage: 'en',
        originalTitle: 'title',
        overview: 'overview',
        popularity: 1.0,
        posterPath: '/path',
        releaseDate: '2021-01-01',
        title: 'title',
        video: false,
        voteAverage: 1.0,
        voteCount: 1,
      ),
    ],
    totalPages: 1,
    totalResults: 1,
  );
  group('discover movie repository', () {
    test('should return DiscoverMoviesModel when result is OK', () async {
      // arrange
      when(() => movieDataSourceMock.discoverMovies(page: 1)).thenAnswer((invocation) async {
        return discoverMovieModel;
      });
      // act
      final result = await discoverMovieRepositoryImpl.discoverMovies(page: 1);
      // assert
      expect(result, equals(const Right(discoverMovieEntity)));
    });

    test('should throw an exception when result is not OK', () async {
      // arrange
      when(() => movieDataSourceMock.discoverMovies(page: 1)).thenThrow(
        DioException(
          requestOptions: RequestOptions(
            path: ServiceConst.discoverMovie(page: 1),
          ),
          response: Response(
            requestOptions: RequestOptions(
              path: ServiceConst.discoverMovie(page: 1),
            ),
            statusCode: 404,
            statusMessage: 'Not Found',
          ),
        ),
      );
      // act
      final result = await discoverMovieRepositoryImpl.discoverMovies(page: 1);
      // assert
      const expected = Left(
        HttpError(message: 'Not Found', code: 404),
      );
      expect(result, equals(expected));
    });
  });
}
