import 'package:first_app/admin/admin_dashboard.dart';
import 'package:first_app/admin/signin_or_signup.dart';
import 'package:first_app/services/api.dart';
import 'package:flutter/material.dart';

class MemberRegister extends StatefulWidget {
  const MemberRegister({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MemberRegisterState();
  }
}

class _MemberRegisterState extends State<MemberRegister> {
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  final TextEditingController name = TextEditingController();
  final TextEditingController houseNo = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Sign Up',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Create Member Account',
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
                controller: name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter Your Name',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                style: const TextStyle(color: Colors.white, fontSize: 16),
                controller: houseNo,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter House No.',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const SizedBox(
                height: 20,
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
                      if (name.text != "" &&
                          houseNo.text != "" &&
                          email.text != "" &&
                          password.text != "") {
                        Api().registration({
                          "name": name.text,
                          "email": email.text,
                          "password": password.text,
                          "isAdmin": false,
                          "house_no": houseNo.text
                        }).then((res) => {
                              if (res == true)
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AdminDashboard()))
                                }
                            });
                      }
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
