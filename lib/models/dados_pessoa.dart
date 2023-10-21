import 'dart:developer';

import 'package:projeto_imc_flutter1/core/errors/erros.dart';


class Pessoa{
  final String nome;
  final double peso;
  final double altura;

  Pessoa(this.nome, this.peso, this.altura);

  void validaAltura(){      
      if (altura > 3) {
        print('teste');
         throw InvalidHeightException();
      }
    }

    void validaPeso(){      
      if (peso == 0) {
         throw InvalidWeightException();
      }
    }

  double calculaImc(){
    var imc = 0.0;
    try {
        validaPeso();
        validaAltura();

        imc =  peso/(altura*altura);
        if(imc.isInfinite)throw DividedByZeroException();
    } on DividedByZeroException catch (e){
      log(e.toString());
    } on InvalidHeightException catch (e){
      log(e.toString());
    } on InvalidWeightException catch (e){
      log(e.toString());
    }catch (e) {
      log(e.toString());
    }
    return imc;
  }

  String getClassification(double imc){
    var classification = '';
    if(imc>40){
      classification = 'Obesidade Grau III (mórbida)';
    }else if(imc>35){
      classification = 'Obesidade Grau II (severa)';
    }else if(imc>30){
      classification = 'Obesidade Grau I';
    }else if(imc>25){
      classification = 'Sobreepeso';
    }else if(imc>18.5){
      classification = 'Saudável';
    }else if(imc>16){
      classification = 'Magreza moderada';
    }else{
      classification = 'Magreza grave';
    }

    return classification;
  }

}