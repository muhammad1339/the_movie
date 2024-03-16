import 'package:get_it/get_it.dart';
import 'package:the_movie/features/discover_movie/data/data_source/discover_movie_data_source.dart';
import 'package:the_movie/features/discover_movie/data/repository/discover_movie_repository_impl.dart';
import 'package:the_movie/features/discover_movie/domain/repository/discover_movie_repository.dart';
import 'package:the_movie/features/discover_movie/domain/usecases/discover_movies_usecase.dart';
import 'package:the_movie/features/discover_movie/presentation/cubit/discover_movie_cubit.dart';
import 'package:the_movie/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:the_movie/network/api/service/api_client.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => DiscoverMovieCubit(discoverMoviesUsecase: locator()));

  locator.registerLazySingleton(() => DiscoverMoviesUsecase(repository: locator()));

  locator.registerLazySingleton<DiscoverMovieRepository>(() => DiscoverMovieRepositoryImpl(dataSource: locator()));

  locator.registerLazySingleton<DiscoverMovieDataSource>(() => DiscoverMovieDataSourceImpl(apiClient: ApiClient.instance.getApiClient()));

  // locator.registerLazySingleton(() => ApiClient.instance.getApiClient());

  locator.registerFactory(() => MovieDetailsCubit());
}
