import 'package:pocketbase/pocketbase.dart';
import 'package:test_bro/src/core/constant/config.dart';
import 'package:test_bro/src/core/utils/logger.dart';
import 'package:test_bro/src/feature/quize/model/DTO/page_DTO.dart';
import 'package:test_bro/src/feature/quize/model/DTO/result_DTO.dart';
import 'package:test_bro/src/feature/quize/model/DTO/start_DTO.dart';

class PBdataSource {
  Future<StartDTO> getStartPage(String id) async {
    const config = Config();
    final pb = PocketBase('https://testbro.pockethost.io');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    logger.info(id);
    logger.info("Wow this work");
    final RecordModel response = await pb.collection('start_pages').getOne(id);
    logger.info(response.collectionName);
    final startDTO = StartDTO.fromJson(response.toJson());
    return startDTO;
  }

  Future<List<FinalDTO>> getFinalPage(List<String> id) async {
    const config = Config();
    final pb = PocketBase('https://testbro.pockethost.io');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final ResultList<RecordModel> response =
        await pb.collection('final_page').getList(expand: id.join(","));
    final finalDTO = response.items
        .map((record) => FinalDTO.fromJson(record.toJson()))
        .toList();
    return finalDTO;
  }

  Future<List<PageDTO>> getPages(List<String> id) async {
    const config = Config();
    final pb = PocketBase('https://testbro.pockethost.io');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final ResultList<RecordModel> response =
        await pb.collection('quiz_page').getList(expand: id.join(","));
    final pageDTO = response.items
        .map((record) => PageDTO.fromJson(record.toJson()))
        .toList();
    return pageDTO;
  }
}
