import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocietyDetails extends StatefulWidget {
  const SocietyDetails({super.key});

  @override
  State<SocietyDetails> createState() {
    return _SocietyDetailsState();
  }
}

class _SocietyDetailsState extends State<SocietyDetails> {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          child: Expanded(
              child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 380,
                  padding: const EdgeInsets.only(right: 310),
                  alignment: Alignment.center,
                  child: IconButton(
                    alignment: Alignment.centerLeft,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/images/left-arrow-back-svgrepo-com.svg', // Path to your SVG asset
                      width: 40.0, // Set the width of the SVG icon
                      height: 40.0,
                      // Set the height of the SVG icon
                    ),
                    iconSize: 40.0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "SOCIETY DETAILS",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 350,
                  child: TextField(
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 60, 58, 58),
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter Society Name",
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      hintStyle: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 350,
                  child: TextField(
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 60, 58, 58),
                    ),
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(bottom: 80, left: 20, top: 10),
                      hintText: "Enter Society Address",
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      hintStyle: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 350,
                  child: TextField(
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 60, 58, 58),
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter City",
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      hintStyle: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 350,
                  child: TextField(
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 60, 58, 58),
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter State",
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      hintStyle: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 185, 28, 212),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                    ),
                    child: Text(
                      "SAVE",
                      style: GoogleFonts.inter(
                          fontSize: 40,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w900,
                          color: const Color.fromARGB(255, 214, 224, 228)),
                    ))
              ],
            ),
          )),
        ),
      ),
    );
  }
}
