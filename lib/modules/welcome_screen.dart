import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/modules/names_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Tic Tac Toe',
                  style: GoogleFonts.pressStart2p(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,

                    )
                  ),
                ),
                const Spacer(),
                AvatarGlow(
                  child: Image.asset(
                    'assets/images/back_image.png',
                    height: MediaQuery.of(context).size.height/4,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context)=> const NamesScreen(),
                          ),
                      );
                    },
                    child: Text(
                      'Play Game',
                      style: GoogleFonts.pressStart2p(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,

                          )
                      ),
                    ),
                ),
                const Spacer(),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
