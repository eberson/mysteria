import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/util/location.dart';
import 'package:mysteria/widgets/radar.dart';
import 'package:mysteria/widgets/stack_container.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.julee(
      fontSize: 26,
      color: const Color.fromARGB(255, 216, 0, 0),
    );

    final screenSize = MediaQuery.of(context).size;
    final titleSize = screenSize.width - 40;

    final radarSize = screenSize.width - 60;

    print(radarSize);

    const verticalSpacer = SizedBox(
      height: 20,
    );

    print("distancia: ${getDistanceFromLatLonInMeters(
      Point.fromCoords(-21.604675, -48.366205),
      Point.fromCoords(-21.604710, -48.366347),
    )}");

    print("distancia: ${getDistanceFromLatLonInMeters(
      Point.fromCoords(-21.605032, -48.367523),
      Point.fromCoords(-21.604654, -48.368322),
    )}");

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
            Text(
              "Tempo Restante: 09:50",
              style: textStyle,
            ),
            verticalSpacer,
            Radar(
              size: radarSize,
              boundary: RadarBoundary(
                Point.fromCoords(-21.605032, -48.367523),
                Point.fromCoords(-21.604654, -48.368322),
                Point.fromCoords(-21.603862, -48.367904),
                Point.fromCoords(-21.604241, -48.367108),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
