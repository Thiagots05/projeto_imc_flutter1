import 'dart:developer';

import 'package:projeto_imc_flutter1/core/errors/erros.dart';



class Pessoa {
  final String? nome;
  final double? peso;
  final double? altura;

  Pessoa({this.nome = '', this.peso = 0, this.altura = 0});


  factory Pessoa.fromJson(Map<String, dynamic> map){
    return Pessoa(
      nome: map['nome'],
      altura: map['altura'],
      peso: map['peso']
      );
  }

  Map<String, dynamic> toJson(){
    return {
      'nome':nome,
      'altura':altura,
      'peso':peso
    };
  }



  void validaEntrada() {
    if (nome == null || nome!.trim().isEmpty) {
      throw InvalidNameException();
    }
    if (altura == null || altura! <= 0 || altura! > 3) {
      throw InvalidHeightException();
    }
    if (peso == null || peso == 0) {
      throw InvalidWeightException();
    }
  }

  double calculaImc() {
    var imc = 0.0;
    try {
      validaEntrada();

      imc = peso! / (altura! * altura!);
      if (imc.isInfinite) throw DividedByZeroException();
    } on DividedByZeroException catch (e) {
      print(e.toString());
    } on InvalidHeightException catch (e) {
      print(e.toString());
    } on InvalidWeightException catch (e) {
      print(e.toString());
    } on InvalidNameException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
    return imc;
  }

  String getClassification(double imc) {
    var classification = '';
    if (imc > 40) {
      classification = 'Obesidade Grau III (mórbida)';
    } else if (imc > 35) {
      classification = 'Obesidade Grau II (severa)';
    } else if (imc > 30) {
      classification = 'Obesidade Grau I';
    } else if (imc > 25) {
      classification = 'Sobreepeso';
    } else if (imc > 18.5) {
      classification = 'Saudável';
    } else if (imc > 16) {
      classification = 'Magreza moderada';
    } else {
      classification = 'Magreza grave';
    }

    return classification;
  }
}
