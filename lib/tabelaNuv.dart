import 'package:flutter/material.dart';
import 'package:flutter_application_1/apresentacao.dart';
import 'package:flutter_application_1/dados.dart';
import 'package:flutter_application_1/tela1.dart';
import 'package:flutter_application_1/tela2.dart';
import 'package:flutter_application_1/tabela.dart'; 


void main() => runApp(const TabelaNuv());

class TabelaNuv extends StatelessWidget {
  const TabelaNuv({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ATBSearch',
      theme: ThemeData(
        primaryColor: const Color(0xFF006699),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF006699),
          secondary: Colors.blueAccent,
        ),
        scaffoldBackgroundColor: const Color(0xFFE5E5E5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF006699),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      home: const AntibioticScreen(),
    );
  }
}

class Antibiotic {
  final int id;
  final String name;
  final String type;
  final bool gramPositive;
  final bool gramNegative;
  final String morphology;

  Antibiotic({
    required this.id,
    required this.name,
    required this.type,
    required this.gramPositive,
    required this.gramNegative,
    required this.morphology,
  });
}

class AntibioticScreen extends StatefulWidget {
  const AntibioticScreen({super.key});

  @override
  State<AntibioticScreen> createState() => _AntibioticScreenState();
}

class _AntibioticScreenState extends State<AntibioticScreen> {
  final List<Antibiotic> antibiotics = [
    Antibiotic(id: 1, name: "Azitromicina", type: "Macrolídeos", gramPositive: true, gramNegative: true, morphology: "Bacilos"),
    Antibiotic(id: 2, name: "Claritromicina", type: "Macrolídeos", gramPositive: true, gramNegative: true, morphology: "Bacilos"),
    Antibiotic(id: 3, name: "Oxacilinas", type: "Penicilinas", gramPositive: true, gramNegative: false, morphology: "Cocos"),
    Antibiotic(id: 4, name: "Ampicilina", type: "Penicilinas", gramPositive: true, gramNegative: true, morphology: "Cocos e Bacilos"),
    Antibiotic(id: 5
    , name: "Amoxicilina"
    , type: "Penícilinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 6
    , name: "Ampicilina + Sulbactam"
    , type: "Penícilinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
        Antibiotic(id: 7
    , name: "Amoxicilina+Clavulanato"
    , type: "Penícilinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
            Antibiotic(id: 8
    , name: "Penicilina g Benzatina"
    , type: "Penícilinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
                Antibiotic(id: 9
    , name: "Penicilina g Cristalina"
    , type: "Penícilinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
     Antibiotic(id: 10
    , name: "Penicilina g Procaína + Potássica"
    , type: "Penícilinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 11
    , name: "Piperacilina + Tazobactam"
    , type: "Penícilinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 12
    , name: "Cefalotina"
    , type: "Cefalosporinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
     Antibiotic(id: 13
    , name: "Cefazolina"
    , type: "Cefalosporinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 14
    , name: "Cefoxitina"
    , type: "Cefalosporinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 15
    , name: "Cefuroxima"
    , type: "Cefalosporinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
        Antibiotic(id: 16
    , name: "Cefotaxima"
    , type: "Cefalosporinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 17
    , name: "Ceftazidima"
    , type: "Cefalosporinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 18
    , name: "Ceftriaxona"
    , type: "Cefalosporinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 19
    , name: "Cefepima"
    , type: "Cefalosporinas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 20
    , name: "Eertapenem"
    , type: "Carbapenêmicos"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 21
    , name: "Imipenem-cilastatina"
    , type: "Carbapenêmicos"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 22
    , name: "Meropenem"
    , type: "Carbapenêmicos"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 23
    , name: "Amicacina"
    , type: "Aminoglicosídeos"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 24
    , name: "Gentamicina"
    , type: "Aminoglicosídeos"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 25
    , name: "Neomicina + Bacitracina"
    , type: "Aminoglicosídeos"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 26
    , name: "Ciprofloxacina"
    , type: "Quinolonas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Bacilos"),
    Antibiotic(id: 27
    , name: "Levofloxacina"
    , type: "Quinolonas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 28
    , name: "Norfloxacina"
    , type: "Quinolonas"
    , gramPositive: false
    , gramNegative: true
    , morphology: "Bacilos"),
    Antibiotic(id: 29
    , name: "Cloranfenicol"
    , type: "Anfenicóis"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 30
    , name: "Sulfadiazina"
    , type: "Sulfonamidas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 31
    , name: "Sulfametoxazol-trimetoprima"
    , type: "Sulfonamidas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 32
    , name: "Teicoplanina"
    , type: "Glicopeptídeos"
    , gramPositive: true
    , gramNegative: false
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 33
    , name: "Vancomicina"
    , type: "Glicopeptídeos"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 34
    , name: "Metronidazol"
    , type: "Nitroimidazólicos"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 35
    , name: "Clindamicina"
    , type: "Licosamidas"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 36
    , name: "Polimixina B"
    , type: "Polimixinas"
    , gramPositive: false
    , gramNegative: true
    , morphology: "Bacilos"),
    Antibiotic(id: 37
    , name: "Linezolida"
    , type: "Oxazolidinona"
    , gramPositive: true
    , gramNegative: false
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 38
    , name: "Tigeciclina"
    , type: "Glicilciclina"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Cocos e Bacilos"),
    Antibiotic(id: 39
    , name: "Rifampicina"
    , type: "Antituberculosos"
    , gramPositive: true
    , gramNegative: true
    , morphology: "Bacilos"),
    Antibiotic(id: 40
    , name: "Isoniazida"
    , type: "Antituberculosos"
    , gramPositive: true
    , gramNegative: false
    , morphology: "Bacilos"),
    Antibiotic(id: 41
    , name: "Pirazinamida"
    , type: "Antituberculosos"
    , gramPositive: true
    , gramNegative: false
    , morphology: "Bacilos"),
    Antibiotic(id: 42
    , name: "Etambutol"
    , type: "Antituberculosos"
    , gramPositive: true
    , gramNegative: false
    , morphology: "Bacilos"),
    
  ];

  final List<String> antibioticTypes = ["Macrolídeos", "Penicilinas","Cefalosporinas","Carbapenêmicos","Aminoglicosídeos","Quinolonas","Anfenicóis","Sulfonamidas","Glicopeptídeos","Nitroimidazólicos","Licosamidas","Polimixinas","Oxazolidinona","Gligilciclina","Antituberculosos"];
  final List<String> morphologyOptions = ["Cocos", "Bacilos", "Cocos e Bacilos"];

  String nameFilter = '';
  String? typeFilter;
  bool? gramPositiveFilter;
  bool? gramNegativeFilter;
  String? morphologyFilter;

  List<Antibiotic> get filteredAntibiotics => antibiotics.where((a) {
        return a.name.toLowerCase().contains(nameFilter.toLowerCase()) &&
            (typeFilter == null || a.type == typeFilter) &&
            (gramPositiveFilter == null || a.gramPositive == gramPositiveFilter) &&
            (gramNegativeFilter == null || a.gramNegative == gramNegativeFilter) &&
            (morphologyFilter == null || a.morphology == morphologyFilter);
      }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filtrar Antibióticos'),backgroundColor: Login.getap,),
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
            )   ,
               body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildFilters(),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: 
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:  DataTable(
                    columns: const [
                      DataColumn(label: Text('Nome', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Tipo', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Ataca Gram +', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Ataca Gram -', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Morfologia', style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: filteredAntibiotics.map((a) {
                      return DataRow(cells: [
                        DataCell(Text(a.name)),
                        DataCell(Text(a.type)),
                        DataCell(Text(a.gramPositive ? "Sim" : "Não")),
                        DataCell(Text(a.gramNegative ? "Sim" : "Não")),
                        DataCell(Text(a.morphology)),
                      ]);
                    }).toList(),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Filtrar por Nome',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) => setState(() => nameFilter = value),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: typeFilter,
                decoration: const InputDecoration(labelText: 'Tipo de Antibiótico'),
                items: [
                  const DropdownMenuItem(value: null, child: Text('Todos os Tipos')),
                  ...antibioticTypes.map((t) => DropdownMenuItem(value: t, child: Text(t))),
                ],
                onChanged: (value) => setState(() => typeFilter = value),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: morphologyFilter,
                decoration: const InputDecoration(labelText: 'Morfologia'),
                items: [
                  const DropdownMenuItem(value: null, child: Text('Todas')),
                  ...morphologyOptions.map((m) => DropdownMenuItem(value: m, child: Text(m))),
                ],
                onChanged: (value) => setState(() => morphologyFilter = value),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<bool>(
                value: gramPositiveFilter,
                decoration: const InputDecoration(labelText: 'Gram +'),
                items: const [
                  DropdownMenuItem(value: null, child: Text('Todos')),
                  DropdownMenuItem(value: true, child: Text('Sim')),
                  DropdownMenuItem(value: false, child: Text('Não')),
                ],
                onChanged: (value) => setState(() => gramPositiveFilter = value),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: DropdownButtonFormField<bool>(
                value: gramNegativeFilter,
                decoration: const InputDecoration(labelText: 'Gram -'),
                items: const [
                  DropdownMenuItem(value: null, child: Text('Todos')),
                  DropdownMenuItem(value: true, child: Text('Sim')),
                  DropdownMenuItem(value: false, child: Text('Não')),
                ],
                onChanged: (value) => setState(() => gramNegativeFilter = value),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
