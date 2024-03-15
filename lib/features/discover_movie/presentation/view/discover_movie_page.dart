import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_movie/app_injection.dart';
import 'package:the_movie/core/res/colors.dart';
import 'package:the_movie/features/discover_movie/presentation/cubit/discover_movie_cubit.dart';
import 'package:the_movie/utils/utils.dart';


class DiscoverMoviePage extends StatelessWidget {
  const DiscoverMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<DiscoverMovieCubit>()..discoverMovies(),
      child: BlocConsumer<DiscoverMovieCubit, DiscoverMovieState>(
        listener: (context, state) {},
        builder: (context, state) {
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
            body: const Column(
              children: [],
            ),
          );
        },
      ),
    );
  }
}
