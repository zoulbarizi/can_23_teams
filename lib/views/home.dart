import 'dart:math';

import 'package:can_23_teams/models/country.dart';
import 'package:can_23_teams/utils/consts.dart';
import 'package:can_23_teams/utils/my_data.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageCtrl;
  Country ctrySltd = MyDatas.teams.first;
  TextStyle bold = const TextStyle(fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    pageCtrl = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageCtrl.dispose();
  }

  static List<List<Color>> gradColors() => [
        [
          const Color.fromARGB(255, 0, 83, 0),
          const Color.fromRGBO(0, 198, 0, 0.442)
        ],
        [
          const Color.fromARGB(255, 0, 12, 83),
          const Color.fromARGB(255, 0, 124, 225)
        ],
        [
          const Color.fromARGB(255, 83, 0, 0),
          const Color.fromARGB(255, 225, 0, 0)
        ],
        [
          const Color.fromARGB(255, 83, 0, 81),
          const Color.fromARGB(255, 225, 0, 172)
        ],
      ];

  static List<String> backgUrls = [
    "https://upload.wikimedia.org/wikipedia/commons/9/9c/Stade_d%27Ebimp%C3%A9.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/a/a6/Le_stade_de_Yamoussoukro%28Bosson%29.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Stade_F%C3%A9lix_Houphou%C3%ABt-Boigny_r%C3%A9habilit%C3%A9_04.jpg/1920px-Stade_F%C3%A9lix_Houphou%C3%ABt-Boigny_r%C3%A9habilit%C3%A9_04.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/b/b4/Le_stade_de_la_paix_de_Bouak%C3%A9.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/7/77/Stade_de_San-P%C3%A9dro_%28Bosson%29.jpg",
  ];

  List<Color> gradSltd = gradColors().first;

  akwabaText() {
    return Text(
      'Akwaba !',
      style: GoogleFonts.dancingScript(
        fontSize: 70,
        height: .5,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  slogan() {
    return Text(
      "La CAN de l'hospitalité !",
      style: GoogleFonts.lemon(fontSize: 18, color: Colors.white),
    );
  }

  countryName() {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40)
            .add(const EdgeInsets.only(top: 10)),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          ctrySltd.name,
          style: GoogleFonts.lemon(
            fontSize: 40,
            color: Colors.orange,
            shadows: [
              BoxShadow(
                offset: const Offset(4, -4),
                color: Consts.color1,
                blurRadius: 3,
              ),
              const BoxShadow(
                offset: Offset(2, -2),
                color: Colors.white,
              ),
              // BoxShadow(
              //   offset: Offset(2, -2),
              //   color: Consts.color3,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradSltd,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          image: DecorationImage(
            image: Image.network(
              backgUrls[Random().nextInt(gradColors().length)],
            ).image,
            opacity: .3,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height / 10,
              width: size.width / 2,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset("assets/images/CAN2023.png"),
            ),
            const SizedBox(height: 20),
            akwabaText(),
            countryName(),
            const SizedBox(height: 5),
            SizedBox(
              height: size.height / 2,
              width: size.width,
              child: PageView(
                controller: pageCtrl,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  gradSltd =
                      gradColors()[Random().nextInt(gradColors().length)];
                  ctrySltd = MyDatas.teams[value];
                  setState(() {});
                },
                children: MyDatas.teams
                    .map((e) => Container(
                          height: size.height / 1.8,
                          width: size.width * .6,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  CountryFlag.fromCountryCode(
                                    ctrySltd.countryCode,
                                    height: size.height / 3.22,
                                  ),
                                  Container(
                                    height: size.height / 3,
                                    alignment: Alignment.bottomCenter,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(.97),
                                          Colors.white.withOpacity(.95),
                                          Colors.white.withOpacity(.5),
                                          Colors.white.withOpacity(.2),
                                          Colors.transparent,
                                          Colors.transparent,
                                          Colors.transparent,
                                          Colors.transparent,
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${e.nbParticipation}è Participation",
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          e.description,
                                          style: const TextStyle(fontSize: 14),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "${e.rang}",
                                          style: const TextStyle(fontSize: 6),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Date de qualification"),
                                  Text(e.dateQualification, style: bold),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Meilleur résultat"),
                                  Text(e.lastParticipation, style: bold),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20)
                                        .add(const EdgeInsets.only(bottom: 20)),
                                child: Row(
                                  children: e.results
                                      .map(
                                        (r) => Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Consts.color2),
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.emoji_events,
                                                  color: Consts.color1,
                                                ),
                                                Text(
                                                  "($r)",
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
            slogan(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // if (!pageCtrl.position.is)
                  IconButton(
                    onPressed: () {
                      pageCtrl.previousPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutCirc,
                      );
                    },
                    icon: Icon(
                      Icons.swipe_left,
                      color: Colors.white.withOpacity(.5),
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      pageCtrl.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutCirc,
                      );
                    },
                    icon: Icon(
                      Icons.swipe_right,
                      color: Colors.white.withOpacity(.5),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
