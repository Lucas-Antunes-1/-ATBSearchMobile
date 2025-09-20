
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/BackEnd.dart';
import 'package:flutter_application_1/apresentacao.dart';
import 'package:flutter_application_1/contas.dart';
import 'package:flutter_application_1/nuvem.dart';
import 'package:flutter_application_1/nuvem2.dart';
import 'package:flutter_application_1/tabela.dart';
import 'package:flutter_application_1/tela1.dart';
import 'package:flutter_application_1/tela2.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class Login
{

  static List<Usuario> usuarios =[];
  static List<String> listaTabelas=[];
  static Map<String,List<Antibiotic>> mapaTabelas=Map();
  static get getMapTabelas=>mapaTabelas;

  static get getTabelas=>listaTabelas;

  static get getUsuarios=>usuarios;

   static Future<void> carregar() async{
    usuarios=await Usuario.CarregaUsuarios();
    await carregaAnt();
    
    }
static Future<void> carregarUsuario() async {
  final resultado = await TabelaBackEnd.buscarPorIndice(Login.getatual.getId);
  if (resultado.isNotEmpty) {
    listaTabelas = resultado.keys.toList();
    mapaTabelas = resultado;
    print(mapaTabelas.keys.length);
  } else {
    listaTabelas = [];
    mapaTabelas = {};
  }
}


  static List<Antibiotic> _tabelafiltrada=[];

   static void setfiltrada(List<Antibiotic> a)
   {_tabelafiltrada=a;}

 static get getfiltrada=>_tabelafiltrada;

    static List<List<Object>> lis = [["Tabela",Tabela()],["Login",Tela1()],["Cadastro",Tela2()]];

    static int i = 100;

  static int get getINT => i;

    static void sort()
    {
      i=Random().nextInt(999 - 1 + 1);
    }

    static void ls(bool a){
      if(a)
      {
        lis=[["Tabela",Tabela()],["Gerenciar Conta",contas()]];
      }
      else
      {
         lis = [["Tabela",Tabela()],["Login",Tela1()],["Cadastro",Tela2()]];
      }
    }


   static List<Antibiotic> antibioticos=[];

   static Future<void> carregaAnt() async{
      antibioticos=await Backend.carregarLista();
    }

    static get getAnti=>antibioticos;


  static List<List<Object>> get getLs => lis;

  String caminhoIMG="";
 String nome="";
 String email="";
 String senha="";
 String telefone="";
 
  static Future<Map<Usuario,List<String>>> ListaNuv() async
  {
      Map<Usuario,List<String>> m={};
      for(Usuario i in await Usuario.CarregaUsuarios())
      {
        if(((await TabelaBackEnd.buscarPorIndice(i.getId)).keys.toList().isNotEmpty))
{        m[i]=(await TabelaBackEnd.buscarPorIndice(i.getId)).keys.toList();
} 
else
{
  m[i]=[];
}

     }
      return m;
  }



  static Image _imgConta = Image.asset("assets/images/th.jpeg");

  static Image get getimgConta => _imgConta;




Future<Map<String, dynamic>> deletar(Usuario a) async {
  int id = a.getId;
  try {
    final url = Uri.parse("http://localhost:8080/apiUsuarios/deletarUsuario/$id");
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return {
        'success': true,
        'message': 'Usuário e tabelas associadas deletados com sucesso.',
        'statusCode': 200
      };
    } else if (response.statusCode == 404) {
      return {
        'success': false, 
        'message': 'Usuário não encontrado!',
        'statusCode': 404
      };
    } else {
      return {
        'success': false,
        'message': 'Erro ao deletar usuário: ${response.statusCode}',
        'statusCode': response.statusCode
      };
    }
  } catch (e) {
    return {
      'success': false,
      'message': 'Erro de conexão: $e',
      'statusCode': 500
    };
  }}


  static Future<List<String>?> getNuvem(Login a)
  async {
    for(Usuario b in await Usuario.CarregaUsuarios())
    {
      if(b.getEmail==a.getEmail)
      {
        return (await TabelaBackEnd.buscarPorIndice(b.getId)).keys.toList();
      }
    }
    return null;
  }

  static Future<void> del(Usuario a,String s)
 async {

        await deletarTabelaPersonalizada(a.getId,s);
  }

static Future<Map<String, dynamic>> deletarTabelaPersonalizada(int idUsuario, String nomeTabela) async {
  try {
    final nomeTabelaEncoded = Uri.encodeComponent(nomeTabela);
    final url = Uri.parse("http://localhost:8080/TabelasPersonalizadas/$idUsuario/$nomeTabelaEncoded");
    
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return {
        'success': true,
        'message': 'Tabela deletada com sucesso',
        'statusCode': 200
      };
    } else if (response.statusCode == 404) {
      return {
        'success': false, 
        'message': 'Tabela não encontrada',
        'statusCode': 404
      };
    } else {
      return {
        'success': false,
        'message': 'Erro ao deletar tabela: ${response.statusCode}',
        'statusCode': response.statusCode
      };
    }
  } catch (e) {
    return {
      'success': false,
      'message': 'Erro de conexão: $e',
      'statusCode': 500
    };
  }
}

 static Color _apbar = Color.fromRGBO(0, 100, 148, 1);

  static Color get getap => _apbar;

  static bool _f1 = false;
  static void setF(bool m)
  {_f1=m;}
  static bool get getF => _f1;

  static List<List<Object>> _dratual = [["Início",Comeco(),Icons.start],["Tabelas salvas",nuv(_f1),Icons.cloud],["Tabela",Tabela(),Icons.table_chart],["Login",Tela1(),Icons.app_registration],["Cadastro",Tela2(),Icons.login]];
  static int _h=0;
  static int _j=1;
 static String _texto = "Faça login para ver suas tabelas salvas";
 static void setT(String t)
  {_texto=t;}
 static String get getT => _texto;

  static void setJ(int p)
  {
    _j=p;
  }

 static Widget nuv(bool f)
 {
  if(f)
  {return Nuvem();}
  else
  {return Nuvem2();}
 }


  static int get getJ => _j;

  static int get getH =>_h;

  static List<List<Object>> get getDratual  => _dratual;

 static Usuario _atual = Usuario(id: 0
 , username: ""
 , senha: ""
 , pagoVersaoPro: false
 , telefone: "", 
 email: '', userId: 0);

   static Usuario get getatual => _atual;
 
 static Future<Usuario?> adiciona(Usuario u) async {
    try {
      var url = Uri.parse("http://localhost:8080/apiUsuarios/cadastrarUsuario");
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "nome": u.username,  
          "senha": u.senha,
          "telefone": u.telefone,
          "email": u.email,
          "userId": u.userId
        }),
      );

      if (response.statusCode == 200) {
        var dados = jsonDecode(response.body);
        return Usuario(
          id: dados["id"],
          username: dados["nome"],
          senha: dados["senha"],
          pagoVersaoPro: dados["pagoVersaoPro"],
          telefone: dados["telefone"],
          email: dados["email"],
          userId: dados["userId"],
        );
      } else {
        print("Erro ao cadastrar: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exceção ao cadastrar: $e");
      return null;
    }
  }


 get getIMG => caminhoIMG;
 
  get getNome => nome;

 set setNome( nome) => this.nome = nome;

  get getEmail => email;



  get getSenha => senha;


  get getTelefone => telefone;

 Login.dados(this.nome,this.telefone,this.email,this.senha);
Login.img(this.nome,this.telefone,this.email,this.senha,this.caminhoIMG);
 Login();

  static void setAtual(Usuario a) {_atual=a;}

  static Future<void> AtualizaAtual()
  async {
    print(_atual.getId);
    _atual=await Usuario.buscarPorIndiceU(_atual.getId);
  }

  static void setDratual(List<List<Object>> list) {_dratual=list;}

  static void setH(int q){_h=q;}

  bool isImageFile(Path file) {
  final validExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp'];
  final extension = file.toString().toLowerCase().split('.').last;
  
  if (validExtensions.contains(extension)) {
    return true;
  }
  else
    {return false;
  }
}





}

