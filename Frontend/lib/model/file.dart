import 'dart:typed_data';

class LocalFile {
  final String url;
  final String name;
  final Uint8List fileData;

  const LocalFile(
      {required this.url, required this.name, required this.fileData});
}
