import 'package:flutter/material.dart';
import 'package:myapp/views/tela_conversao.dart';
import 'package:myapp/views/tela_cadastro.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Chave para validação

  void _fazerAutenticacao() async {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          // 5. Envolvendo a UI em um Form para validação
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(45.0),
                  child: Text(
                    'Faça seu Login!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 27, 48, 141),
                    ),
                  ),
                ),

                TextFormField(
                  // Alterado para TextFormField para validação
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 226, 135, 0),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16.0),

                TextFormField(
                  // Alterado para TextFormField para validação
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 226, 135, 0),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40.0),

                ElevatedButton(
                  onPressed: _fazerAutenticacao,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('ENTRAR'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaConversao()),
                    );
                  },
                  
                  
                  child: const Text(
                    "Não possui conta? Faça seu cadastro.",
                    
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 33, 150),
                      fontSize: 17.0,
                      decoration: TextDecoration.underline,
                      
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