class DividedByZeroException implements Exception{ 
    @override
    String toString() => 'Você deve informar um valor maior que zero para a altura';
}

class InvalidHeightException implements Exception{ 
    @override
    String toString() => 'Altura inválida, você deve informar a altura em metros!';
}

class InvalidWeightException implements Exception{ 
    @override
    String toString() => 'Peso inválido, você deve informar um peso maior que zero!';
}