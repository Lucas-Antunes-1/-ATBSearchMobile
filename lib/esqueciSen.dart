import 'package:flutter/material.dart';
import 'package:flutter_application_1/dados.dart';
import 'package:flutter_application_1/tela1.dart';

class senha extends StatefulWidget {
  const senha({super.key});

  @override
  State<senha> createState() => _senhaState();
}

class _senhaState extends State<senha> {
  int i=Login.getINT;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF006494)
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const SizedBox(height: 50),                
                Container( width:500,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 252, 251),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(children: [
                        Image.asset("assets/images/Logo.png",height: 20,),
                        SizedBox(width: 4,)
                        ,Text("ATBSearch",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                      ],),SizedBox(height: 20,),
                      Row(children: [Text("Comfirme o email de verificação enviado para você",style: TextStyle(fontWeight: FontWeight.bold),)],),
                      SizedBox(height: 20,),
                      Row(children: [  Text("Outras opções:",style: TextStyle(fontWeight: FontWeight.bold))],),
                      SizedBox(height: 20,),
                      Row(children: [ Text("-Reenviar email:",style: TextStyle(fontWeight: FontWeight.bold))],)
                     , SizedBox(height: 20,),
                     Row(children: [ Text("-Selecione no seu celular a opção com o número abaixo",style:TextStyle(fontWeight: FontWeight.bold),)],),
                     
                          Text(i.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 70)),
                          GestureDetector(onTap: (){
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Tela1())
                            );
                          },child:        
                        Row(children: [  Text("Voltar",style: TextStyle(fontWeight: FontWeight.bold))],)
 ,)
                        
                    ],

                  ),
                
                ),
              ],
            ),
          ),
        ),
      )

    );
  }
}