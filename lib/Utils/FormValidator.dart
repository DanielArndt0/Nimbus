mixin FormValidator {
  String? isNotEmpty(String? string, {String? message}) {
    final str = string?.trim();
    return str == null || str.isEmpty ? (message ?? 'Required field') : null;
  }

  String? equalsTo(String? string, String? string2, {String? message}) {
    final str = string?.trim();
    final str2 = string2?.trim();
    return str != str2
        ? (message ?? 'Folder name does not match.')
        : null;
  }

  String? combine(List<String?> validators) {
    for (final validator in validators) {
      if (validator != null) return validator;
    }
    return null;
  }
}
