String maskString(String input, int numCharsToMask) {
  if (input.length <= numCharsToMask) {
    return '*' * input.length;
  }

  String maskedPart = '';
  int count = 0;

  for (int i = 0; i < input.length; i++) {
    if (input[i] == ' ' || input[i] == '/') {
      maskedPart += input[i];
    } else if (count < numCharsToMask) {
      maskedPart += '*';
      count++;
    } else {
      maskedPart += input[i];
    }
  }

  return maskedPart;
}

String addSpacesEveryFourChars(String input) {
  StringBuffer buffer = StringBuffer();
  for (int i = 0; i < input.length; i++) {
    if (i > 0 && i % 4 == 0) {
      buffer.write(' ');
    }
    buffer.write(input[i]);
  }
  return buffer.toString();
}
