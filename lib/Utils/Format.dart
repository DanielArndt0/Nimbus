mixin Format {
  String formatBytes(int bytes, [int decimals = 2]) {
    if (bytes < 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    int i = 0;
    double size = bytes.toDouble();

    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }

    return "${size.toStringAsFixed(decimals)} ${suffixes[i]}";
  }

  String formatDate(DateTime date) {
    const monthAbbr = [
      "jan",
      "fev",
      "mar",
      "abr",
      "mai",
      "jun",
      "jul",
      "ago",
      "set",
      "out",
      "nov",
      "dez",
    ];

    String month = monthAbbr[date.month - 1];
    return "$month ${date.day}.${date.year}";
  }
}
