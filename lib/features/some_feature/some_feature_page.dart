import 'package:flutter/material.dart';
import 'package:yippy_lingo_demo/core/utils/mvp_extensions.dart';
import 'package:yippy_lingo_demo/features/some_feature/some_feature_presentation_model.dart';
import 'package:yippy_lingo_demo/features/some_feature/some_feature_presenter.dart';

class SomeFeaturePage extends StatefulWidget
    with HasPresenter<SomeFeaturePresenter> {
  const SomeFeaturePage({
    super.key,
    required this.presenter,
  });

  @override
  final SomeFeaturePresenter presenter;

  @override
  State<SomeFeaturePage> createState() => _SomeFeaturePageState();
}

class _SomeFeaturePageState extends State<SomeFeaturePage>
    with
        PresenterStateMixin<SomeFeatureViewModel, SomeFeaturePresenter,
            SomeFeaturePage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text("SomeFeaturePage\n(NOT IMPLEMENTED YET)"),
        ),
      );
}
