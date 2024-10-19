import 'package:mysteria/api/dio.dart';
import 'package:mysteria/api/request/adicionar_jogador.dart';
import 'package:mysteria/api/request/iniciar_partida.dart';
import 'package:mysteria/entidade/partida.dart';
import 'package:mysteria/entidade/partida_resumida.dart';
import 'package:mysteria/entidade/status_partida.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part "rest_client.g.dart";

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/partida/status/{status}')
  Future<List<PartidaResumida>> listaPartidasPorStatus(
    @Path('status') StatusPartida status,
  );

  @GET('/partida/{id}')
  Future<Partida> getPartida(@Path('id') String id);

  @GET('/partida/{id}/status')
  Future<StatusPartida> getStatusPartida(@Path('id') String id);

  @POST('/partida/adicionar-jogador')
  Future<String> adicionarJogador(@Body() AdicionarJogador request);

  @DELETE('/partida/remover-jogador')
  Future<String> removerJogador(
    @Query('PartidaId') String partidaId,
    @Query('JogadorId') String jogadorId,
  );

  @PUT('/partida/iniciar')
  Future<String> iniciarPartida(@Body() IniciarPartida request);

  static RestClient? _instance;
  static RestClient get instance {
    return _instance ??= RestClient(
      buildDioCLient(
        "https://mysteria-api.tccnapratica.com.br/api/Mysteria",
      ),
    );
  }
}
