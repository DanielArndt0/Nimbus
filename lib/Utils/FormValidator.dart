mixin FormValidator {
  String? isNotEmpty(String? string, {String? message}) {
    final str = string?.trim();
    return str == null || str.isEmpty ? (message ?? 'Required field') : null;
  }

  String? combine(List<String? Function()> validators) {
    for (final validator in validators) {
      final validation = validator();
      if (validation != null) return validation;
    }
    return null;
  }
}
