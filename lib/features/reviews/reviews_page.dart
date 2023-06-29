import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:yippy_lingo_demo/core/utils/mvp_extensions.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_presentation_model.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_presenter.dart';
import 'package:yippy_lingo_demo/features/widgets/rounded_button.dart';
import 'package:yippy_lingo_demo/features/widgets/rounded_container.dart';
import 'package:yippy_lingo_demo/features/widgets/yippy_header.dart';
import 'package:yippy_lingo_demo/theme/app_theme.dart';

class ReviewsPage extends StatefulWidget with HasPresenter<ReviewsPresenter> {
  const ReviewsPage({
    super.key,
    required this.presenter,
  });

  @override
  final ReviewsPresenter presenter;

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage>
    with PresenterStateMixin<ReviewsViewModel, ReviewsPresenter, ReviewsPage> {
  final PageController pageController = PageController(
    viewportFraction: 0.8, // Adjust this value to control the item size
    initialPage: 0, // Set a large initial page to create the infinite effect
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    final fonts = theme.fonts;
    final colors = theme.colors;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        const YippyHeader(
          title: 'Pourquoi Yoopala ?',
          subtitle: 'Nous vous réservons nos',
          highlight: 'meilleurs profils.',
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
            child: RoundedButton(
              title: 'Trouver une nounou',
              onTap: () {},
            )),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
            height: 394,
            child: RoundedContainer(
                color: Colors.grey[200],
                child: Container(
                    margin: const EdgeInsets.all(32),
                    child: PageView.builder(
                      itemCount: 5,
                      controller: pageController,
                      itemBuilder: (BuildContext context, int index) {
                        // First item
                        return Container(
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  'https://api.time.com/wp-content/uploads/2014/03/happy-family.jpg',
                                  height: 229,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Juliette, 23 ans',
                                          style: fonts.h3
                                              .copyWith(color: colors.black),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          'Facilisis pulvinar egestas pulvinar aenean sed morbi.',
                                          style: fonts.p2
                                              .copyWith(color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ))
                              ],
                            ));
                      },
                      scrollDirection: Axis.horizontal,
                    ))))

      ]),
    )));
  }
}
