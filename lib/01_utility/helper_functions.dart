String noTrailingZeroes(dynamic number) {
  final regex = RegExp(r'([.]*0+)(?!.*\d)');

  return number.toString().replaceAll(regex, '');
}

int getFixValue(double value) {
  if (value > 10) {
    return 2;
  } else if (value > 0.1) {
    return 4;
  } else if (value > 0.0001) {
    return 6;
  }

  return  8;
}