import "package:mason/mason.dart";
import 'package:template_utils/file_utils.dart';
import "package:template_utils/template_utils.dart";

Future<void> run(HookContext context) async {
  final rootDir = projectRootDir(context.vars["root_folder_path"]);
  var pageName = (context.vars["page_name"] as String? ?? "").trim().pascalCase;
  final featureName =
      (context.vars["feature_name"] as String? ?? "").trim().snakeCase;
  var subdirectory = (context.vars["subdirectory"] as String? ?? "").trim();

  if (pageName.isEmpty) {
    throw "Cannot use empty name for page_name";
  }
  if (featureName.isEmpty) {
    throw "Cannot use empty name for feature_name";
  }

  final stem = pageName.replaceAll(RegExp(r"Page$"), "");
  final featurePath = "features/${featureName}/${subdirectory}" //
      .replaceAll(RegExp("/+"), "/")
      .replaceAll(RegExp("/\$"), "");
  pageName = "${stem}Page";

  final presenterName = "${stem}Presenter";
  final presentationModelName = "${stem}PresentationModel";
  final initialParamsName = "${stem}InitialParams";
  final viewModelName = "${stem}ViewModel";
  final routeName = "${stem}Route";

  final pageFileName = "${stem.snakeCase}_page.dart";
  final presenterFileName = "${stem.snakeCase}_presenter.dart";
  final presentationModelFileName = "${stem.snakeCase}_presentation_model.dart";
  final initialParamsFileName = "${stem.snakeCase}_initial_params.dart";
  final relativeRoot = relativeRootDir(rootDir);
  final relativeLibFeaturePath = "$relativeRoot/lib/${featurePath}";

  context.vars = {
    ...context.vars,
    ...context.vars,
    "app_package": await getAppPackage(rootDir),
    "import_path": "${featurePath}",
    "stem": stem,
    //class names
    "page_name": pageName,
    "presenter_name": presenterName,
    "presentation_model_name": presentationModelName,
    "initial_params_name": initialParamsName,
    "view_model_name": viewModelName,
    "route_name": routeName,
    //file names
    "page_file_name": pageFileName,
    "presenter_file_name": presenterFileName,
    "initial_params_file_name": initialParamsFileName,
    "presentation_model_file_name": presentationModelFileName,
    // absolute paths
    "page_absolute_path": "$relativeLibFeaturePath/$pageFileName",
    "presenter_absolute_path": "$relativeLibFeaturePath/$presenterFileName",
    "presentation_model_absolute_path":
        "$relativeLibFeaturePath/$presentationModelFileName",
    "initial_params_absolute_path":
        "$relativeLibFeaturePath/$initialParamsFileName",
    "feature": featureName,
    "root_dir": rootDir,
  };
  context.logger.info(
      "Generating page, variables: ${context.vars.entries.map((it) => "${it.key} -> ${it.value}").join("\n")}");
}
