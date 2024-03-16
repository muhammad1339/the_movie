
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_movie/core/widgets/customs/network_image_with_loading.dart';
import 'package:the_movie/network/api/utils/service_const.dart';

import '../../../../core/routing/k_routes.dart';
import '../../../../utils/app_text_styles.dart';
import '../../domain/entities/discover_movies_entity.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({
    super.key,
    required this.movieItemEntity,
  });
  final MovieItemEntity movieItemEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          KAppRoutes.movieDetail,
          arguments: movieItemEntity,
        );
      },
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: NetworkImageWithLoading(
              img: ServiceConst.imageUrl + (movieItemEntity.posterPath ?? ''),
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            end: 0,
            start: 0,
            child: Container(
            
              padding: EdgeInsets.all(16.w),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movieItemEntity.title ?? '',
                          style: KAppTextStyle.boldTextStyle.copyWith(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  8.verticalSpace,
                  Text(
                    'rating : ${(movieItemEntity.voteAverage ?? 0)}',
                    style: KAppTextStyle.regularTextStyle.copyWith(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
