import 'dart:io';

import 'package:recase/recase.dart';
import 'package:template_utils/file_utils.dart';

Future<void> renameTpe({
  required String rootPath,
  required RenameParams renameParams,
}) async {
  File(renameParams.newFilePath).parent.createSync(recursive: true);
  File(renameParams.oldFilePath).renameSync(renameParams.newFilePath);
  final oldFeatureName = renameParams.oldFilePath.featureName;
  final newFeatureName = renameParams.newFilePath.featureName;
  final oldTypeName = renameParams.oldFilePath.classNameFromFile;
  final newTypeName = renameParams.newFilePath.classNameFromFile;
  final oldMocksFile =
      mocksFilePath(feature: oldFeatureName, rootDir: rootPath);
  final newMocksFile =
      mocksFilePath(feature: newFeatureName, rootDir: rootPath);
  final appPackage = await getAppPackage(rootPath);
  var oldVariableName = oldTypeName.camelCase;
  var newVariableName = newTypeName.camelCase;
  await for (final file in allProjectDartFiles(rootDir: rootPath)) {
    var hasMockMatch = false;
    await replaceAllInFileLineByLine(
      filePath: file.path,
      replacements: [
        //Class name
        StringReplacement(
          from: RegExp("([^a-zA-Z])${oldTypeName}"),
          to: (match) => "${match.group(1)}${newTypeName}",
          failIfNotFound: false,
        ),
        // remove old mocks registration
        if (oldFeatureName != newFeatureName) ...[
          StringReplacement(
            from: "${oldMocksFile.classNameFromFile}.$oldVariableName",
            to: (match) {
              hasMockMatch = true;
              return '${newMocksFile.classNameFromFile}.${newVariableName}';
            },
            failIfNotFound: false,
          ),
        ],
        // replace all variables
        StringReplacement(
          from: RegExp("([^a-zA-Z])${oldVariableName}"),
          to: (match) => "${match.group(1)}${newVariableName}",
          failIfNotFound: false,
        ),
        // replace all import paths
        StringReplacement.string(
          from: renameParams.oldFilePath
              .importPath(rootPath, appPackage: appPackage),
          to: renameParams.newFilePath
              .importPath(rootPath, appPackage: appPackage),
          failIfNotFound: false,
        ),
        ...renameParams.additionalReplacements,
      ],
    );
    if (oldFeatureName != newFeatureName && hasMockMatch) {
      // adds new mocks file import to the file only if the old mock was used in the file (i.e: `Mocks.authRepository`)
      await replaceAllInFileLineByLine(
        filePath: file.absolute.path,
        replacements: [
          StringReplacement(
            from: RegExp(
                'import .*\/${File(oldMocksFile).fileNameWithExtension}.*'),
            to: (match) => "${match[0]}\n${match[0]?.replaceAll(
              "/mocks/${File(oldMocksFile).fileNameWithExtension}",
              "/features/$newFeatureName/mocks/${File(newMocksFile).fileNameWithExtension}",
            )}",
            failIfNotFound: false,
          ),
        ],
      );
    }
  }
}

class RenameParams {
  final String oldFilePath;
  final String newFilePath;
  final String oldTypeName;
  final String newTypeName;
  final List<StringReplacement> additionalReplacements;

  RenameParams.fromFilePaths({
    required this.oldFilePath,
    required this.newFilePath,
    this.additionalReplacements = const [],
  })  : oldTypeName = oldFilePath.classNameFromFile,
        newTypeName = newFilePath.classNameFromFile;
}
