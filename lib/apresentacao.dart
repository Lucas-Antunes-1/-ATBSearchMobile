import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dados.dart';

class Comeco extends StatefulWidget {
  const Comeco({super.key});
  @override
  State<Comeco> createState() => _ComecoState();
}

class _ComecoState extends State<Comeco> {
   final GlobalKey _k1 = GlobalKey();

  List<List<Object>> lis = Login.getLs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Login.getap, 
        elevation: 0,
               title: Row(
          children: [
            Image.asset(
              'assets/images/Logo.png', 
              height: 24,
            ),
            const SizedBox(width: 8),
            const Text(
              'ATBSearch',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),actions: [
        TextButton(
      onPressed: () {
        Scrollable.ensureVisible(
     _k1.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
      }, 
      child: Text(
        "Contato",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),SizedBox()]+
    List.generate(lis.length, (index)
    {
   return Row(children: [
     TextButton(
      onPressed: () { Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => lis[index][1] as Widget)
          );}, 
      child: Text(
        lis[index][0] as String,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    SizedBox() 
   ],);})
    +
    [SizedBox(height: 12,)],
        ),
      body:SingleChildScrollView(
        child: 
        Column(
          children: [
                      Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/antibioticos2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ATBSearch",
                      style: TextStyle(
                        fontSize: 42,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            ExpansionTile(
                              title: Text("Qual problema o sistema de saúde enfrenta?",style: TextStyle(fontSize: 16)),
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("O uso inadequado de antibióticos é um dos grandes desafios enfrentados pela saúde pública atual, contribuindo diretamente para o aumento da resistência microbiana e a redução da eficácia dos tratamentos. Pensando nisso, esta plataforma foi desenvolvida para oferecer suporte a profissionais da saúde, estudantes e pesquisadores na escolha racional e baseada em evidências de antimicrobianos. "
                                ,style: TextStyle(fontSize: 14)  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text("Como o ATBSearch pode ajudar?",style: TextStyle(fontSize: 16)),
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "O ATBSearch é uma plataforma que reune, de forma organizada e acessível, informações atualizadas sobre antibióticos disponíveis no mercado nacional, como sua classe farmacológica e espectro de ação de acordo com as carcaterísticas das bactérias alvo. A consulta é facilitada por um sistema de tabelas com filtros inteligentes, que permite selecionar os medicamentos com base em critérios como tipo e morfologia bacteriana, promovendo maior precisão terapêutica. \n\n A plataforma também foi planejada para ser acessível em diferentes contextos, oferecendo versões online e offline, com diferentes modalidades de uso — desde uma versão gratuita para fins acadêmicos até uma versão avançada voltada a instituições de saúde. \n\nAo integrar tecnologia da informação com fundamentos de farmacologia e gestão em saúde, esta ferramenta busca contribuir diretamente para o enfrentamento da resistência antimicrobiana e para a melhoria da segurança do paciente. ",
                                style: TextStyle(fontSize: 14), ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

Text("Entenda os Filtros",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
Container(padding: EdgeInsets.all(20),child: Text("As imagens abaixam mostram o que significam os filtros (classes de ATB, morfologias e Gram)",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
)
,
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
              ),
              items: [
                Image.asset("assets/images/carousel1.png",height: 300,),
              Image.asset("assets/images/carousel2.png",height: 300,),
              Image.asset("assets/images/carousel3.png",height: 300,),

              ]
            ),


            const SizedBox(height: 40),
            const Divider(thickness: 1.5),
            const SizedBox(height: 20),

            const Text(
              "Quem Somos",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Somos um grupo de estudantes do Cotil que criou essa ferramenta de pesquisa para auxiliar médicos que querem buscar antibióticos com mais precisão.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 30),
            
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildIntegranteCard(
                    nome: "Arthur Buzas Baccan\nLíder do projeto\nResponsável pelo Desktop",
                    cor: Colors.green,
                    imagem: "assets/images/Arthur.jpeg",
                    textoBranco: true,
                  ),
                  const SizedBox(width: 20),
                  _buildIntegranteCard(
                    nome: "Lucas Antunes Soares\nResponsável pelo App Mobile",
                    cor: Color.fromRGBO(0, 129, 153, 1),
                    imagem: "assets/images/Antunes.jpeg",
                    textoBranco: true,
                  ),
                  const SizedBox(width: 20),
                  _buildIntegranteCard(
                    nome: "Natan Fontana\nResponsável pelo Site - Web",
                    cor: Color.fromRGBO(54, 138, 153, 1),
                    imagem: "assets/images/Natan.jpeg",
                    textoBranco: true,
                  ),
                ],
              ),
            ),

        SizedBox(height: 40),

    Container(key: _k1,
      width: double.infinity,
      color: Color.fromRGBO(0, 43, 63,1),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Contato dos Desenvolvedores:",style: TextStyle(color: Colors.white),),SizedBox(height: 8,),
          Text("Arthur:cl203249@g.unicamp.br",style: TextStyle(color: Colors.white)),
          Text("Lucas:cl203249@g.unicamp.br",style: TextStyle(color: Colors.white)),
          Text("Natan:cl203219@g.unicamp.br",style: TextStyle(color: Colors.white)),SizedBox(height: 8,)
          ,Text(
            '© 2025 ATBSearch',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(118, 118, 118, 1),
            ),
          ),
        ],
      ),
    ),
      ],),) 
    );
  }
  Widget _buildIntegranteCard({
    required String nome,
    required Color cor,
    required String imagem,
    bool textoBranco = false,
  }) {
    return Container(
      width: 160,
      height: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: cor.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagem),
            radius: 35,
          ),
          const SizedBox(height: 12),
          Text(
            nome,
            style: TextStyle(
              fontSize: 14,
              color: textoBranco ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
      
        ],
      ),
    );

  }
}