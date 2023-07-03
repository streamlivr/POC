import 'dart:math';

String generateRandomCharacters() {
  final random = Random();
  const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  String randomCharacters = '';

  for (var i = 0; i < 8; i++) {
    final index = random.nextInt(characters.length);
    randomCharacters += characters[index];
  }

  return randomCharacters;
}

String generateRandomnumber() {
  final random = Random();
  const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  String randomCharacters = '';

  for (var i = 0; i < 11; i++) {
    final index = random.nextInt(characters.length);
    randomCharacters += characters[index];
  }

  return randomCharacters;
}
