import 'package:json_annotation/json_annotation.dart';
import 'package:mysteria/entidade/charada.dart';
import 'package:mysteria/entidade/jogador.dart';
import 'package:mysteria/entidade/local.dart';
import 'package:mysteria/entidade/objeto.dart';
import 'package:mysteria/entidade/personagem.dart';
import 'package:mysteria/entidade/status_partida.dart';

part 'partida.g.dart';

@JsonSerializable()
class Partida {
  final String id;
  final String titulo;
  final String narrativa;

  @JsonKey(name: "dataHoraInicio")
  final DateTime? inicio;

  @JsonKey(name: "dataHoraTermino")
  final DateTime? fim;
  final StatusPartida status;

  final List<Personagem> personagens;
  final List<Objeto> objetos;
  final List<Local> locais;
  final List<Jogador> jogadores;

  @JsonKey(name: "personagemCharadas")
  final List<Charada> dicasPersonagem;

  @JsonKey(name: "objetoCharadas")
  final List<Charada> dicasObjeto;

  @JsonKey(name: "localCharadas")
  final List<Charada> dicasLocal;

  Partida(
    this.id,
    this.titulo,
    this.narrativa,
    this.inicio,
    this.fim,
    this.status,
    this.personagens,
    this.objetos,
    this.locais,
    this.jogadores,
    this.dicasPersonagem,
    this.dicasLocal,
    this.dicasObjeto,
  );

  int get maxJogadores => 10;
  int get countJogadores => jogadores.length;

  bool get disponivel => countJogadores < maxJogadores;
  bool get salaCheia => countJogadores >= maxJogadores;

  List<Charada> get dicas => <Charada>[
        ...dicasLocal,
        ...dicasObjeto,
        ...dicasPersonagem,
      ];

  factory Partida.fromJson(Map<String, dynamic> json) =>
      _$PartidaFromJson(json);

  Map<String, dynamic> toJson() => _$PartidaToJson(this);
}
