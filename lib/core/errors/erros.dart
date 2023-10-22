class DividedByZeroException implements Exception {
  @override
  String toString() =>
      'Você deve informar um valor maior que zero para a altura';
}

class InvalidHeightException implements Exception {
  @override
  String toString() =>
      'Altura inválida, você deve informar a altura maior que zero e em metros!';
}

class InvalidWeightException implements Exception {
  @override
  String toString() =>
      'Peso inválido, você deve informar um peso maior que zero!';
}

class InvalidNameException implements Exception {
  @override
  String toString() => 'Nome inválido, você precisa passar um nome!';
}

//Teste
