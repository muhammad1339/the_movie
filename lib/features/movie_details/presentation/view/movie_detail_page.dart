import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_movie/core/extension/context_extensions.dart';
import 'package:the_movie/core/res/colors.dart';
import 'package:the_movie/features/discover_movie/domain/entities/discover_movies_entity.dart';
import 'package:the_movie/features/discover_movie/presentation/components/movie_item_widget.dart';
import 'package:the_movie/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:the_movie/utils/utils.dart';

import '../../../../app_injection.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = context.getArgs() as MovieItemEntity?;
    logger.d('args: $args');
    return BlocProvider(
      create: (context) => locator<MovieDetailsCubit>(),
      child: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 1,
              backgroundColor: KAppColors.primaryColor,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                (args?.title ?? ''),
                style: KAppTextStyle.regularTextStyle.copyWith(
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(
                start: 16.w,
                end: 16.w,
                top: 32.h,
                bottom: 64.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieItemWidget(
                    movieItemEntity: args ?? const MovieItemEntity(),
                    aspectRatio: 0.8,
                  ),
                  16.verticalSpace,
                  const LabelWidget(text: 'overview : '),
                  8.verticalSpace,
                  InfoWidget(
                    text: args?.overview ?? '',
                  ),
                  16.verticalSpace,
                  Row(
                    children: [
                      const LabelWidget(text: 'releaseDate : '),
                      InfoWidget(
                        text: args?.releaseDate ?? '',
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Row(
                    children: [
                      const LabelWidget(text: 'popularity : '),
                      InfoWidget(
                        text: args?.popularity?.toString() ?? '',
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Row(
                    children: [
                      const LabelWidget(text: 'Language : '),
                      InfoWidget(
                        text: args?.originalLanguage ?? '',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: KAppTextStyle.boldTextStyle.copyWith(
        fontSize: 16.sp,
        color: Colors.black,
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: KAppTextStyle.regularTextStyle.copyWith(
        fontSize: 16.sp,
        color: Colors.black,
      ),
    );
  }
}
