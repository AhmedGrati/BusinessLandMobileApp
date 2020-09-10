import 'package:businessland_app/generic_widgets/page_header.dart';
import 'package:businessland_app/screens/auth_screen/components/custom_auth_button.dart';
import 'package:businessland_app/state_management_blocks/mode_block.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
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
                PageHeader(
                  title: 'Games',
                  subTitle: 'Join A Game And Enjoy',
                  bgImage: 'images/games-bg.webp',
                  bgIcon: 'images/games-icon.webp',
                ),
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
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      height: defaultSize * 42,
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
              height: defaultSize * 11.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)
                  ),
                  image: DecorationImage(
                    image: AssetImage("images/01.webp"),
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
            SizedBox(height: defaultSize,),
            Text(
                'Games Assemble!',
                style: TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 15.0,
                    color: Colors.grey
                ),
              textAlign: TextAlign.center,
              ),
            SizedBox(height: defaultSize * 1.5,),
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
                    height: defaultSize * 2.25,
                    child: Divider(
                      color : secondaryColor,
                      height: defaultSize,
                      indent: defaultSize * 3.2,
                      endIndent: defaultSize * 3.2,
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
                    height: defaultSize * 2.25,
                    child: Divider(
                      color : secondaryColor,
                      indent: defaultSize * 3.2,
                      endIndent: defaultSize *3.2,
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
            SizedBox(height: defaultSize*1.5,),
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

