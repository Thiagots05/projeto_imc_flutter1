import 'package:flutter/material.dart';
import 'package:projeto_imc_flutter1/models/dados_pessoa.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  var nomeController = TextEditingController();
  var alturaController = TextEditingController();
  var pesoController = TextEditingController();
  late Pessoa pessoa;
  var imc = 0.0;
  var resultado = '';
  var listaDeResultados = [];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.history, color: Colors.blueAccent,),
                  onPressed: (){
                    print(listaDeResultados);
                    showModalBottomSheet(
                      context: context,
                      builder: (context){
                        return Container(
                          height: 200,
                          child: ListView.builder(
                            itemCount: listaDeResultados.length,
                            itemBuilder: (context, index){
                             
                              listaDeResultados.isNotEmpty?
                                listaDeResultados.map((e) {
                            return 
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                dense: true,
                                title: Text(e.nome, 
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),) ,
                                subtitle: Text('IMC: ${e.calculaImc().toStringAsFixed(2)}'),
                              ),
                            );
                          }).toList(): const Text('Não há registros!');
                            }),
                        );
                      });
                }),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      hintText: 'Nome', 
                      prefixIcon: Icon(Icons.person)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    
                    controller: pesoController,
                    decoration: const InputDecoration(
                      hintText: 'Peso', 
                      prefixIcon: Icon(Icons.monitor_weight)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: alturaController,
                    decoration: const InputDecoration(
                      hintText: 'Altura', 
                      prefixIcon: Icon(Icons.social_distance)
                    ),
                  ),
                ),
                TextButton(
                   child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueAccent),
                    child: const Center(
                      child: Text('Calcular IMC', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),),
                    ),
                ),
                  onPressed: (){
                    pessoa = Pessoa(
                      nomeController.text,
                      double.tryParse(pesoController.text)!,
                      double.tryParse(alturaController.text)!);
                      setState(() {
                        imc = pessoa.calculaImc();
                        resultado = pessoa.getClassification(imc);
                        listaDeResultados.add(pessoa);
                      });
                    
                    
                } ,
                
               ),
               
                Center(
                 child: Column(
                   
                   children:[
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 10.0),
                       child: Text('Resultado: ${imc.toStringAsFixed(2)}', style: const TextStyle(
                         fontSize: 22,
                         fontWeight: FontWeight.w500,
                         color: Colors.blueAccent, ),),
                     ),
                      Padding(
                       padding: const EdgeInsets.symmetric(vertical: 10.0),
                       child: Text(resultado, style: const TextStyle(
                         fontSize: 22,
                         fontWeight: FontWeight.w500,
                         color: Colors.deepOrange, ),),
                     ),
                     ]),
               ),
           
              ],
            ),
          ),
        ),

      ),
    );
  }
}
