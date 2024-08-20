String? formatDoubleString(String? value) {
  if(value == null){
    return null;
  }
  double number = double.parse(value);

  List<String> parts = number.toStringAsFixed(4).split('.');
  String integerPart = parts[0];
  String fractionalPart = parts.length > 1 ? parts[1].substring(0,2) : '';

  String formattedIntegerPart = _formatWithCommas(integerPart);

  return '$formattedIntegerPart.$fractionalPart';
}

String _formatWithCommas(String integerPart) {
  List<String> characters = integerPart.split('');
  int length = characters.length;

  for (int i = length - 3; i > 0; i -= 2) {
    characters.insert(i, ',');
  }

  return characters.join('');
}


 bool isGreaterThanZero(String value) {
      double? doubleValue = double.tryParse(value);

      if (doubleValue != null && doubleValue > 0) {
        return true;
      } else {
        return false;
      }
    
  }