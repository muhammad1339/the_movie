import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/core/widgets/customs/zero_height_appbar.dart';
import 'package:the_movie/features/discover_movie/presentation/cubit/discover_movie_cubit.dart';

class DiscoverMoviePage extends StatelessWidget {
  const DiscoverMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverMovieCubit(),
      child: BlocConsumer<DiscoverMovieCubit, DiscoverMovieState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: ZeroHeightAppBar(),
            body: Column(
              children: [],
            ),
          );
        },
      ),
    );
  }
}
