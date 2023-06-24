/// A failure with the title and message that could be easly displayed as a dialog or snackbar
class DisplayableFailure {
  DisplayableFailure({
    required this.title,
    required this.message,
  });

  DisplayableFailure.commonError([String? message])
      : title = 'Error',
        message = message ?? 'Something went wrong. Please try again later.';

  String title;
  String message;
}

abstract class HasDisplayableFailure {
  DisplayableFailure displayableFailure();
}
