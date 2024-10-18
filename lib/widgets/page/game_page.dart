import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/vm/game_vm.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/radar.dart';
import 'package:mysteria/widgets/stack_container.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:timer_count_down/timer_count_down.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.julee(
      fontSize: 26,
      color: const Color.fromARGB(255, 216, 0, 0),
    );

    final screenSize = MediaQuery.of(context).size;
    final titleSize = screenSize.width - 40;

    final radarSize = screenSize.width - 60;

    print("radarSize: $radarSize");

    final gameVM = Provider.of<GameViewModel>(context);

    return Scaffold(
      body: StackContainer(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                Images.mysteriaName,
                width: titleSize,
                fit: BoxFit.fitHeight,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tempo Restante: ",
                  style: textStyle,
                ),
                Countdown(
                  seconds: 590,
                  build: (_, double time) {
                    final d = Duration(
                      seconds: time.toInt(),
                    );

                    return Text(
                      "${toClockPart(d.inMinutes)}:${toClockPart(d.inSeconds)}",
                      style: textStyle,
                    );
                  },
                  onFinished: () {
                    print("ACABOU!!!!");
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Radar(
              size: radarSize,
              boundary: RadarBoundary(
                const LatLng(-21.605032, -48.367523),
                const LatLng(-21.604654, -48.368322),
                const LatLng(-21.603862, -48.367904),
                const LatLng(-21.604241, -48.367108),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                badges.Badge(
                  showBadge: gameVM.dicasColetadas > 0,
                  badgeContent: Text("${gameVM.dicasColetadas}"),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: Image.asset(
                        Images.idea,
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      Botao(
                        onPress: () {},
                        child: const TextoSublinhado("DESCOBRI!"),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String toClockPart(int value) =>
      value.remainder(60).toString().padLeft(2, "0");
}
