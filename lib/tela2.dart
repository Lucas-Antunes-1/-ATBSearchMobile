import 'package:flutter/material.dart';
import 'package:flutter_application_1/apresentacao.dart';
import 'package:flutter_application_1/contas.dart';
import 'package:flutter_application_1/dados.dart';
import 'package:flutter_application_1/tabela.dart';
import 'package:flutter_application_1/tela1.dart';


class Tela2 extends StatefulWidget {
  const Tela2({super.key});

  @override
  State<Tela2> createState() => _Tela1State();
}

class _Tela1State extends State<Tela2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
    static final RegExp phoneRegex = RegExp(
    r'^\(\d{2}\)\s\d{4,5}-\d{4}$',
  );
RegExp emailRegex = RegExp(
  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
  caseSensitive: false,
);
 String q = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: const Text('Cadastro',style: TextStyle(color: Colors.white),),backgroundColor: Login.getap,),
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
                        Login.setH(0);
                        Login.setF(false);
                        Login.setT("Faça login para ter suas tabelas salvas");
                        Login.setAtual(Login());
                        Login.ls(false);
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
                   body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF006494)
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 20),
                
                const SizedBox(height: 30),
                
                Container(
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        Row(children: [
                  Hero(
                  tag: 'logo',
                  child: Image.asset(
                  "assets/images/Logo.png",
                  height: 30,
                  filterQuality: FilterQuality.high,
                  ),
                  ),
                 const SizedBox(width: 10,)
                 ,
                const Text("ATBSearch",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                ],),
                        const SizedBox(height: 25),
                  TextFormField(
                          controller: _nome,
                          style: const TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.face, color: Color.fromARGB(255, 0, 0, 0)),
                            labelText: 'Nome',
                            labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            hintText: 'Digite seu nome',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            return null;
                          },
                        ),

                        
                        
                        const SizedBox(height: 25,)



                        ,TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 0, 0, 0)),
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            hintText: 'exemplo@email.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          validator: (value) {
                            
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite um e-mail';
                  }
                  if (!emailRegex.hasMatch(value)) {
                    return 'E-mail inválido! Use o formato: usuario@dominio.com';
                  }
                  return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        
                   
                        TextFormField(
                          controller: _senha,
                          obscureText: true,
                          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 0, 0, 0)),
                            labelText: 'Senha',
                            labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            hintText: 'Digite sua senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira uma senha';
                            }
                            if (value.length < 6) {
                              return 'Mínimo 6 caracteres';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25,),
                        TextFormField(
                          controller: _telefone,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone, color: Color.fromARGB(255, 0, 0, 0)),
                            labelText: 'Telefone',
                            labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            hintText: '(XX) XXXX-XXXX',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          validator: (value) {

                            if(value!=null)
                          {
                  if (!(phoneRegex.hasMatch(value)||value=='')) {
                    return 'Formato inválido. Use (XX) XXXXX-XXXX';
                  }
                  }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 30),
                        
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                           onPressed: () {
  q = "";
  if (_formKey.currentState!.validate()) {
    if (Login.getlista.keys.any((login) => login.getEmail == _email.text)) {
      showDialog<String>(
            context: context,
            builder:
                (BuildContext context) => AlertDialog(
                  title: const Text('Esse email já está cadastrado!'),
                  content: const Text('Por favor faça um cadatro diferente,ou faça login em sua conta'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Fazer um novo cadastro'),
                    ),
                    TextButton(
                      onPressed: ()  {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: 
                        (context) => Tela1()));
                  },
                      child: const Text('Fazer login'),
                    ),
                  ],
                ),
          );
    }
    else if((Login.getlista.keys.any((login) => login.getTelefone == _telefone.text))&&(_telefone.text!=""))
    {
      q= "Este telefone já está cadastrado!";
    }
     else {
      Login l = Login.dados(
        _nome.text, 
        _telefone.text, 
        _email.text, 
        _senha.text
      );

       Login.setT("Sem nenhuma tabela salva");
        Login.ls(true);
      Login.adiciona(l);
      print(Login.getlista[Login.getatual]![2]);
      Login.setDratual([["Início",Comeco(),Icons.start],["Tabelas salvas",Login.nuv(Login.getF),Icons.cloud],["Tabela",Tabela(),Icons.table_chart],["Sua conta",contas(),Icons.face_3]]);
      Login.setH(1);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Tabela()));
    }
    

  }
  setState(() {});
},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(23, 172, 4, 1),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        
                        ),
                        const SizedBox(height: 10,)
                        ,
                        Row(children: [
                        GestureDetector(
                          onTap: () {
                                            Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Tela1())
                );
                          },
                          child:const Text("Já tem uma conta?Faça Login"),

                        )
                        ],),
                        Text(q)
                      ],
                    ),
                  ),
                
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}