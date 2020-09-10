import 'package:flutter/material.dart';

import '../size_config.dart';
class PageHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final String bgImage;
  final String bgIcon;

  PageHeader({this.title , this.subTitle , this.bgImage , this.bgIcon});

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          height: defaultSize*10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: AssetImage(bgImage),
                  fit: BoxFit.cover
              )
          ),
          child:Row(
            children: [
              Image.asset(bgIcon),
              SizedBox(width: defaultSize*1.5,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title ,
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontWeight: FontWeight.bold,
                        fontSize: defaultSize*3,
                        color: Colors.white
                    ),
                  ),
                  Text(subTitle ,
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontWeight: FontWeight.bold,
                        fontSize: defaultSize*1.65,
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
