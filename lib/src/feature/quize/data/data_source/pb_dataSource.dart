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
    final RecordModel _idPageRecord = await pb.collection('quizes').getOne(id);
    final String _idPage = _idPageRecord.getStringValue('start_page');
    final RecordModel response =
        await pb.collection('start_pages').getOne(_idPage);
    final startDTO = StartDTO.fromJson(response.toJson());
    return startDTO;
  }

  Future<List<FinalDTO>> getFinalPage(String id) async {
    const config = Config();
    final pb = PocketBase('https://pb.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final RecordModel _idPageRecord = await pb.collection('quizes').getOne(id);
    final List<String> _idPage =
        _idPageRecord.getListValue<String>("final_page");
    final List<RecordModel> response = List<RecordModel>.empty(growable: true);
    for (int i = 0; i < _idPage.length; i++) {
      response.add(await pb.collection('final_page').getOne(_idPage[i]));
    }
    final finalDTO =
        response.map((record) => FinalDTO.fromJson(record.toJson())).toList();
    return finalDTO;
  }

  Future<List<PageDTO>> getPages(String id) async {
    const config = Config();
    final pb = PocketBase('https://pb.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final RecordModel _idPageRecord = await pb.collection('quizes').getOne(id);
    final List<String> _idPage = _idPageRecord.getListValue<String>("pages");
    final List<RecordModel> response = List<RecordModel>.empty(growable: true);
    for (int i = 0; i < _idPage.length; i++) {
      response.add(await pb.collection('quiz_page').getOne(_idPage[i]));
    }
    final pageDTO =
        response.map((record) => PageDTO.fromJson(record.toJson())).toList();
    return pageDTO;
  }


  Future<void> addNewTaker(String id) async {
    const config = Config();
    final pb = PocketBase('https://pb.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final lastCompleteRecordModel = await pb.collection('quizes').getOne(id);
    final lastComplete = lastCompleteRecordModel.getIntValue("complete");
    final updatedData = {'complete': lastComplete + 1};
    await pb.collection('quizes').update(id, body: updatedData);
  }
}
