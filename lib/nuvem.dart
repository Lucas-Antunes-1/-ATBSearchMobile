import 'package:flutter/material.dart';
import 'package:flutter_application_1/BackEnd.dart';
import 'package:flutter_application_1/apresentacao.dart';
import 'package:flutter_application_1/dados.dart';
import 'package:flutter_application_1/tabela.dart';
import 'package:flutter_application_1/tela1.dart';
import 'package:flutter_application_1/tela2.dart';


class Nuvem extends StatefulWidget {
  const Nuvem({super.key});

  @override
  State<Nuvem> createState() => _NuvemState();
}

class _NuvemState extends State<Nuvem> {
  Usuario get log => Login.getatual;
  TextEditingController _c1 = TextEditingController();


  @override
  void initState() {  
     carregarAntibiotico();
    super.initState();
 
  }

  void carregarAntibiotico() async {
    final resultado = (await TabelaBackEnd.buscarPorIndice(Login.getatual.getId)).keys.toList();
    setState(() {
      listaTabelas = resultado;
    });
  }

     List<String> listaTabelas =  [];




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Tabelas salvas na nuvem",style: TextStyle(color:Colors.white),),
        centerTitle: true, backgroundColor: Login.getap,),
   drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('ATBSearch', style: TextStyle(color: Colors.white, fontSize: 24)),
            )]+List.generate(Login.getDratual.length, (index){
              return ListTile(
              leading: Icon(Login.getDratual[index][2] as IconData?),
              title: Text(Login.getDratual[index][0] as String),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Login.getDratual[index][1] as Widget)
                );
              },
            );
            })+List.generate(Login.getH,(index){
              return ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
              onTap: () {
                 showDialog<String>(
            context: context,
            builder:
                (BuildContext context) => AlertDialog(
                  title: const Text('Deseja sair mesmo?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Continuar logado'),
                    ),
                    TextButton(
                      onPressed: ()  {
                        Login.ls(false);
                        Login.setH(0);
                        Login.setF(false);
                        Login.setT("Faça login para ter suas tabelas salvas");
                        Login.setAtual(Usuario(id: 0, username: "", senha: "", pagoVersaoPro: false, telefone: "", email: "", userId: 0));
                        Login.setDratual([["Início",Comeco(),Icons.start],["Tabelas salvas",Login.nuv(Login.getF),Icons.cloud],["Tabela",Tabela(),Icons.table_chart],["Login",Tela1(),Icons.app_registration],["Cadastro",Tela2(),Icons.login]]);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: 
                        (context) => Tela1()));
                  },
                      child: const Text('Sair'),
                    ),
                  ],
                ),
          );
              },
            );
            })
            ,),
            ) ,



                  body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:



         GridView.count(
          crossAxisCount: (MediaQuery.of(context).size.width / 200).floor(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(
            listaTabelas.length,
            (index) => Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: 
                Column(children:[
                  Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                  GestureDetector(onTap: ()
    {
      showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: () {
                   showDialog<String>(
            context: context,
            builder:
                (BuildContext context) => AlertDialog(
                  title: const Text('Deseja deletar essa tabela?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Não deletar'),
                    ),
                    TextButton(
                      onPressed: ()  {
                        Login.del(Login.getatual, listaTabelas[index]);
                      Navigator.pop(context);
                       Navigator.pop(context);
                      setState(() {
                      });
                  },
                      child: const Text('Deletar'),
                    ),
                  ],
                ),
          );
              },
              child: const Text('Deletar'),
            ),
            const SizedBox(height: 8),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: () {
                  showDialog<String>(
            context: context,
            builder:
                (BuildContext context) => AlertDialog(
                  title: const Text('Novo nome para a tabela'),
                  content: Form(child: TextFormField(controller: _c1,decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),)),
                  actions: <Widget>[
                    TextButton(
                     onPressed: () async {
  await TabelaBackEnd.renomearTabela(
    Login.getatual.getId,
    (await TabelaBackEnd.buscarPorIndice(Login.getatual.getId)).keys.toList()[index],
    _c1.text != "" ? _c1.text : listaTabelas[index],
  );
  _c1.text = '';

  Navigator.pop(context);
  Navigator.pop(context); 

  final resultado = (await TabelaBackEnd.buscarPorIndice(Login.getatual.getId)).keys.toList();
  setState(() {
    listaTabelas = resultado;
  });},
                      child: const Text('Renomear'),
                    ),
                  ],
                ),
          );
              },
              child: const Text('Renomear'),
            ),
          ],
        ),
      ),
    );
    }
                  ,child: Text("...",style: TextStyle(fontSize: 16),),)
                  ],),SizedBox(height: 0.25*MediaQuery.of(context).size.width/(MediaQuery.of(context).size.width / 200).floor())
                 , Text(
                 ( listaTabelas[index]),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
                ),])


              ),
            ),
          ),
        ),
       
      ),
      
    );
  }
}