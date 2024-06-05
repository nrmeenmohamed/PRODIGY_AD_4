import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/modules/names_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,  this.oName,  this.xName});

  final String? oName;
  final String? xName;


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List <String> displayXOrO = ['', '', '', '', '', '', '', '', ''];
  bool isTurnO = true;
  int oScore = 0;
  int xScore = 0;
  int filledBox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                    children: [
                        Text(
                          widget.oName != "" ? widget.oName! : 'Player O',
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          oScore.toString(),
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.white,
                          ),
                        ),
        
                      ],
                    ),
                    SizedBox(width: 80.w,),
                    Column(
                      children: [
                        Text(
                          widget.xName != "" ? widget.xName! : 'Player X',
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          xScore.toString(),
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.white,
                          ),
                        ),
        
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.w,
                      crossAxisSpacing: 10.h,
                    ),
                  itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: InkWell(
                          onTap: (){
                            onTap(index);
                          },
                          splashColor: Colors.cyan,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                                Text(
                                  displayXOrO[index],
                                  style: TextStyle(
                                    color: displayXOrO[index] == 'O' ? Colors.white : Colors.teal ,
                                    fontSize: 40.sp,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                  },
                  itemCount: 9,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textButton(
                      text: 'Refresh',
                      onPressed: (){
                        clearBoard();
                      },
                  ),
                  textButton(
                    text: 'Change names',
                    onPressed: (){
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(
                          builder: (context) =>const NamesScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  void onTap(int index){
    setState(() {
      if(isTurnO && displayXOrO[index] == '') {
        displayXOrO [index]= 'O';
        filledBox ++;
      }
      else if(!isTurnO && displayXOrO[index] == ''){
        displayXOrO [index]= 'X';
        filledBox++;
      }
      checkWinner();
      isTurnO =! isTurnO;
    });
  }

  void checkWinner(){
    if(displayXOrO[0] == displayXOrO[1] &&
        displayXOrO[0] == displayXOrO[2] &&
        displayXOrO[0] !=''){
      showWinDialog(displayXOrO[0]);
    }
    if(displayXOrO[3] == displayXOrO[4] &&
        displayXOrO[3] == displayXOrO[5] &&
        displayXOrO[3] !=''){
      showWinDialog(displayXOrO[3]);
    }
    if(displayXOrO[6] == displayXOrO[7] &&
        displayXOrO[6] == displayXOrO[8] &&
        displayXOrO[6] !=''){
      showWinDialog(displayXOrO[6]);
    }
    if(displayXOrO[0] == displayXOrO[3] &&
        displayXOrO[0] == displayXOrO[6] &&
        displayXOrO[0] !=''){
      showWinDialog(displayXOrO[0]);
    }
    if(displayXOrO[1] == displayXOrO[4] &&
        displayXOrO[1] == displayXOrO[7] &&
        displayXOrO[1] !=''){
      showWinDialog(displayXOrO[1]);
    }
    if(displayXOrO[2] == displayXOrO[5] &&
        displayXOrO[2] == displayXOrO[8] &&
        displayXOrO[2] !=''){
      showWinDialog(displayXOrO[2]);
    }
    if(displayXOrO[0] == displayXOrO[4] &&
        displayXOrO[0] == displayXOrO[8] &&
        displayXOrO[0] !=''){
      showWinDialog(displayXOrO[0]);
    }
    if(displayXOrO[2] == displayXOrO[4] &&
        displayXOrO[2] == displayXOrO[6] &&
        displayXOrO[2] !=''){
      showWinDialog(displayXOrO[2]);
    }
    else if(filledBox == 9){
      showDrawDialog();
    }

  }

  void showWinDialog(String winner){
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context)=> AlertDialog(
          title: Text(
            textAlign: TextAlign.center,
              'Winner is ${winner == 'O' ? widget.oName : widget.xName} ☺',
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
          actions: [

            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  clearBoard();
                },
                child: const Text(
                  'Play Again',
                  style: TextStyle(
                    color: Colors.cyan,
                  ),
                ),
            ),
          ],
          shadowColor: Colors.cyan,
        ),
    );
    if(winner == 'O'){
      oScore++;
    }
    else{
      xScore++;
    }

  }

  void showDrawDialog(){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context)=> AlertDialog(
        title: Text(
          textAlign: TextAlign.center,
          'Draw',
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop();
              clearBoard();
            },
            child: const Text(
              'Play Again',
              style: TextStyle(
                color: Colors.cyan,
              ),
            ),
          ),
        ],
        shadowColor: Colors.cyan,
      ),
    );

  }


  void clearBoard(){
    for(int i=0; i<9; i++){
      setState(() {
        displayXOrO[i] = '';
      });
    }
    filledBox = 0;
    isTurnO = true;
  }

  Widget textButton({
    required String text,
    required Function onPressed,
}) => TextButton(
    onPressed: (){
      onPressed();
    },
    child: Text(
      text,
      style: TextStyle(
        color: Colors.cyan,
        fontSize: 20.sp,
      ),
    ),
  );
}
