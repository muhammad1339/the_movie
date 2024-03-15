import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie/features/discover_movie/domain/entities/discover_movies_entity.dart';
import 'package:the_movie/features/discover_movie/domain/repository/discover_movie_repository.dart';
import 'package:the_movie/features/discover_movie/domain/usecases/discover_movies_usecase.dart';

class MockMovieRepository extends Mock implements DiscoverMovieRepository {}

void main() {
  late DiscoverMoviesUsecase discoverMoviesUsecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    discoverMoviesUsecase = DiscoverMoviesUsecase(mockMovieRepository);
  });

  const discoverMoviesEntity = DiscoverMoviesEntity(
    page: 1,
    results: [
      ResultEntity(
        adult: false,
        backdropPath: '/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg',
        genreIds: [28, 12, 14],
        id: 566525,
        originalLanguage: 'en',
        originalTitle: 'Shang-Chi and the Legend of the Ten Rings',
        overview:
            'Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization.',
        popularity: 3283.0,
        posterPath: '/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg',
        releaseDate: '2021-09-01',
        title: 'Shang-Chi and the Legend of the Ten Rings',
        video: false,
        voteAverage: 7.8,
        voteCount: 1285,
      ),
    ],
    totalPages: 1,
    totalResults: 1,
  );
  int firstPage = 1;

  test('should get a list of movies to discover', () async {
    // arrange
    when(
      () => mockMovieRepository.discoverMovies(page: firstPage),
    ).thenAnswer(
      (realInvocation) async {
        return const Right(discoverMoviesEntity);
      },
    );
    // act
    final result = await discoverMoviesUsecase.call(page: firstPage);
    // assert
    expect(result, const Right(discoverMoviesEntity));
  });
}
