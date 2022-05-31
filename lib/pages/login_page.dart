import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedRegister;
  const LoginPage({Key? key, required this.onClickedRegister}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/background.jpeg"),
            fit: BoxFit.cover,
          )),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(35, 35, 35, 20
            ),
            shrinkWrap: true,
            children: [
              const Text("Welcome\nBack",
                  style:
                      TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              const SizedBox(height: 80.0),
              TextField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    labelText: "Email", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: passwordController,
                textInputAction: TextInputAction.go,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Password", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 250),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Facebook",
                          style: TextStyle(color: Colors.black54)),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.4)
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Google",
                          style: TextStyle(color: Colors.black54)),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.4)
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: signIn,
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text("Login",style: TextStyle(letterSpacing: 2,color: Colors.white70)),
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(text: ' Sign up',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 18),
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedRegister
                        )
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
