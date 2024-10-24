import 'package:client_rickandmorty/src/api_rick_and_morty_interface.dart';
import 'package:client_rickandmorty/src/utils/api_const.dart';
import 'package:dio/dio.dart';
import 'package:models_app/models_app.dart';

class ApiClientRickEndMorty implements IApiClient {
  final Dio dio;
  ApiClientRickEndMorty({
    required this.dio,
  });

  final _urlCharacter = '${ApiConst.baseUrl}/${ApiConst.character}';

  @override
  Future<List<Character>> fetchCharacters() async {
    return _handleDioException<List<Character>>(
      () async {
        final response = await dio.get<Map<String, dynamic>>(_urlCharacter);
        if (response.statusCode == 200) {
          final data = response.data;
          if (data == null) {
            throw ApiException(
              errorMessage: 'Failed request to load characters',
            );
          }
          return (data['results'] as List)
              .map(
                (character) => Character.fromMap(
                  character as Map<String, dynamic>,
                ),
              )
              .toList();
        } else {
          handleError(response.statusCode);
        }
      },
      'Failed request to load characters',
    );
  }

  @override
  Future<CharacterInfoModel> fetchCharacterID(int idCharacter) async {
    return _handleDioException<CharacterInfoModel>(
      () async {
        final response =
            await dio.get<Map<String, dynamic>>('$_urlCharacter/$idCharacter');
        if (response.statusCode == 200) {
          final data = response.data;
          if (data == null) {
            throw ApiException(errorMessage: 'Failed load character id');
          }
          return CharacterInfoModel.fromMap(data);
        } else {
          handleError(response.statusCode);
        }
      },
      'Failed load character id',
    );
  }

  Never handleError(int? statusCode) {
    switch (statusCode) {
      case 404:
        throw ApiException(errorMessage: 'Character not found');
      case 500:
        throw ApiException(errorMessage: 'Server error');
      default:
        throw ApiException(errorMessage: 'Failed request to load characters');
    }
  }

  Future<T> _handleDioException<T>(
    Future<T> Function() request,
    String errorMessage,
  ) async {
    try {
      final result = await request();
      return result;
    } on DioException catch (e) {
      throw ApiException(
        errorMessage:
            (e.response?.data as Map<String, dynamic>)['detail'] as String? ??
                'Dio error occurred',
      );
    } catch (e, _) {
      throw ApiException(
        errorMessage: errorMessage,
      );
    }
  }
}
