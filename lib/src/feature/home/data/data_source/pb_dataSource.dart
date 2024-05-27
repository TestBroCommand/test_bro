import 'package:pocketbase/pocketbase.dart';
import 'package:test_bro/src/feature/home/model/entities/quiz_entity.dart';

class PBdataSource {
  final pb = PocketBase('https://testbro.pockethost.io');
  Future<List<Quiz>> getAllQuizes() async {
    final resultList = await pb.collection('quizes').getList();
    print(resultList);
    return [];
  }
}
