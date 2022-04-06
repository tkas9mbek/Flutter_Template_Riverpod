String noTrailingZeroes(dynamic number) {
  final regex = RegExp(r'([.]*0+)(?!.*\d)');
  final value = number.toString();

  return value.contains('.')
      ? value.replaceAll(regex, '')
      : value;
}