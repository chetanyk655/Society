import 'package:first_app/member/dashboard_final.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';
import 'package:first_app/member/current_signed.dart';

class MemberLogin extends StatefulWidget {
  const MemberLogin({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MemberLoginState();
  }
}

class _MemberLoginState extends State<MemberLogin> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Login',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 29, 28, 28),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 29, 28, 28),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Login to your Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  controller: email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  controller: password,
                  obscureText:
                      !_passwordVisible, //This will obscure text dynamically
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter your password',
                    hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                        Api().checklogin({
                          "email": email.text,
                          "password": password.text,
                          "isAdmin": false
                        }).then((res) => {
                              if (res)
                                {
                                  CurrentSigned.signedEmail = email.text,
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DashBoardFinal()))
                                }
                            });
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
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
