import 'package:flutter/material.dart';
import 'tela_detalhes.dart';

//tem que criar uma classe pai para depois chamar a classe filho e colocar as coisas nela para mexer
//classe pai
class TelaRevisao extends StatefulWidget {//stateful ela pode mudar de estado
  const TelaRevisao({super.key});

  @override
  State<TelaRevisao> createState() =>
      _TelaRevisaoState(); //onde fica os dados que podem mudar
}

//classe filho
class _TelaRevisaoState extends State<TelaRevisao> {//classe que vai mudar de estado
  String mensagem = 'Clique em uma opcao';

  @override
  Widget build(BuildContext context) {
    return Scaffold(//scaffold é o corpo da aplicacao, tudo que ta na tela
      appBar: AppBar(//app bar é o cabeçalho
        title: const Text(
            'Revisao Flutter'), // const é uma "regra", um padrao do flutter
      ),

      body: SafeArea(//protege o conteudo das areas, para nao estravazar os cantos da tela
        child: Padding(//child e childrem sao obrigatorios em quase todas as classes
          padding: const EdgeInsets.all(20),
          child: Column(// organiza os widgets - (child que só suporta um componente só mas com a coluna pode ser usada mais de uma)
            mainAxisAlignment: MainAxisAlignment
                .center, //centraliza (mesma coisa que o center mas dentro de uma coluna)
            children: [
              const Icon(//utiliza icones da biblioteca do google
                Icons.phone_android,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 100), //espaço entre os componentes
              const Text(
                'Revisao de flutter',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Vamos revisar widgets, layout, estilo, botoes, estado e navegacao',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),

              Container(//container é uma separacao da sua pagina em quadrados
                width: 320,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'O container funciona como uma caixa',
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),
              Text(
                mensagem,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              Row(//organiza os componentes em uma linha
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(//botao
                    onPressed: () {
                      setState(() {//mudar o estado do texto atual
                        mensagem = 'Voce clicou no botao azul';
                      });
                    },
                    child: const Text('Azul'),
                  ),
                  ElevatedButton(// um botao normal
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      elevation: 4,
                    ),
                    onPressed: () {
                      setState(() {
                        mensagem = 'Voce clicou no botao destaque';
                      });
                    },
                    child: const Text('Destaque'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(//botao com um icone
                onPressed: () {
                  Navigator.push(
                    context, //indica onde estamos no app
                    MaterialPageRoute( //cria rota para nova tela
                      builder: (context) => const TelaDetalhes(), //builder informa qual sera a tela aberta
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward), //icone junto com o bota
                label: const Text('Ir para detalhes'), //texto do botao
              ),
            ],
          ),
        ),
      ),

      //   body: const Center(//centraliza o conteudo dentro dele, center nao aguenta children
      //     child: Text('Conteudo da tela'), //child só aceita um parametro só(um widget), children(aceita varios paramentros - widgets) mas serve para dois widgets coluna e lina(row e column)
      //   ),

      floatingActionButton: FloatingActionButton(//botao flutuante, ele fica no canto da tela como um padrao
        onPressed: () {//a funcao que o botao faz
          setState(() {
            mensagem = 'Voce clicou no botao';
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
