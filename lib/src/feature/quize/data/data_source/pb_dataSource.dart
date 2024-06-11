import 'package:pocketbase/pocketbase.dart';
import 'package:test_bro/src/core/constant/config.dart';
import 'package:test_bro/src/feature/quize/model/DTO/page_DTO.dart';
import 'package:test_bro/src/feature/quize/model/DTO/result_DTO.dart';
import 'package:test_bro/src/feature/quize/model/DTO/start_DTO.dart';

class PBdataSource {
  Future<StartDTO> getStartPage(String id) async {
    const config = Config();
    final pb = PocketBase('https://pb.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final RecordModel response = await pb.collection('start_pages').getOne(id);
    final startDTO = StartDTO.fromJson(response.toJson());
    return startDTO;
  }

  Future<List<FinalDTO>> getFinalPage(List<String> id) async {
    const config = Config();
    final pb = PocketBase('https://pb.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final List<RecordModel> response = List<RecordModel>.empty(growable: true);
    for (int i = 0; i < id.length; i++) {
      response.add(await pb.collection('final_page').getOne(id[i]));
    }
    final finalDTO =
        response.map((record) => FinalDTO.fromJson(record.toJson())).toList();
    return finalDTO;
  }

  Future<List<PageDTO>> getPages(List<String> id) async {
    const config = Config();
    final pb = PocketBase('https://testbro.pockethost.io');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final List<RecordModel> response = List<RecordModel>.empty(growable: true);
    for (int i = 0; i < id.length; i++) {
      response.add(await pb.collection('quiz_page').getOne(id[i]));
    }
    final pageDTO =
        response.map((record) => PageDTO.fromJson(record.toJson())).toList();
    return pageDTO;
  }
}
