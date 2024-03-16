import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:the_movie/app_injection.dart';
import 'package:the_movie/core/res/assets.dart';
import 'package:the_movie/core/res/colors.dart';
import 'package:the_movie/core/widgets/customs/loading_widget.dart';
import 'package:the_movie/core/widgets/placeholders/empty_placehoder.dart';
import 'package:the_movie/features/discover_movie/presentation/cubit/discover_movie_cubit.dart';
import 'package:the_movie/utils/utils.dart';

import '../../domain/entities/discover_movies_entity.dart';
import '../components/movie_item_widget.dart';

class DiscoverMoviePage extends StatelessWidget {
  const DiscoverMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<DiscoverMovieCubit>()..discoverMoviesPaged(),
      child: BlocConsumer<DiscoverMovieCubit, DiscoverMovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<DiscoverMovieCubit>();
          return Scaffold(
            appBar: AppBar(
              elevation: 1,
              backgroundColor: KAppColors.primaryColor,
              title: Text(
                'Discover Movie',
                style: KAppTextStyle.regularTextStyle.copyWith(
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
            ),
            body: state is DiscoverMovieLoading
                ? const Center(child: LoadingWidget())
                : PagedListView.separated(
                    pagingController: cubit.pageController,
                    physics: const BouncingScrollPhysics(),
                    padding: MediaQuery.of(context).padding.copyWith(
                          top: 16,
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                    separatorBuilder: (context, index) => 12.verticalSpace,
                    builderDelegate: PagedChildBuilderDelegate<MovieItemEntity>(
                      animateTransitions: true,
                      newPageProgressIndicatorBuilder: (_) => const Center(
                        child: LoadingWidget(),
                      ),
                      noItemsFoundIndicatorBuilder: (_) => const EmptyPlaceHolder(
                        message: 'No Movies Found',
                      ),
                      newPageErrorIndicatorBuilder: (_) => EmptyPlaceHolder(
                        message: 'Error Loading Movies',
                        asset: KAppSvgs.error,
                        showRetryButton: true,
                        onRetry: () {
                          cubit.pageController.retryLastFailedRequest();
                        },
                      ),
                      firstPageErrorIndicatorBuilder: (_) => EmptyPlaceHolder(
                        asset: KAppSvgs.error,
                        message: 'Error Loading Movies',
                        showRetryButton: true,
                        onRetry: () {
                          cubit.pageController.refresh();
                        },
                      ),
                      itemBuilder: (context, item, index) {
                        return MovieItemWidget(
                          movieItemEntity: item,
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
