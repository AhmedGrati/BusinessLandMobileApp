import 'package:businessland_app/screens/auth_screen/components/custom_auth_button.dart';
import 'package:businessland_app/state_management_blocks/mode_block.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class GamePage extends StatelessWidget {
  final Color secondaryColor , cardColor , primaryColor;
  GamePage({this.secondaryColor , this.cardColor , this.primaryColor});
  @override
  Widget build(BuildContext context) {
    return Consumer<ModeBlock>(
        builder: (context, modeBlock, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GamePageHeader(),
                GameCard(cardColor: cardColor, secondaryColor: secondaryColor),
                GameCard(cardColor: cardColor, secondaryColor: secondaryColor),
                GameCard(cardColor: cardColor, secondaryColor: secondaryColor)
              ],
            ),
          );
        }
    );
  }
}

class GameCard extends StatelessWidget {
  const GameCard({
    @required this.cardColor,
    @required this.secondaryColor,
  });

  final Color cardColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      padding: EdgeInsets.all(16.0),
      child: Card(
        color: cardColor,
        elevation: 5.0,
        semanticContainer: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)
                  ),
                  image: DecorationImage(
                    image: AssetImage("images/01.jpg"),
                    fit: BoxFit.cover
                  )
                ),
              ),
            Text(
                'Hunger Game',
                style: TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 20.0,
                  color: secondaryColor
                ),
              textAlign: TextAlign.center,
              ),
            SizedBox(height: 10.0,),
            Text(
                'Games Assemble!',
                style: TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 15.0,
                    color: Colors.grey
                ),
              textAlign: TextAlign.center,
              ),
            SizedBox(height: 10.0,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('3' ,
                          style: TextStyle(
                            color: secondaryColor,
                            fontFamily: 'Rajdhani',
                            fontSize: 10.0
                          ),
                        ),
                        Text('Current tour'.toUpperCase() ,
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Rajdhani',
                            fontSize: 10.0
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Divider(
                      color : secondaryColor,
                      height: 10,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('4' ,
                          style: TextStyle(
                              color: secondaryColor,
                              fontFamily: 'Rajdhani',
                              fontSize: 10.0
                          ),
                        ),
                        Text('tours'.toUpperCase() ,
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Rajdhani',
                              fontSize: 10.0
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Divider(
                      color : secondaryColor,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('smart tv'.toUpperCase() ,
                          style: TextStyle(
                              color: secondaryColor,
                              fontFamily: 'Rajdhani',
                              fontSize: 10.0
                          ),
                        ),
                        Text('product'.toUpperCase() ,
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Rajdhani',
                              fontSize: 10.0
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            SizedBox(height: 10.0,),
            CustomAuthButton(
              pressFunction: (){},
              color: Color(0xff615dfa),
              buttonContent: 'Join Game',
            )
          ],
        ),
      ),
    );
  }
}

class GamePageHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage('images/games-bg.png'),
            fit: BoxFit.cover
          )
        ),
        child:Row(
          children: [
            Image.asset("images/games-icon.png"),
            SizedBox(width: 10.0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Games' ,
                  style: TextStyle(
                    fontFamily: 'Rajdhani',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white
                  ),
                ),
                Text('Join Game and Enjoy!' ,
                  style: TextStyle(
                    fontFamily: 'Rajdhani',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.white
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
