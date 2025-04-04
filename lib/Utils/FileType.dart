import 'package:flutter/material.dart';

class FileType {
  static final Map<String, IconData> fileTypeIconMap = {
    'application/pdf': Icons.picture_as_pdf,
    'application/msword': Icons.description,
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
        Icons.description,
    'application/vnd.ms-excel': Icons.grid_on,
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
        Icons.grid_on,
    'application/vnd.ms-powerpoint': Icons.slideshow,
    'application/vnd.openxmlformats-officedocument.presentationml.presentation':
        Icons.slideshow,
    'application/rtf': Icons.text_snippet,
    'application/vnd.oasis.opendocument.text': Icons.description,
    'application/vnd.oasis.opendocument.spreadsheet': Icons.grid_on,
    'application/epub+zip': Icons.menu_book,

    'text/plain': Icons.notes,
    'application/json': Icons.data_object,
    'application/xml': Icons.code,
    'application/x-yaml': Icons.code,
    'text/markdown': Icons.markunread,
    'application/x-httpd-php': Icons.code,
    'text/x-python': Icons.code,
    'text/x-java-source': Icons.code,
    'text/x-c': Icons.code,
    'text/x-c++': Icons.code,
    'application/typescript': Icons.code,
    'text/jsx': Icons.code,
    'text/tsx': Icons.code,
    'application/javascript': Icons.code,

    'image/jpeg': Icons.image,
    'image/png': Icons.image,
    'image/gif': Icons.image,
    'image/svg+xml': Icons.image,
    'image/webp': Icons.image,

    'audio/mpeg': Icons.audiotrack,
    'audio/wav': Icons.audiotrack,
    'audio/ogg': Icons.audiotrack,
    'audio/aac': Icons.audiotrack,
    'audio/midi': Icons.music_note,
    'audio/mp4': Icons.audiotrack,

    'video/mp4': Icons.videocam,
    'video/webm': Icons.videocam,
    'video/x-msvideo': Icons.videocam,
    'video/quicktime': Icons.videocam,
    'video/x-matroska': Icons.videocam,
    'video/x-flv': Icons.videocam,
    'video/3gpp': Icons.videocam,
    'video/x-m4v': Icons.videocam,

    'application/zip': Icons.archive,
    'application/x-7z-compressed': Icons.archive,
    'application/x-tar': Icons.archive,
    'application/vnd.rar': Icons.archive,
    'application/x-iso9660-image': Icons.disc_full,
    'application/x-apple-diskimage': Icons.disc_full,

    'font/ttf': Icons.font_download,
    'font/otf': Icons.font_download,
    'font/woff': Icons.font_download,
    'font/woff2': Icons.font_download,

    'application/x-pem-file': Icons.lock,
    'application/pkix-cert': Icons.verified,
    'application/x-pkcs12': Icons.security,
    'application/pkcs10': Icons.security,

    'application/octet-stream': Icons.memory,
    'application/x-msdownload': Icons.memory,
    'application/vnd.microsoft.portable-executable': Icons.memory,

    'text/csv': Icons.table_chart,
    'text/tab-separated-values': Icons.table_chart,
  };

  static final Map<String, MaterialColor> fileTypeColorMap = {
    'application/pdf': Colors.red,
    'application/msword': Colors.indigo,
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
        Colors.indigo,
    'application/vnd.ms-excel': Colors.green,
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
        Colors.green,
    'application/vnd.ms-powerpoint': Colors.orange,
    'application/vnd.openxmlformats-officedocument.presentationml.presentation':
        Colors.orange,
    'application/rtf': Colors.grey,
    'application/vnd.oasis.opendocument.text': Colors.indigo,
    'application/vnd.oasis.opendocument.spreadsheet': Colors.green,
    'application/epub+zip': Colors.deepPurple,

    'text/plain': Colors.grey,
    'application/json': Colors.teal,
    'application/xml': Colors.deepOrange,
    'application/x-yaml': Colors.brown,
    'text/markdown': Colors.blueGrey,
    'application/x-httpd-php': Colors.blue,
    'text/x-python': Colors.blue,
    'text/x-java-source': Colors.brown,
    'text/x-c': Colors.blue,
    'text/x-c++': Colors.blue,
    'application/typescript': Colors.blue,
    'text/jsx': Colors.blue,
    'text/tsx': Colors.blue,
    'application/javascript': Colors.yellow,

    'image/jpeg': Colors.purple,
    'image/png': Colors.purple,
    'image/gif': Colors.purple,
    'image/svg+xml': Colors.purple,
    'image/webp': Colors.purple,

    'audio/mpeg': Colors.pink,
    'audio/wav': Colors.pink,
    'audio/ogg': Colors.pink,
    'audio/aac': Colors.pink,
    'audio/midi': Colors.pink,
    'audio/mp4': Colors.pink,

    'video/mp4': Colors.blueGrey,
    'video/webm': Colors.blueGrey,
    'video/x-msvideo': Colors.blueGrey,
    'video/quicktime': Colors.blueGrey,
    'video/x-matroska': Colors.blueGrey,
    'video/x-flv': Colors.blueGrey,
    'video/3gpp': Colors.blueGrey,
    'video/x-m4v': Colors.blueGrey,

    'application/zip': Colors.brown,
    'application/x-7z-compressed': Colors.brown,
    'application/x-tar': Colors.brown,
    'application/vnd.rar': Colors.brown,
    'application/x-iso9660-image': Colors.brown,
    'application/x-apple-diskimage': Colors.brown,

    'font/ttf': Colors.deepPurple,
    'font/otf': Colors.deepPurple,
    'font/woff': Colors.deepPurple,
    'font/woff2': Colors.deepPurple,

    'application/x-pem-file': Colors.cyan,
    'application/pkix-cert': Colors.cyan,
    'application/x-pkcs12': Colors.cyan,
    'application/pkcs10': Colors.cyan,

    'application/octet-stream': Colors.grey,
    'application/x-msdownload': Colors.grey,
    'application/vnd.microsoft.portable-executable': Colors.grey,

    'text/csv': Colors.lime,
    'text/tab-separated-values': Colors.lime,
  };

  static IconData? fileIcon({required String? fileType}) {
    if (fileType == null) return null;

    if (fileTypeIconMap.containsKey(fileType)) {
      return fileTypeIconMap[fileType];
    }

    if (fileType.contains('image')) return Icons.image;
    if (fileType.contains('audio')) return Icons.audiotrack;
    if (fileType.contains('video')) return Icons.videocam;
    if (fileType.contains('text')) return Icons.notes;
    if (fileType.contains('pdf')) return Icons.picture_as_pdf;
    if (fileType.contains('zip') || fileType.contains('compressed'))
      return Icons.archive;
    if (fileType.contains('msword') || fileType.contains('document'))
      return Icons.description;

    return Icons.insert_drive_file;
  }

  static MaterialColor fileColor({required String? fileType}) {
    if (fileType == null) return Colors.grey;

    final MaterialColor? color = fileTypeColorMap[fileType];
    if (color != null) return color;

    if (fileType.contains('image')) return Colors.purple;
    if (fileType.contains('audio')) return Colors.pink;
    if (fileType.contains('video')) return Colors.blueGrey;
    if (fileType.contains('text')) return Colors.grey;
    if (fileType.contains('pdf')) return Colors.red;
    if (fileType.contains('zip') || fileType.contains('compressed'))
      return Colors.brown;
    if (fileType.contains('msword') || fileType.contains('document'))
      return Colors.indigo;

    return Colors.grey;
  }
}
