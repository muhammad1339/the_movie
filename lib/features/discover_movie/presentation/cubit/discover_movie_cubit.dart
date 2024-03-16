import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:the_movie/core/constants/k_app_const.dart';
import 'package:the_movie/features/discover_movie/domain/usecases/discover_movies_usecase.dart';
import 'package:the_movie/network/api/utils/error_model.dart';

import '../../../../utils/logger.dart';
import '../../domain/entities/discover_movies_entity.dart';

part 'discover_movie_state.dart';

int firstPage = 1;

class DiscoverMovieCubit extends Cubit<DiscoverMovieState> {
  DiscoverMovieCubit({
    required this.discoverMoviesUsecase,
  }) : super(DiscoverMovieInitial());

  int currentPage = firstPage;
  final pageController = PagingController<int, MovieItemEntity>(firstPageKey: firstPage);
  final DiscoverMoviesUsecase discoverMoviesUsecase;

  /// Fetches and emits a list of discovered movies in a paged manner.
  ///
  /// This method triggers the loading state by emitting a [DiscoverMovieLoading] state.
  /// It then calls the private method [_discoverMovies] to fetch the initial set of movies.
  ///
  /// Additionally, it adds a page request listener to the [pageController] to fetch more movies when a new page is requested.
  /// The page key is logged using the [logger] before calling [_discoverMovies] again.
  ///
  /// If an error occurs during the process, it catches the exception and logs the error and stack trace using the [logger].
  /// It then emits a [DiscoverMovieError] state with an [HttpError] containing the error message and code.
  ///
  /// Throws:
  ///   - [Exception] if an error occurs during the process.
  ///
  /// Returns:
  ///   - [void].
  Future<void> discoverMoviesPaged() async {
    try {
      emit(DiscoverMovieLoading());

      await _discoverMovies();
      pageController.addPageRequestListener((pageKey) {
        logger.d('pageKey: $pageKey');
        _discoverMovies();
      });
    } catch (e, s) {
      logger.e(e.toString());
      logger.t(s.toString());
      emit(DiscoverMovieError(HttpError(message: e.toString(), code: 500)));
    }
  }

  Future<void> _discoverMovies() async {
    try {
      Box movieBox = await Hive.openBox<MovieItemEntity>(KAppConst.appHiveBox);

      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (!hasConnection) {
        if (movieBox.isOpen && movieBox.isNotEmpty) {
          pageController.appendLastPage([...movieBox.toMap().values]);
          emit(DiscoverMovieSuccess());
          return;
        } else {
          emit(DiscoverMovieError(const HttpError(message: 'No Internet Connection', code: 500)));
          return;
        }
      }

      final result = await discoverMoviesUsecase(page: currentPage);
      result.fold(
        (l) {
          pageController.error = l;
          emit(DiscoverMovieError(l));
        },
        (r) {
          bool isLastPage = currentPage >= (r.totalPages ?? 0);
          r.results?.forEach((element) {
            movieBox.put(element.id, element);
          });
          if (isLastPage) {
            pageController.appendLastPage(r.results ?? []);
          } else {
            final nextPageKey = (r.page ?? currentPage) + 1;
            currentPage = nextPageKey;
            pageController.appendPage(r.results ?? [], nextPageKey);
          }
          emit(DiscoverMovieSuccess());
        },
      );
    } catch (e, s) {
      logger.e(e.toString());
      logger.t(s.toString());
      pageController.error = e;
      emit(DiscoverMovieError(HttpError(message: e.toString(), code: 500)));
    }
  }
}
