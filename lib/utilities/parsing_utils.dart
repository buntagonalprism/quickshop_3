List<T>? listOrNull<T>(dynamic value) {
  if (value == null) {
    return null;
  }
  return (value as List<dynamic>).cast<T>();
}

DateTime? dateTimeOrNull(dynamic value) {
  if (value == null) {
    return null;
  }
  return DateTime.fromMillisecondsSinceEpoch(value as int);
}
