import 'package:flutter/material.dart';
import 'package:flutter_application_1/BackEnd.dart';
import 'package:flutter_application_1/dados.dart';
import 'package:flutter_application_1/nuvem.dart';
import 'package:flutter_application_1/tabela.dart';

void main() => runApp(const TabelaP());

class TabelaP extends StatelessWidget {
  const TabelaP({super.key});

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


class AntibioticScreen extends StatefulWidget {
  const AntibioticScreen({super.key});

  @override
  State<AntibioticScreen> createState() => _AntibioticScreenState();
}

class _AntibioticScreenState extends State<AntibioticScreen> {
    List<Antibiotic> m=[];
    List<Antibiotic> antibiotics = Login.getAnti;




  final List<String> antibioticTypes = ["Macrolídeos", "Penicilinas","Cefalosporinas","Carbapenêmicos","Aminoglicosídeos","Quinolonas","Anfenicóis","Sulfonamidas","Glicopeptídeos","Nitroimidazólicos","Licosamidas","Polimixinas","Oxazolidinona","Gligilciclina","Antituberculosos"];
  final List<String> morphologyOptions = ["Cocos", "Bacilos", "Cocos e Bacilos"];

  String nameFilter = '';
  String? typeFilter;
  bool? gramPositiveFilter;
  bool? gramNegativeFilter;
  String? morphologyFilter;
  TextEditingController c1=TextEditingController();

  List<Antibiotic> get filteredAntibiotics => antibiotics.where((a) {
        return (a.name.toLowerCase().contains(nameFilter.toLowerCase())&&!(excluido.contains(a))) &&
            (typeFilter == null || a.type == typeFilter) &&
            (gramPositiveFilter == null || a.gramPositive == gramPositiveFilter) &&
            (gramNegativeFilter == null || a.gramNegative == gramNegativeFilter) &&
            (morphologyFilter == null || a.morphology == morphologyFilter);
      }).toList();


      List<Antibiotic> excluido=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filtrar Antibióticos',style: TextStyle(color: Colors.white),),backgroundColor: Login.getap,actions: [
        IconButton(onPressed: () {
          showDialog<String>(context: context, 
          builder: (BuildContext context)=>
            AlertDialog(
              content: Text("                                Deseja criar nova tabela?"),
            actions: <Widget>[
              SizedBox(height: 30,),
              ElevatedButton(onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Tabela()));
              }, child: Text("Descartar")),
              ElevatedButton(onPressed:   () => Navigator.pop(context), child: Text("Continuar editando")),
              ElevatedButton(onPressed: () async {
                List<int> b=[];

                if(c1.text.isNotEmpty&&!(Login.getMapTabelas).containsKey(c1.text)){  
                   b = filteredAntibiotics.map((a) => a.id).toList();
                await TabelaBackEnd.criarTabelaPersonalizada(idUsuario: Login.getatual.getId, nomeTabela: c1.text, idsAntibioticos: b);
                await Login.carregarUsuario();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Nuvem()));
              }
              else{
                Navigator.pop(context);
                showDialog<String>(context: context, builder: 
                (BuildContext context)=>
                AlertDialog(content: Text("Nome de tabela já em uso"),
                actions: [ElevatedButton(onPressed:  () => Navigator.pop(context), child: Text("OK"))],));
              }
              
              
              },
              
               child: Text("Finalizar")),
            ],
          )
          );      
        }, icon: Icon(Icons.done,),color: Colors.green,)],),
               body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: c1,decoration: InputDecoration(labelText: "Nome da sua tabela:" ),),        const SizedBox(height: 12),

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
                      DataColumn(label: Text("")),
                      DataColumn(label: Text('Nome', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Tipo', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Ataca Gram +', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Ataca Gram -', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Morfologia', style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: filteredAntibiotics.map((a) {
                      return DataRow(cells: [
                        DataCell(IconButton(onPressed:  () {
                         excluido.add(a);
                          setState(() {
                            
                          });
                        }, icon: Icon(Icons.delete))),
                        DataCell(Text(a.name)),
                        DataCell(Text(a.type)),
                        DataCell(Text(a.gramPositive ? "Sim" : "Não")),
                        DataCell(Text(a.gramNegative ? "Sim" : "Não")),
                        DataCell(Text(a.morphology)),
                      ]);
                    }).toList()+excluido.map((a){
                      return DataRow(cells: [
                        DataCell(IconButton(onPressed:  () {
                         excluido.remove(a);

                          setState(() {
                            
                          });
                        }, icon: Icon(Icons.add))),
                        DataCell(Text(a.name)),
                        DataCell(Text(a.type)),
                        DataCell(Text(a.gramPositive ? "Sim" : "Não")),
                        DataCell(Text(a.gramNegative ? "Sim" : "Não")),
                        DataCell(Text(a.morphology)),
                      ]);
                    }).toList()
      ,
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
