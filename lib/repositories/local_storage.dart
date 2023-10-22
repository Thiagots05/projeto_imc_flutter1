


import 'dart:convert';

import 'package:projeto_imc_flutter1/models/dados_pessoa.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalStorage{

Future<bool> salvarDadosPessoa(Pessoa pessoa) async {
  bool dadoSalvo = false;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  dadoSalvo = await prefs.setString('pessoa', json.encode(pessoa.toJson()) );
  return dadoSalvo;
}

Future<Pessoa?> obterDadosPessoa() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var result = prefs.getString('pessoa');
  if(result!=null){
    return Pessoa.fromJson(json.decode(result));
  }
  return null;

}
}