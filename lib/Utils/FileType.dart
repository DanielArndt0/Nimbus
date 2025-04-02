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
}
