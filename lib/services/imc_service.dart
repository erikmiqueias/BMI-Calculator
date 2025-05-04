double calculateBmi(weight, height) {
  return weight / (height * height);
}

String resultInfo(double bmi, int age) {
  final Map<double, String> bmiCategories = {
    18.5: 'Abaixo do peso',
    24.9: 'Peso normal',
    29.9: 'Sobrepeso',
    34.9: 'Obesidade grau 1',
    39.9: 'Obesidade grau 2',
    double.infinity: 'Obesidade grau 3',
  };

  for (final entry in bmiCategories.entries) {
    if (bmi <= entry.key) {
      return entry.value;
    }
  }

  return 'Valor inválido';
}
