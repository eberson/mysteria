extension IntExtensions on int {
  String toClockPart() {
    return remainder(60).toString().padLeft(2, "0");
  }

  String toDigitCount(int digit) {
    return toString().padLeft(digit, "0");
  }
}
