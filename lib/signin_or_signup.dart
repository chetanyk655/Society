import 'package:flutter/material.dart';

class SigninOrSignup extends StatelessWidget {
  const SigninOrSignup({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset('assets/images/login_gif.gif'),
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black
                  ),
                    onPressed: (){},
                    child: const Text('Login In',style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black
                  ),
                    onPressed: (){},
                    child: const Text('Sign Up',style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
