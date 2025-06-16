import 'package:flutter/material.dart';
import 'package:flutter_application_1/apresentacao.dart';
import 'package:flutter_application_1/dados.dart';
import 'package:flutter_application_1/tabela.dart';
import 'package:flutter_application_1/tela1.dart';
import 'package:flutter_application_1/tela2.dart';


class Nuvem2 extends StatefulWidget {
  const Nuvem2({super.key});

  @override
  State<Nuvem2> createState() => _NuvemState();
}

class _NuvemState extends State<Nuvem2> {
  Login get log => Login.getatual;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Tabelas salvas na nuvem",style: TextStyle(color: Colors.white),),
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
                        Login.setAtual(Login());
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
                  body: Center(child: Container(padding: EdgeInsets.all(30),child: 
                    Text(Login.getT,style: TextStyle(fontSize: 50),)
                  ),)
      
    );
  }
}