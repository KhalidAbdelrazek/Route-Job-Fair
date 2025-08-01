import 'package:flutter/material.dart';
import 'package:route_task/core/common/custom_image.dart';
import 'package:route_task/features/domain/entity/get_photo_resonse_entity.dart';


class ExploreItem extends StatelessWidget {
  const ExploreItem({super.key, required this.data, this.onTap, this.radius = 10});

  final PhotoEntity data;
  final double radius;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 150,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Stack(
          children: [
            CustomImage(
              // data.photos?.isNotEmpty == true ? data.photos![0] : '',
              data.src?.large ?? '',
              isNetwork: true,
              radius: radius,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(.5),
                    Colors.white.withOpacity(.01),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 10,
              right: 10, // Add this for responsive wrapping
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  data.photographer ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}