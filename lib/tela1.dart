import 'package:flutter/material.dart';
import 'package:flutter_application_1/BackEnd.dart';
import 'package:flutter_application_1/apresentacao.dart';
import 'package:flutter_application_1/contas.dart';
import 'package:flutter_application_1/dados.dart';
import 'package:flutter_application_1/esqueciSen.dart';
import 'package:flutter_application_1/nuvem.dart';
import 'package:flutter_application_1/tabela.dart';
import 'package:flutter_application_1/tela2.dart';


class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController(text: "user2@example.com");
  final TextEditingController _senha = TextEditingController(text: "Oe5OpyYuwpgm5vRwENoHvw==:24hKwYHuWBb/fjDIPcGIFRTj7nEH+M+IskY2MAzb3e8=");
RegExp emailRegex = RegExp(
  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
  caseSensitive: false,
);
    static final RegExp phoneRegex = RegExp(
    r'^\(\d{2}\)\s\d{4,5}-\d{4}$',
  );
  int h=0;
  bool y=true;

  List<Usuario> usuarios=[];

 @override
  void initState() {  
     carregarAntibiotico();
    super.initState();
 
  }

  void carregarAntibiotico() async {
    final resultado = await Usuario.CarregaUsuarios();
    setState(() {
      usuarios = resultado;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: const Text('Login',style: TextStyle(color: Colors.white),),backgroundColor: Login.getap,),
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

                const SizedBox(height: 50),                
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
                          controller: _email,
                          style: const TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 0, 0, 0)),
                            labelText: 'Email ou Telefone',
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
                              return 'Campo obrigatório';
                            }     
                            if ((!emailRegex.hasMatch(value))&&(!phoneRegex.hasMatch(value))) {
                    return 'Digite um email ou telefone válido!';
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
                        const SizedBox(height: 30),                        
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {

                                  for(Usuario a in usuarios)
                                  {
                                    if(((a.getEmail==_email.text)||(a.getTelefone==_email.text))&&(a.getSenha==_senha.text))
                                    {
                                      y=false;
                                      Login.ls(true);
                                     Login.setAtual(a);
                                     Login.setH(1);
                                    if((await TabelaBackEnd.buscarPorIndice(a.getId)).isNotEmpty)
                                    {
                                      Login.setF(true);
                                      Login.setJ(0);
                                    }
                                    Login.setDratual([["Início",Comeco(),Icons.start],["Tabelas salvas",Login.nuv(Login.getF),Icons.cloud],["Tabela",Tabela(),Icons.table_chart],["Sua conta",contas(),Icons.face_3]]);
                                      Navigator.pushReplacement(context, 
                                    MaterialPageRoute(builder: 
                                    (context) => Nuvem(),
                                    )
                                    );
                                      break;
                                    }

                                  }
                                  if(y)
                                  {
showDialog<String>(
  context: context,
  builder: (BuildContext context) => AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    title: const Text(
      'Erro ao entrar',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.redAccent,
      ),
    ),
    content: const Text(
      'Sua senha ou seu email/telefone está incorreto.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
      ),
    ),
    actionsAlignment: MainAxisAlignment.center,
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          _email.text = "";
          _senha.text = "";
          y = true;
        },
        child: const Text(
          'OK',
          style: TextStyle(fontSize: 16),
        ),
      ),
    ],
  ),
);
                                  }
                              }
                              setState(() {
                                
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(23, 172, 4, 1),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Entrar',
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
                            Login.sort();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => senha())
                            );
                          },
                          child:const Text("Esqueci minha senha"),

                        )
                        ],),
                        Row(children: [
                        GestureDetector(onTap: () {
                                          Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Tela2())
                );
                        },
                        child:  const Text("Não tem conta?Cadastre-se"),
                        )
                        
                        ],)
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