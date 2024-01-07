import 'package:care_to_day/View/homepage.dart';
import 'package:care_to_day/View/navigationbar.dart';
import 'package:care_to_day/View/test.dart';
import 'package:care_to_day/View/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() => _isLoading = true);
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeNavi(useremail: _emailController.text, tabIndexes: 0,)
          // RegisteredVehiclesView
          // builder: (context) => PatrolScheduleScreen(),
        ));
      } on FirebaseAuthException catch (e) {
        setState(() {
          _errorMessage = e.message ?? 'Login failed';
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.network(
              "https://i.pinimg.com/564x/3f/91/5e/3f915edf8313177338f4fb25bc065cc8.jpg",
              width: MediaQuery.of(context).size.width,
              height: 365,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 170,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 74,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(42),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const Text(
                        "let’s login and browse",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.36,
                          color: Color(0xcebdbdbd),
                        ),
                      ),
                      const SizedBox(height: 55),
                      const Text(
                        "Welcome Back !",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff111111),
                        ),
                      ),
                      const SizedBox(height: 31),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email :",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff292828),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Email",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 41),
                            const Text(
                              "Password :\n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff303030),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Password",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 45),
                            Center(
                              child: SizedBox(
                                width: 224,
                                height: 43,
                                child: ElevatedButton(
                                  onPressed: _handleLogin,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffddc5ad),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
      
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account? "),

                                TextButton(
                                  onPressed: (){
                                    Navigator.push(context, 
                                      MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                  },
                                  child: Text("Sign Up Now")
                                ),
                              ],
                            ),

                           
      
                            if (_isLoading)
                              const CircularProgressIndicator(),
      
                            if (_errorMessage.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _errorMessage,
                                  style: const TextStyle(
                                      color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}