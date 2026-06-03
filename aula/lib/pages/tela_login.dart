import 'package:aula/pages/tela_revisao.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController emailController =
      TextEditingController(); //Controla o campo de email
  final TextEditingController senhaController =
      TextEditingController(); //Controla o campo de senha

  String mensagemErro =
      ''; //Guarda a mensagem de erro que pode aparecer na tela

  bool emailValido(String email) {
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return regex.hasMatch(email);
  }

  //r'^[\w\.-] o Texto antes do @
  //+@ o simbolo
  //[\w\.-] o texto depois do @
  //\.\w+$ .com

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Tela de Login',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Digite seu email e senha para acessar o app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                //campo para o usuario
                controller: emailController, //liga o campo controlador
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email', //texto principal do campo
                  hintText: 'Digite seu email', //dica dentro do campo
                  border: OutlineInputBorder(), //cria borda do campo
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                //campo para o usuario
                controller: senhaController, //liga o campo controlador
                obscureText:
                    true, //faz o texto ficar escondido - vira as bolinhas
                decoration: const InputDecoration(
                  labelText: 'Senha', //texto principal do campo
                  hintText: 'Digite sua senha', //dica dentro do campo
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                mensagemErro, //string que declaramos na linha la de cima
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  String email = emailController.text; //pega o email digitado
                  String senha = senhaController.text; //pega a senha digitada

                  if (!emailValido(email)) { //o email valido esta com a tabela regex que esta dando as caracteristicas para ver se tem @, .com e etc
                    setState(() {
                      mensagemErro = 'Digite um email valido';
                    });
                  } else if (senha.isEmpty) {
                    //se a senha estiver vazia entra nesse if - empty, vazio
                    setState(() {
                      mensagemErro = 'Digite sua senha';
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaRevisao(),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.login),
                label: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
