import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yippy_lingo_demo/features/some_feature/some_feature_presentation_model.dart';
import 'package:yippy_lingo_demo/router/app_navigator.dart';


class SomeFeaturePresenter extends Cubit<SomeFeatureViewModel> {

  SomeFeaturePresenter(
    super.model,
    this.navigator,
  );

  final AppNavigator navigator;

  // ignore: unused_element
  SomeFeaturePresentationModel get _model => state as SomeFeaturePresentationModel;

}
