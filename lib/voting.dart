import 'package:flutter/material.dart';

class HomeExample extends StatefulWidget {
  const HomeExample({Key? key}) : super(key: key);
  @override
  State<HomeExample> createState() => _HomeExampleState();
}

class _HomeExampleState extends State<HomeExample> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04, vertical: size.height * 0.05),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Home",
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.04,
                          letterSpacing: 0.5),
                    ),
                    Spacer(),
                    Container(
                      height: size.width * 0.10,
                      width: size.width * 0.10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/person1.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                  ],
                ),
                Container(
                  height: size.height / 4,
                  width: size.width / 1.2,
                  child:
                      Image.asset("assets/images/person1.png", fit: BoxFit.fitWidth),
                ),
               
                Expanded(
                    child: CardHome(
                  sizeW: 0.2,
                  sizeH: 0.10,
                  text: "KANDIDAT",
                  img: "assets/images/person2.png",

                )),
                Expanded(
                  child: CardHome(
                    sizeW: 0.1,
                    sizeH: 0.10,
                    text: "VOTE",
                    img: "assets/images/person3.png",

                )),
                Expanded(
                  child: CardHome(
                    sizeW: 0.1,
                    sizeH: 0.10,
                    text: "PENGUMUMAN",
                    img: "assets/images/person5.png",
                ))
              ],
            )));
  }
}

class CardHome extends StatefulWidget {
  const CardHome(
      {Key? key, required this.text, required this.img, this.sizeH, this.sizeW})
      : super(key: key);
  final String text;
  final String img;
  final double? sizeH;
  final double? sizeW;

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
        decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.white.withOpacity(0.6), blurRadius: 5)
            ]),
        child: Row(
          children: [
            Container(
                height:
                    size.width * (widget.sizeH != null ? widget.sizeH! : 0.1),
                width:
                    size.width * (widget.sizeW != null ? widget.sizeW! : 0.1),
                child: Image.asset(
                  widget.img,
                  fit: BoxFit.fill,

                )),
            Text(widget.text)

          ],
        ));
  }
}