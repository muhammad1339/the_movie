import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
      final result = await discoverMoviesUsecase(page: currentPage);
      result.fold(
        (l) {
          pageController.error = l;
          emit(DiscoverMovieError(l));
        },
        (r) {
          bool isLastPage = currentPage >= (r.totalPages ?? 0);
          if (isLastPage) {
            pageController.appendLastPage(r.results ?? []);
          } else {
            final nextPageKey = (r.page ?? currentPage) + 1;
            currentPage = nextPageKey;
            pageController.appendPage(r.results ?? [], nextPageKey);
          }
          emit(DiscoverMovieSuccess(discoverMoviesEntity: r));
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
