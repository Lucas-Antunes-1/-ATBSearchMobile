
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/apresentacao.dart';
import 'package:flutter_application_1/contas.dart';
import 'package:flutter_application_1/nuvem.dart';
import 'package:flutter_application_1/nuvem2.dart';
import 'package:flutter_application_1/tabela.dart';
import 'package:flutter_application_1/tela1.dart';
import 'package:flutter_application_1/tela2.dart';

class Login
{
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

  static List<List<Object>> get getLs => lis;

  String caminhoIMG="";
 String nome="";
 String email="";
 String senha="";
 String telefone="";
 static Map<Login,List<String>> _lista= {
  Login.img("Nata pelé","","email@gmail.com","123456","images/th.jpeg"):["1","2","3"],
  Login.dados("Louis Felipe","","coiso@gmail.com","123456"):["tabela 1","tabela 2","tabela 3"],

  };
  static Image _imgConta = Image.asset("assets/images/th.jpeg");

  static Image get getimgConta => _imgConta;
 void setimgConta(String i)
  {
    _atual=Login.img(_atual.nome,_atual.telefone,_atual.email,_atual.senha,i);

  }

static acha(Login a)
{
  for(int i=0;i<_lista.keys.length;i++)
  {
      if(_lista.keys.toList()[i].email==a.email)
      {
        return _lista.values.toList()[i];
      }
  }
}

static void deletar(Login a)
{
  _lista.remove(a);
}


  static List<String>? getNuvem(Login a)
  {
    for(Login b in _lista.keys)
    {
      if(b.getEmail==a.getEmail)
      {
        return _lista[b];
      }
    }
    return null;
  }

  static void del(Login a,int i)
  {
     for(Login b in _lista.keys)
    {
      if(b.getEmail==a.getEmail)
      {
         _lista[b]!.remove(_lista[b]![i]);
      }
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

 static Login _atual = Login();

   static Login get getatual => _atual;
 
static void adiciona(Login a)
{
  Map<Login,List<String>> k=_lista;
   k[a]=[""];
    Login.setlista = k;
}
 static Map<Login,List<String>> get getlista => _lista;

 get getIMG => caminhoIMG;
 
  static set setlista(Map<Login,List<String>> v) => _lista = v;
  get getNome => nome;

 set setNome( nome) => this.nome = nome;

  get getEmail => email;



  get getSenha => senha;


  get getTelefone => telefone;

 Login.dados(this.nome,this.telefone,this.email,this.senha);
Login.img(this.nome,this.telefone,this.email,this.senha,this.caminhoIMG);
 Login();

  static void setAtual(Login a) {_atual=a;}

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

 void setnome(String a)
{
  _atual.nome=a;
}

  void setEmail(String text) {
    _atual.email = text;
    }

  void setTelefone(String text) {
    _atual.telefone = text;
  }

  void setSenha(String text) {

    _atual.senha =text;
  }

  static void novoNome(Login a, int index, String s) {
    
     for(Login b in _lista.keys)
    {
      if(b.getEmail==a.getEmail)
      {
         _lista[b]![index]=s;
      }
    }
  }




}

