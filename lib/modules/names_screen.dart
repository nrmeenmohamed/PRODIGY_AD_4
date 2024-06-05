import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/modules/home_screen.dart';

class NamesScreen extends StatefulWidget {
  const NamesScreen({super.key});

  @override
  State<NamesScreen> createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> {

  TextEditingController playerO = TextEditingController();
  TextEditingController playerX = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Player O',
                        style: GoogleFonts.pressStart2p(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          )
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      textField(
                          controller: playerO,
                          hintText: 'O Name',
                      ),
                    ],
                  ),
                  Container(
                    width: 2,
                    height: MediaQuery.of(context).size.height/3,
                    color: Colors.cyan,
                  ),
                  Column(
                    children: [
                      Text(
                        'Player X',
                        style: GoogleFonts.pressStart2p(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                            )
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      textField(
                          controller: playerX,
                          hintText: 'X Name',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50.h,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(
                      builder: (context)=> HomeScreen(
                        oName: playerO.text,
                        xName: playerX.text,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Play ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pressStart2p(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                            .sp,

                      )
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget textField({
    required TextEditingController controller,
    required String hintText,
})=> SizedBox(
    width: MediaQuery.of(context).size.width/3,
    child: TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.cyan,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyan,
          ),
        ),
        border: const OutlineInputBorder(),
      ),
    ),
);
}
