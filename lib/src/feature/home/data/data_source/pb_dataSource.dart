import 'package:pocketbase/pocketbase.dart';
import 'package:test_bro/src/core/constant/config.dart';
import 'package:test_bro/src/feature/home/model/DTO/quiz_DTO.dart';

class PBdataSource {
  Future<List<QuizDTO>> getAllQuizes() async {
    const config = Config();
    final pb = PocketBase('https://pb.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final ResultList<RecordModel> response =
        await pb.collection('quizes').getList();
    final quizesDTO = response.items
        .map((record) => QuizDTO.fromJson(record.toJson()))
        .toList();
    return quizesDTO;
  }
}

// Future<void> _authAsAdmin() async {
//   final config = Config();
//   pb = PocketBase('http://testbroapp.ru');
//   await pb!.admins.authWithPassword(
//     'uohucku3ne@mail.authpass.app',
//     '\'PIGwYyX@VDw)rM~7feT)VG\$pntQTrhwkLq432ad',
//   );
// }
