import 'package:template_utils/file_utils.dart';

String templateImport(String package, {String as = '', bool relative = false}) {
  var pkg = relative //
      ? package.replaceFirst(RegExp(r"^package:"), "")
      : package.prefixed("package:");
  var asDirective = as.isEmpty ? '' : ' as $as';
  return "import '${pkg}'${asDirective};";
}

RegExp getItFactoryRegex(String name) {
  ///whole 'registerFactory' method
  final group1 = "(\\.+\\s*registerFactory\\w*<$name.*?)";

  ///ending comment '//DO-NOT-REMOVE.*$' or '..' from next registration
  const group2 = "(\\/\\/\\s*DO.*?\$|\\.\\..*?\$)";

  ///minimal group of chars that are followed by `//DO-NOT-REMOVE.*$` comment
  const group3 = "(.*(?=\\/\\/\\s*DO-NOT-REMOVE.*?\$))?";

  ///OPTIONAL ending `//DO-NOT-REMOVE.*$` comment
  const group4 = "(\\/\\/\\s*DO-NOT-REMOVE.*?\$)*";

  ///OPTIONAL minimal group of rest of the chars, just to make sure previous group is matched
  const group5 = "(.*?)";
  return RegExp(
    "$group1$group2$group3$group4$group5\$",
    dotAll: true,
    multiLine: true,
  );
}
