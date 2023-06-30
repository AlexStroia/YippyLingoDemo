import 'package:flutter/material.dart';
import 'package:yippy_lingo_demo/core/domain/model/displayable_failure.dart';
import 'package:yippy_lingo_demo/features/widgets/rounded_button.dart';
import 'package:yippy_lingo_demo/theme/app_theme.dart';

class ErrorWidget extends StatefulWidget {
  final VoidCallback onTapAction;

  const ErrorWidget({
    required this.notifier,
    required this.onTapAction,
    Key? key,
  }) : super(key: key);

  final ErrorNotifier notifier;
  static const modalHeight = 316.0;
  static const circleSize = 60.0;

  @override
  State<ErrorWidget> createState() => _ErrorWidgetState();
}

class _ErrorWidgetState extends State<ErrorWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    final colors = theme.colors;
    final fonts = theme.fonts;
    return SizedBox(
      height: ErrorWidget.modalHeight,
      child: AnimatedBuilder(
        animation: widget.notifier,
        builder: (BuildContext context, Widget? child) {
          final failure = widget.notifier.failure;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0XFFf2f2f2),
                    shape: BoxShape.circle,
                  ),
                  height: ErrorWidget.circleSize,
                  width: ErrorWidget.circleSize,
                  child: Center(
                      child: Icon(
                    Icons.error_outline_rounded,
                    color: colors.orange,
                    size: 48,
                  )),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  failure.title,
                  style: fonts.h1.copyWith(fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  failure.message,
                  style: fonts.p1.copyWith(fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundedButton(
                  title: 'OK',
                  onTap: widget.onTapAction,
                ),
              ),
              const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}

enum ErrorDialogShowMode {
  ignoreIfAlreadyVisible,
  overrideCurrent,
  showAfterCurrent,
}

class ErrorNotifier extends ChangeNotifier {
  late DisplayableFailure failure;

  void addFailure(DisplayableFailure failure) {
    this.failure = failure;
    notifyListeners();
  }
}
