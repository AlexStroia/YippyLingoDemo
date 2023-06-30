import 'package:flutter/material.dart';
import 'package:yippy_lingo_demo/core/domain/model/review.dart';
import 'package:yippy_lingo_demo/features/reviews/ui/premium_badge.dart';
import 'package:yippy_lingo_demo/theme/app_theme.dart';

class ProfileCard extends StatelessWidget {
  final Review review;

  const ProfileCard({required this.review, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    final fonts = theme.fonts;
    final colors = theme.colors;
    return Container(
        margin: const EdgeInsets.only(right: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Image.network(
                          'https://st3.depositphotos.com/12982378/19353/i/1600/depositphotos_193534594-stock-photo-side-view-smiling-african-american.jpg',
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                color: colors.orange,
                              ),
                            );
                          },
                        ),
                      )),
                      const SizedBox(height: 16),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${review.name}, ${review.age} ans',
                              style: fonts.h3.copyWith(color: colors.black),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              review.description,
                              style: fonts.p2.copyWith(color: Colors.grey),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                          padding: EdgeInsets.all(8), child: PremiumBadge())),
                ],
              )),
        ));
  }
}
