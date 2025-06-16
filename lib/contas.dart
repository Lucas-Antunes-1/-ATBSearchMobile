import 'package:flutter/material.dart';
import 'package:flutter_application_1/apresentacao.dart';
import 'package:flutter_application_1/dados.dart';
import 'package:flutter_application_1/nuvem.dart';
import 'package:flutter_application_1/tabela.dart';
import 'package:flutter_application_1/tela1.dart';
import 'package:flutter_application_1/tela2.dart';

class contas extends StatefulWidget {
  const contas({super.key});

  @override
  State<contas> createState() => _ContasState();
}

class _ContasState extends State<contas> {
  final _formKey = GlobalKey<FormState>();
  final _k3 = GlobalKey<FormState>();
  final TextEditingController _senha1 = TextEditingController();
  final TextEditingController _senha3 = TextEditingController();
  final TextEditingController _nome = TextEditingController(text: Login.getatual.getNome);
  final TextEditingController _email = TextEditingController(text: Login.getatual.getEmail);
  final TextEditingController _telefone = TextEditingController(text: Login.getatual.getTelefone);
  final TextEditingController _senha = TextEditingController();
  final TextEditingController _senha2 = TextEditingController();
   String _imagemCaminho = Login.getatual.getIMG!=""? Login.getatual.getIMG : "images/th.jpeg";
  bool y=true;

RegExp emailRegex = RegExp(
  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
  caseSensitive: false,
);

    static final RegExp phoneRegex = RegExp(
    r'^\(\d{2}\)\s\d{4,5}-\d{4}$',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
        title: Text("ATBSearch",style: TextStyle(color: Colors.white),),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
            children: [Text("Gerenciar Conta",style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),SizedBox(height: 30,)
            ,
             Row(mainAxisAlignment: MainAxisAlignment.center,children:[ GestureDetector(
                onTap: () {
                  _mostrarDialogoImagem();
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage:AssetImage(_imagemCaminho),
                  backgroundColor: Colors.grey[300],
                ),
              ),SizedBox(width: 4,),Text(Login.getatual.getNome,style: TextStyle(fontSize: 25),)]),
              const SizedBox(height: 30),
Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Email:"+Login.getatual.getEmail,style: TextStyle(fontSize: 14),)],),SizedBox(height: 20,),
Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Telefone:"+(Login.getatual.getTelefone!=""?Login.getatual.getTelefone:"Sem Cadastro de Telefone"),style: TextStyle(fontSize: 14),)],),SizedBox(height: 20,),
Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      
   GestureDetector(
     onTap: () {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alterar Conta"),
        content:SingleChildScrollView(padding: EdgeInsets.all(20),child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
         child: Form(key: _formKey,child: Column(children: [
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
                       SizedBox(height: 20,),

                        TextFormField(
                          controller: _senha2,
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {

                                  for(Login a in Login.getlista.keys)
                                  {
                                    if(((a.getEmail==_email.text)||(a.getTelefone==_email.text))&&(a.getSenha==_senha2.text))
                                    {
                                       y=false;
                                     Login.setAtual(a);
                                     Login.setH(1);
                                    if(Login.getNuvem(a)!.isNotEmpty)
                                    {
                                      Login.setF(true);
                                      Login.setJ(0);
                                    }
                                    _senha2.text="";
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
          _senha2.text = "";
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
                          ),)
                        
         ]
         )
         ,)

         
        ),
        )
        ,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _senha2.text="";
                _email.text = Login.getatual.getEmail;
              });
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  Login.getatual.setEmail(_email.text);
                  Navigator.pop(context);
                });
              }
            },
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }
  ,child: Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5), 
        spreadRadius: 2, 
        blurRadius: 5,  
        offset: Offset(4, 4), 
      ),
    ],
  ),child: Row(children: [Icon(Icons.email,size: 30,),SizedBox(width: 5,),Text("Trocar de Conta",style: TextStyle(fontSize: 14),)])
  ),
  ),SizedBox(width: 20,),
Form(child:       
   GestureDetector(onTap: ()
              {
                    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alterar nome de perfil"),
        content: TextFormField(
          controller: _nome,
          decoration: const InputDecoration(labelText: "Novo nome"),

        ),actions: [
                    TextButton(
            onPressed: () { Navigator.pop(context);
            setState(() {
              _nome.text=Login.getatual.getNome;
            });
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: ()  {Navigator.pop(context);
            setState(() {
              Login.getatual.setnome(_nome.text);
            });
            },
            child: const Text("Salvar"),
          ),
        ],

      ));

              },child: Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5), 
        spreadRadius: 2, 
        blurRadius: 5,  
        offset: Offset(4, 4), 
      ),
    ],
  ),child: Row(children: [Icon(Icons.abc,size: 30,),SizedBox(width: 5,),Text("Mudar Nome",style: TextStyle(fontSize: 14),)])
  ),
  ),
),

  
],)
,
              const SizedBox(height: 16),

              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                       
   GestureDetector(
     onTap: () {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: _telefone.text!=""?Text("Alterar telefone de perfil"):Text("Cadastrar Telefone"),
        content: Form(
          key: _formKey, 
          child: TextFormField(
            controller: _telefone,
            decoration: const InputDecoration(hintText: "(XX) XXXXX-XXXX",labelText: "Novo telefone"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              if (!phoneRegex.hasMatch(value)) {
                return 'Digite um telefone válido';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _telefone.text = Login.getatual.getTelefone;
              });
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  Login.getatual.setTelefone(_telefone.text);
                  Navigator.pop(context);
                });
              }
            },
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }
  ,child: Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5), 
        spreadRadius: 2, 
        blurRadius: 5,  
        offset: Offset(4, 4), 
      ),
    ],
  ),child: Row(children: [Icon(Icons.phone,size: 30,),SizedBox(width: 5,),Text("Mudar Telefone",style: TextStyle(fontSize: 14),)])
  ),
  ),SizedBox(width: 20,),GestureDetector(
     onTap: () {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Alterar senha"),
        content: Form(
          key: _formKey, 
          child:Container(child: Column(mainAxisSize: MainAxisSize.min,children: [
            TextFormField(obscureText: true,
            controller: _senha,
            decoration: const InputDecoration(labelText: "Nova senha"),
            validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira uma senha';
                            }
                            if (value.length < 6) {
                              return 'Mínimo 6 caracteres';
                            }
                            return null;
            },
          ),SizedBox(height: 20,),
          TextFormField(obscureText: true,
            controller: _senha1,
            decoration: const InputDecoration(labelText: "Digite sua senha atual"),
            validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira uma senha';
                            }
                            if(value!=Login.getatual.senha)
                            {
                              return "Senha incoreta";
                            }
                            return null;
            },
          )
          ],) 
        ),),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {

                _senha.text = "";
              });
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  Login.getatual.setSenha(_senha.text);
                  Navigator.pop(context);
                  _senha1.text="";
                  _senha.text="";
                });
              }
            },
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }
  ,child: Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5), 
        spreadRadius: 2, 
        blurRadius: 5,  
        offset: Offset(4, 4), 
      ),
    ],
  ),child: Row(children: [Icon(Icons.password,size: 30,),SizedBox(width: 5,),Text("Mudar Senha",style: TextStyle(fontSize: 14),)])
  ),
  )
              ],),
              SizedBox(height: 20,),
              Text("Número de tabelas personalizadas:"+(Login.acha(Login.getatual)!=null?(Login.acha(Login.getatual).length).toString():"Sem tabelas")),
              SizedBox(height: 20,),
              GestureDetector(onTap: () {
                               showDialog<String>(
            context: context,
            builder:
                (BuildContext context) => AlertDialog(
                  title: const Text('Deseja Sair da conta?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Continuar logado'),
                    ),
                    TextButton(
                      onPressed: ()  {
                        Login.ls(true);
                        Login.setH(0);
                        Login.setF(false);
                        Login.setT("Faça login para ter suas tabelas salvas");
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
  
              },child: Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5), 
        spreadRadius: 2, 
        blurRadius: 5,  
        offset: Offset(4, 4), 
      ),
    ],
  ),child: Row(children: [Icon(Icons.logout,size: 30,),SizedBox(width: 5,),Text("Sair",style: TextStyle(fontSize: 14),)])





  ),),SizedBox(height: 20,),




           GestureDetector(onTap: () {
                               showDialog<String>(
            context: context,
            builder:
                (BuildContext context) => AlertDialog(
                  title: const Text('Deseja deletar sua conta?'),
                  content: Form(key: _k3,child:
                  Container(child:   Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [  TextFormField(obscureText: true,
            controller: _senha3,
            decoration: const InputDecoration(labelText: "Digite sua senha para comfirmar"),
            validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira uma senha';
                            }
                            if(value!=Login.getatual.senha)
                            {
                              return "Senha incoreta";
                            }
                            return null;
            },
          )],
                  ),)
                 ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Continuar logado'),
                    ),
                    TextButton(
                      onPressed: ()  {
                        if(_k3.currentState!.validate())
                        { Login.ls(true); 
                          Login.setH(0);
                        Login.setF(false);
                        Login.setT("Faça login para ter suas tabelas salvas");
                       Login.deletar(Login.getatual);
                        Login.setAtual(Login());
                        Login.setDratual([["Início",Comeco(),Icons.start],["Tabelas salvas",Login.nuv(Login.getF),Icons.cloud],["Tabela",Tabela(),Icons.table_chart],["Login",Tela1(),Icons.app_registration],["Cadastro",Tela2(),Icons.login]]);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: 
                        (context) => Tela1()));
                        }

                      
                  },
                      child: const Text('Deletar'),
                    ),
                  ],
                ),
          );
  
              },child: Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5), 
        spreadRadius: 2, 
        blurRadius: 5,  
        offset: Offset(4, 4), 
      ),
    ],
  ),child: Row(children: [Icon(Icons.delete,size: 30,),SizedBox(width: 5,),Text("Deletar Conta",style: TextStyle(fontSize: 14),)])
  ),)
            ],
          ),
        ),
      );
  }


  void _mostrarDialogoImagem() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alterar imagem de perfil"),
        content: TextFormField(
          controller: TextEditingController(text: _imagemCaminho),
          decoration: const InputDecoration(labelText: "Caminho da imagem"),
onChanged: (value) {
 if (!value.contains('.') || value.trim().isEmpty) {
    setState(() {
      _imagemCaminho = "assets/images/th.jpeg";
    });
    return;
  }

  final ext = value.split('.').last.toLowerCase();

  if (["png", "jpeg", "jpg", "webp"].contains(ext)) {
    setState(() {
      _imagemCaminho = value;
    });
  } else {
    setState(() {
      _imagemCaminho = "assets/images/th.jpeg";
    });
  }
},
        ),
        actions: [
          TextButton(
            onPressed: () { Navigator.pop(context);
            setState(() {
              _imagemCaminho=Login.getatual.getIMG!=""?Login.getatual.getIMG:"images/th.jpeg";
            });
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () { 
              Navigator.pop(context);
              setState(() {
                
                Login.getatual.setimgConta(_imagemCaminho);
                            });
              },
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }
}
