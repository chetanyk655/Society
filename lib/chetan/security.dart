import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Security extends StatefulWidget {
  const Security({super.key});
  @override
  State<Security> createState() {
    return _SecurityState();
  }
}

class _SecurityState extends State<Security> {
  var keyboardSpace = 0.0;
  Widget? keyboard;
  var mxheight = 0.0;

  @override
  void initState() {
    keyboard = Container();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Security';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appTitle,
          style: GoogleFonts.nunito(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 3,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/security.png"), fit: BoxFit.fill),
        ),
        child: Expanded(
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  onTap: () {},
                  cursorHeight: 26,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter Name of Guest",
                      fillColor: Colors.red,
                      hintStyle: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  cursorHeight: 26,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter Flat No",
                      labelStyle: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w800),
                      hintStyle: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  cursorHeight: 26,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter Time Slot",
                      hintStyle: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 120, 254),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                child: Text("Submit",
                    style: (GoogleFonts.notoSansDeseret(
                        fontSize: 38,
                        fontWeight: FontWeight.w800,
                        color: Colors.white))),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
