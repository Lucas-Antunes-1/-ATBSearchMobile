import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/tabela.dart';
import 'package:http/http.dart' as http;

class Backend {

static Future<List<Antibiotic>> carregarLista() async {
  var url = Uri.parse("http://localhost:8080/apiAntibiotico/Antibioticos");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> dadosLista = jsonDecode(response.body);
    return dadosLista.map((item) {
      return Antibiotic(
        id: item["id"],
        name: capitalizar(item["nome"]),
        type: TipoSTR(item["tipo_antibiotico"]),
        gramPositive: item["gram_positiva"] as bool,
        gramNegative: item["gram_negativa"] as bool,
        morphology: morfologiaSTR(item["morfologia"]),
      );
    }).toList();
  } else {
    throw Exception("Erro ao carregar dados: ${response.statusCode}");
  }
}


static String capitalizar(String texto) {
  if (texto.isEmpty) return texto;
  return texto[0].toUpperCase() + texto.substring(1).toLowerCase();
}

static String TipoSTR(int i)
{
      switch (i) {
    case 1:
      return 'Macrolídeos';
    case 2:
      return 'Penicilinas';
    case 3:
      return 'Cefalosporinas';
    case 4:
      return 'Carbapenêmicos';
    case 5:
      return 'Aminoglicosídeos';
    case 6:
      return 'Quinolonas';
    case 7:
      return 'Anfenicóis';
    case 8:
      return 'Sulfonamidas';
    case 9:
      return 'Glicopeptídeos';
    case 10:
      return 'Nitroimidazólicos';
    case 11:
      return 'Licosamidas';
    case 12:
      return 'Polimixinas';
    case 13:
      return 'Oxazolidinona';
    case 14:
      return 'Glicilciclina';
    case 15:
      return 'Antituberculosos';
    default:
      return 'inválido'; 
  }
}

static String morfologiaSTR(int i)
{
  if(i==1)
  {
    return "Cocos";
  }
  
   else if(i==2)
  {
    return "Bacilos";
  }
  
  else if(i==3)
  {
    return "Cocos e Bacilos";
  }

  else{
    return 'Inválido';
  }
}
}

class Antibiotico{

final int id;
final String nome;
final int tipo_antibiotico;
final bool gram_positivo;
final bool gram_negativo;
final int morfologia;

  Antibiotico({
    required this.id,
    required this.nome,
    required this.tipo_antibiotico,
    required this.gram_positivo,
    required this.gram_negativo,
    required this.morfologia,
  });

static Antibiotico1()
 {
  return Antibiotico(id: 0, nome: "nome", tipo_antibiotico: 0, gram_positivo: false, gram_negativo: false, morfologia: 0);
 }


int get getId => id;
  String get getNome => nome;
  int get getTipo_antibiotico => tipo_antibiotico;
  bool get getGram_positiva => gram_positivo;
  bool get getGram_negativa => gram_negativo;
  int get getMorfologia => morfologia;

  static Future<Antibiotico> buscarPorIndice(int index) async {
    try {
      var url = Uri.parse("http://localhost:8080/apiAntibiotico/Antibioticos");
      var response = await http.get(url);
      
      if (response.statusCode == 200) {
        List<dynamic> dadosLista = jsonDecode(response.body);
        
        if (index >= 0 && index < dadosLista.length) {
          return Antibiotico(id: dadosLista[index]["id"], 
          nome: dadosLista[index]["nome"], 
          tipo_antibiotico: dadosLista[index]["tipo_antibiotico"], 
          gram_positivo: dadosLista[index]["gram_positiva"] as bool,
          gram_negativo: dadosLista[index]["gram_negativa"] as bool,
          morfologia: dadosLista[index]["morfologia"]);
        } else {
          throw Exception('Índice fora dos limites da lista');
        }
      } else {
        throw Exception('Falha ao carregar dados da API: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar antibiótico: $e');
      return Antibiotico(
        id: 0, 
        nome: "Erro", 
        tipo_antibiotico: 0, 
        gram_positivo: false, 
        gram_negativo: false, 
        morfologia: 0
      );
    }
  }

}








class TabelaBackEnd{
final Map<String,List<Antibiotico>> listaAnt;
final int idUsuario;

  TabelaBackEnd({
    required this.listaAnt, 
  required this.idUsuario  });
  
  Map<String, List<Antibiotico>> get getlistaAnt => listaAnt;

  set listaAnt(Map<String, List<Antibiotico>> novaLista) {
    listaAnt = novaLista;
  }
  

  int get getIdUsuario => idUsuario;

  set idUsuario(int novoId) {
    idUsuario = novoId;
  }


static Future<Map<String, dynamic>> renomearTabela(int idUsuario, String nomeAntigo, String nomeNovo) async {
  try {
    final url = Uri.parse("http://localhost:8080/TabelasPersonalizadas/renomear");
    
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'idUsuario': idUsuario.toString(),
        'nomeAntigo': nomeAntigo,
        'nomeNovo': nomeNovo
      }
    );

    if (response.statusCode == 200) {
      return {
        'success': true,
        'message': 'Tabela renomeada com sucesso',
        'statusCode': 200
      };
    } else if (response.statusCode == 400) {
      return {
        'success': false, 
        'message': 'Dados inválidos: ${response.body}',
        'statusCode': 400
      };
    } else if (response.statusCode == 404) {
      return {
        'success': false,
        'message': 'Tabela não encontrada',
        'statusCode': 404
      };
    } else if (response.statusCode == 409) {
      return {
        'success': false,
        'message': 'Já existe uma tabela com esse nome',
        'statusCode': 409
      };
    } else {
      return {
        'success': false,
        'message': 'Erro ao renomear tabela: ${response.statusCode}',
        'statusCode': response.statusCode,
        'body': response.body
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


static Future<Map<String, List<Antibiotic>>> buscarPorIndice(int index) async {
  try {
    var url = Uri.parse("http://localhost:8080/TabelasPersonalizadas/$index");
    var response = await http.get(url);
    
    if (response.statusCode == 200) {
      dynamic decodedBody = jsonDecode(response.body);
      List<dynamic> dadosLista = decodedBody is List ? decodedBody : [];
      
      Map<String, List<Antibiotic>> resultado = {};
      for (var item in dadosLista) {
        String? nomeTabela = item["nomeTabela"]?.toString();
        if (nomeTabela == null) continue; 
        List<int> antibioticosIds=[];
        for(int i in item["antibioticos"])
        {
          antibioticosIds.add(i);
        }
        List<Antibiotic> listaAntibioticos = [];
        
        for (int idDynamic in antibioticosIds) {
          int? idAntibiotico =  idDynamic ;
          
          try {
            Antibiotico antibioticoBd = await Antibiotico.buscarPorIndice(idAntibiotico);
            
            listaAntibioticos.add(Antibiotic(
              id: idDynamic,
              name: Backend.capitalizar(antibioticoBd.getNome),
              type: Backend.TipoSTR(antibioticoBd.getTipo_antibiotico),
              gramPositive: antibioticoBd.getGram_positiva,
              gramNegative: antibioticoBd.getGram_negativa,
              morphology: Backend.morfologiaSTR(antibioticoBd.getMorfologia),
            ));
          } catch (e) {
            print('Erro ao buscar antibiótico com ID $idAntibiotico: $e');
          }
        }
        
        resultado[nomeTabela] = listaAntibioticos;
      }
      
      return resultado;
    } else {
      throw Exception('Falha ao carregar dados da API: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao buscar Tabelas: $e');
    return {};
  }
}


}













class Usuario{
final int id;
final String username;
final String senha;
final bool pagoVersaoPro;
final String telefone;
final String email;
final int userId;

Usuario({
    required this.id,
    required this.username,
    required this.senha,
    required this.pagoVersaoPro,
    required this.telefone,
    required this.email,
    required this.userId,
  });

 static  dados(String s,String se,String e,String t
  )
{
  return Usuario(id: 0, username: s, senha: se, pagoVersaoPro: false, telefone: t, email: e, userId: 0);
  }

  int get getId => id;
  String get getUsername => username;
  String get getSenha => senha;
  bool get getPagoVersaoPro => pagoVersaoPro;
  String get getTelefone => telefone;
  String get getEmail => email;
  int get getUserId => userId;

  static Future<List<Usuario>> CarregaUsuarios() async
  {
        try {
      var url = Uri.parse("http://localhost:8080/apiUsuarios/Usuarios");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> dados = jsonDecode(response.body);
           return dados.map((item){
            return Usuario(id: item["id"]
            , username: item["nome"]
            , senha: item["senha"]
            , pagoVersaoPro: item["pagoVersaoPro"]
            , telefone: item["telefone"],
             email: item["email"], userId: item["userId"]);
           }).toList();
       
      } else {
        throw Exception('Falha ao carregar dados da API: ${response.statusCode}');
      }
    } catch (e) {
      return [];
    }
  }
static Future<Map<String, dynamic>> deletarUsuarioComConfirmacao(
  BuildContext context, 
  int idUsuario,
  String nomeUsuario,
) async {

  final confirmacao = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Confirmar Exclusão'),
      content: Text('Tem certeza que deseja deletar o usuário "$nomeUsuario"? Esta ação não pode ser desfeita.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text('Deletar', style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );

  if (confirmacao != true) {
    return {
      'success': false,
      'message': 'Operação cancelada pelo usuário',
      'statusCode': 0
    };
  }

  try {
    final url = Uri.parse("http://localhost:8080/apiUsuarios/deletarUsuario/$idUsuario");
    
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return {
        'success': true,
        'message': 'Usuário "$nomeUsuario" deletado com sucesso.',
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
        'statusCode': response.statusCode,
        'body': response.body
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

 static Future<Map<String, dynamic>> mudarSenhaUsuarioValidado(int idUsuario, String novaSenha, String confirmacaoSenha) async {
  try {
    if (novaSenha.isEmpty) {
      return {
        'success': false,
        'message': 'Senha não pode estar vazia',
        'statusCode': 400
      };
    }

    if (novaSenha.length < 6) {
      return {
        'success': false,
        'message': 'Senha deve ter pelo menos 6 caracteres',
        'statusCode': 400
      };
    }

    if (novaSenha != confirmacaoSenha) {
      return {
        'success': false,
        'message': 'As senhas não coincidem',
        'statusCode': 400
      };
    }
    final senhaHash = novaSenha;

    final url = Uri.parse("http://localhost:8080/apiUsuarios/atualizarSenha/$idUsuario");
    
    final response = await http.put(
      url,
      headers: {'Content-Type': 'text/plain'},
      body: senhaHash,
    );

    if (response.statusCode == 200) {
      return {
        'success': true,
        'message': 'Senha atualizada com sucesso',
        'statusCode': 200
      };
    } else if (response.statusCode == 400) {
      return {
        'success': false, 
        'message': 'Senha inválida: ${response.body}',
        'statusCode': 400,
        'body': response.body
      };
    } else if (response.statusCode == 404) {
      return {
        'success': false,
        'message': 'Usuário não encontrado',
        'statusCode': 404
      };
    } else {
      return {
        'success': false,
        'message': 'Erro ao atualizar senha: ${response.statusCode}',
        'statusCode': response.statusCode,
        'body': response.body
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

 static Future<Map<String, dynamic>> criarConta({
    required String nome,
    required String email,
    required String senha,
    required String telefone,
  }) async {
    try {
      final url = Uri.parse("http://localhost:8080/apiUsuarios/cadastrarUsuario");
      
      final usuarioData = {
        'nome': nome,
        'email': email,
        'senha': senha, 
        'telefone': telefone,
        'pagoVersaoPro': false, 
      };

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(usuarioData),
      );

      if (response.statusCode == 200) {
        // Sucesso - conta criada
        final usuarioCriado = json.decode(response.body);
        return {
          'success': true,
          'message': 'Conta criada com sucesso!',
          'statusCode': 200,
          'usuario': usuarioCriado,
        };
      } else if (response.statusCode == 400) {
        // Email já cadastrado ou dados inválidos
        return {
          'success': false,
          'message': response.body.contains("já cadastrado") 
              ? 'Email já cadastrado!' 
              : 'Dados inválidos. Verifique as informações.',
          'statusCode': 400,
          'body': response.body,
        };
      } else {
        // Outro erro
        return {
          'success': false,
          'message': 'Erro ao criar conta: ${response.statusCode}',
          'statusCode': response.statusCode,
          'body': response.body,
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Erro de conexão: $e',
        'statusCode': 500,
      };
    }
  }

static Future<Map<String, dynamic>> mudarTelefoneUsuarioValidado(int idUsuario, String novoTelefone) async {
  try {
    if (novoTelefone.trim().isEmpty) {
      return {
        'success': false,
        'message': 'Telefone não pode estar vazio',
        'statusCode': 400
      };
    }

    final telefoneApenasNumeros = novoTelefone.replaceAll(RegExp(r'[^0-9]'), '');
    
    if (telefoneApenasNumeros.length < 10) {
      return {
        'success': false,
        'message': 'Telefone deve ter pelo menos 10 dígitos',
        'statusCode': 400
      };
    }

    if (telefoneApenasNumeros.length > 15) {
      return {
        'success': false,
        'message': 'Telefone muito longo',
        'statusCode': 400
      };
    }

    final url = Uri.parse("http://localhost:8080/apiUsuarios/atualizarTelefone/$idUsuario");
    
    final response = await http.put(
      url,
      headers: {'Content-Type': 'text/plain'},
      body: novoTelefone.trim(), 
    );

    if (response.statusCode == 200) {
      return {
        'success': true,
        'message': 'Telefone atualizado com sucesso',
        'statusCode': 200,
        'novoTelefone': novoTelefone.trim()
      };
    } else if (response.statusCode == 400) {
      return {
        'success': false, 
        'message': 'Telefone inválido: ${response.body}',
        'statusCode': 400,
        'body': response.body
      };
    } else if (response.statusCode == 404) {
      return {
        'success': false,
        'message': 'Usuário não encontrado',
        'statusCode': 404
      };
    } else {
      return {
        'success': false,
        'message': 'Erro ao atualizar telefone: ${response.statusCode}',
        'statusCode': response.statusCode,
        'body': response.body
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

static Future<Map<String, dynamic>> mudarNomeUsuarioValidado(int idUsuario, String novoNome) async {
  try {
    if (novoNome.trim().isEmpty) {
      return {
        'success': false,
        'message': 'Nome não pode estar vazio',
        'statusCode': 400
      };
    }

    if (novoNome.trim().length < 2) {
      return {
        'success': false,
        'message': 'Nome deve ter pelo menos 2 caracteres',
        'statusCode': 400
      };
    }

    final url = Uri.parse("http://localhost:8080/apiUsuarios/atualizarNome/$idUsuario");
    
    final response = await http.put(
      url,
      headers: {'Content-Type': 'text/plain'},
      body: novoNome.trim(), // Remove espaços em branco extras
    );

    if (response.statusCode == 200) {
      return {
        'success': true,
        'message': 'Nome atualizado com sucesso',
        'statusCode': 200,
        'novoNome': novoNome.trim()
      };
    } else if (response.statusCode == 400) {
      return {
        'success': false, 
        'message': 'Nome inválido: ${response.body}',
        'statusCode': 400,
        'body': response.body
      };
    } else if (response.statusCode == 404) {
      return {
        'success': false,
        'message': 'Usuário não encontrado',
        'statusCode': 404
      };
    } else {
      return {
        'success': false,
        'message': 'Erro ao atualizar nome: ${response.statusCode}',
        'statusCode': response.statusCode,
        'body': response.body
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

  static Future<Map<String, dynamic>> mudarEmailUsuario(int idUsuario, String novoEmail) async {
  try {
    final url = Uri.parse("http://localhost:8080/apiUsuarios/atualizarEmail/$idUsuario");
    
    final response = await http.put(
      url,
      headers: {'Content-Type': 'text/plain'}, 
      body: novoEmail,
    );

    if (response.statusCode == 200) {
      return {
        'success': true,
        'message': 'Email atualizado com sucesso',
        'statusCode': 200,
        'novoEmail': novoEmail
      };
    } else if (response.statusCode == 400) {
      return {
        'success': false, 
        'message': 'Email inválido ou já cadastrado',
        'statusCode': 400,
        'body': response.body
      };
    } else if (response.statusCode == 404) {
      return {
        'success': false,
        'message': 'Usuário não encontrado',
        'statusCode': 404
      };
    } else {
      return {
        'success': false,
        'message': 'Erro ao atualizar email: ${response.statusCode}',
        'statusCode': response.statusCode,
        'body': response.body
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

  static Future<Usuario> buscarPorIndice(int index) async {
    try {
      var url = Uri.parse("http://localhost:8080/apiUsuarios/Usuarios/$index");
      var response = await http.get(url);
      
      if (response.statusCode == 200) {
        dynamic dadosLista = jsonDecode(response.body);
       return Usuario(id: dadosLista["id"]
       , username: dadosLista["nome"]
       , senha: dadosLista["senha"]
       , pagoVersaoPro: dadosLista["pagoVersaoPro"],
        telefone: dadosLista["telefone"]
        , email: dadosLista["email"], 
        userId: dadosLista["userId"]);
      } else {
        throw Exception('Falha ao carregar dados da API: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar antibiótico: $e');
      return Usuario(id: 0
      , username: "",
       senha: "",
        pagoVersaoPro: false
        , telefone: "", 
        email: "",
         userId: 0);
    }
  }
  static Future<Usuario> buscarPorEmail(String email) async {
    try {
      var url = Uri.parse("http://localhost:8080/apiUsuarios/UsuarioEmail/$email");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        dynamic dados = jsonDecode(response.body);

        if (dados is List && dados.isNotEmpty) {
          var item = dados[0];
          return Usuario(
            id: item["id"],
            username: item["nome"],
            senha: item["senha"],
            pagoVersaoPro: item["pagoVersaoPro"],
            telefone: item["telefone"],
            email: item["email"],
            userId: item["userId"],
          );
        } else {
          throw Exception("Nenhum usuário encontrado para o email $email");
        }
      } else {
        throw Exception('Falha ao carregar dados da API: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar usuário por email: $e');
      return Usuario(
        id: 0,
        username: "",
        senha: "",
        pagoVersaoPro: false,
        telefone: "",
        email: "",
        userId: 0,
      );
    }
  }

}