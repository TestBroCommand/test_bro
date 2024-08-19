import 'package:pocketbase/pocketbase.dart';
import 'package:test_bro/src/core/constant/config.dart';
import 'package:test_bro/src/feature/home/model/DTO/quiz_DTO.dart';
import 'package:test_bro/src/feature/home/model/DTO/tag_dto.dart';

class PBdataSource {
  Future<List<QuizDTO>> getAllQuizes() async {
    const config = Config();
    final pb = PocketBase('https://pb-dev.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final response =
        await pb.collection('quizes').getList();
    final quizesDTO = response.items
        .map((record) => QuizDTO.fromJson(record.toJson()))
        .toList();
    return quizesDTO;
  }

  Future<List<QuizDTO>> getAllUQuizes() async {
    const config = Config();
    final pb = PocketBase('https://pb-dev.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final response =
        await pb.collection('quizes_uquiz').getList();
    final quizesDTO = response.items
        .map((record) => QuizDTO.fromJson(record.toJson()))
        .toList();
    return quizesDTO;
  }

  Future<List<QuizDTO>> getAllUQuizesByIds(List<String> ids) async {
    const config = Config();
    final pb = PocketBase('https://pb-dev.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final rec = <RecordModel>[];
    for (final id in ids) {
      rec.add(await pb.collection('quizes_uquiz').getOne(id));
    }
    final quizesDTO =
        rec.map((record) => QuizDTO.fromJson(record.toJson())).toList();
    return quizesDTO;
  }

  Future<List<TagDto>> getAllTagsSource() async {
    const config = Config();
    final pb = PocketBase('https://pb-dev.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final response =
        await pb.collection('tags_uquiz').getList();
    final tagDto = response.items
        .map((record) => TagDto.fromJson(record.toJson()))
        .toList();
    return tagDto;
  }
}

// Future<void> _authAsAdmin() async {
//   final config = Config();
//   pb = PocketBase('https://pb.testbroapp.ru');
//   await pb!.admins.authWithPassword(
//     'uohucku3ne@mail.authpass.app',
//     '\'PIGwYyX@VDw)rM~7feT)VG\$pntQTrhwkLq432ad',
//   );
// }
