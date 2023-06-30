import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:yippy_lingo_demo/core/utils/mvp_extensions.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_presentation_model.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_presenter.dart';
import 'package:yippy_lingo_demo/features/reviews/ui/profile_card.dart';
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
  void initState() {
    super.initState();
    presenter.getReviews();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    final colors = theme.colors;
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: stateObserver(
                  builder: (context, state) => Column(children: [
                    const YippyHeader(
                      title: 'Pourquoi Yoopala ?',
                      subtitle: 'Nous vous réservons nos',
                      highlight: 'meilleurs profils.',
                    ),
                    const SizedBox(
                      height: 40,
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
                        height: 416,
                        child: RoundedContainer(
                            color: Colors.grey[200],
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 32),
                                child: PageView.builder(
                                  itemCount: state.reviews.length,
                                  controller: pageController,
                                  onPageChanged: presenter.onPageChanged,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final review = state.reviews[index];
                                    return ProfileCard(
                                      review: review,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                )))),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: PageViewDotIndicator(
                        currentItem: state.currentPage,
                        count: 5,
                        unselectedColor: Colors.grey[200]!,
                        selectedColor: colors.orange,
                        duration: const Duration(milliseconds: 200),
                        boxShape: BoxShape.circle,
                      ),
                    ),
                  ]),
                ))));
  }
}
