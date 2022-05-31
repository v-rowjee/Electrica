import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onClickedLogin;
  const RegisterPage({Key? key, required this.onClickedLogin}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
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
              const Text("Register\nNow",
                  style:
                  TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              const SizedBox(height: 80.0),
              TextField(
                controller: usernameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    labelText: "Username", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 30.0),
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
              const SizedBox(height: 150),
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
                onPressed: signUp,
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text("Sign Up",style: TextStyle(letterSpacing: 2,color: Colors.white70)),
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Already have an account?',
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(text: ' Sign in',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 18),
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedLogin
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

  Future signUp() async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
