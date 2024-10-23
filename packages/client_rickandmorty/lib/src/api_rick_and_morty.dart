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
    try {
      final response = await dio.get<Map<String, dynamic>>(_urlCharacter);
      if (response.statusCode == 200) {
        final data = response.data;
        if (data == null) {
          throw ApiException(errorMessage: 'Failed request to load characters');
        }
        return (data['results'] as List)
            .map(
              (character) => Character.fromMap(
                character as Map<String, dynamic>,
              ),
            )
            .toList();
      } else {
        throw ApiException(errorMessage: 'Failed request to load characters');
      }
    } on DioException catch (_) {
      throw ApiException(errorMessage: 'Failed request to load characters');
    } on ApiException catch (_) {
      rethrow;
    } catch (e) {
      throw ApiException(
        errorMessage: 'Unknown Error - Failed request to load characters',
      );
    }
  }
}
