import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:latlong2/latlong.dart';
import 'package:mysteria/geo/locator.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/util/shadow.dart';
import 'package:mysteria/vm/jogador_vm.dart';
import 'package:mysteria/vm/pontos_interesse_vm.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/container_tela.dart';
import 'package:mysteria/widgets/input.dart';
import 'package:mysteria/widgets/label.dart';
import 'package:mysteria/widgets/tema.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _podeEntrar = false;
  final nickController = TextEditingController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      determinePosition().then((value) {
        final vm = Provider.of<PontoInteresseViewModel>(
          context,
          listen: false,
        );

        vm.setUserLocation(LatLng(value.latitude, value.longitude));

        setState(() {
          _podeEntrar = true;
        });
      }).catchError((e) {
        final messenger = ScaffoldMessenger.of(context);

        messenger.showSnackBar(
          SnackBar(
            content: Column(
              children: [
                const Text("Você não poderá entrar no jogo."),
                const SizedBox(
                  height: 5,
                ),
                Text(e),
              ],
            ),
          ),
        );

        setState(() {
          _podeEntrar = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final largura = width * 0.6;
    final logoSpace = height * 0.08;
    final mainSpace = height * 0.15;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ContainerTela(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(Images.faixaDestaque),
              SizedBox(
                height: logoSpace,
              ),
              _logo(Images.mysteriaLogo, largura),
              SizedBox(
                height: mainSpace,
              ),
              Container(
                width: largura,
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const Label(
                          "NICK NAME",
                          imageAsset: "lib/assets/images/usuario.png",
                        ),
                        const SizedBox(height: 10),
                        Input(
                          controller: nickController,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: largura * 0.6,
                child: Botao(
                  onPress: () {
                    _entrar(context, nickController.text);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextoSublinhado("ENTRAR"),
                      Icon(
                        Icons.play_arrow,
                        color: Color.fromARGB(255, 183, 6, 6),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo(String logo, double largura) => Container(
        width: largura,
        height: largura,
        decoration: circularInnerShadow(
          bodyShadow,
          const Color.fromARGB(255, 88, 87, 87),
          20,
        ),
        child: Image.asset(
          logo,
          width: largura,
          fit: BoxFit.fitWidth,
        ),
      );

  void _entrar(BuildContext context, String? nome) {
    if (!_podeEntrar) {
      return;
    }

    final jogadorVM = Provider.of<JogadorViewModel>(
      context,
      listen: false,
    );

    jogadorVM.createJogador(nome);

    Navigator.pushNamed(context, "/partidas");
  }
}
