import 'package:pocketbase/pocketbase.dart';
import 'package:test_bro/src/core/constant/config.dart';
import 'package:test_bro/src/feature/quize/model/DTO/page_DTO.dart';
import 'package:test_bro/src/feature/quize/model/DTO/result_DTO.dart';
import 'package:test_bro/src/feature/quize/model/DTO/start_DTO.dart';

class PBdataSource {
  Future<StartDTO> getQuizStartPage(String id) async {
    const config = Config();
    final pb = PocketBase('https://pb-dev.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final idPageRecord = await pb.collection('quizes').getOne(id);
    final idPage = idPageRecord.getStringValue('start_page');
    final response =
        await pb.collection('start_pages').getOne(idPage);
    final startDTO = StartDTO.fromJson(response.toJson());
    return startDTO;
  }

  Future<List<FinalDTO>> getQuizFinalPage(String id) async {
    const config = Config();
    final pb = PocketBase('https://pb-dev.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final idPageRecord =
        await pb.collection('quizes_uquiz').getOne(id);
    final idPage =
        idPageRecord.getListValue<String>('final_page');
    final response = List<RecordModel>.empty(growable: true);
    for (var i = 0; i < idPage.length; i++) {
      response.add(await pb.collection('final_page').getOne(idPage[i]));
    }
    final finalDTO =
        response.map((record) => FinalDTO.fromJson(record.toJson())).toList();
    return finalDTO;
  }

  Future<List<PageDTO>> getQuizPages(String id) async {
    const config = Config();
    final pb = PocketBase('https://pb-dev.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final idPageRecord = await pb.collection('quizes').getOne(id);
    final idPage = idPageRecord.getListValue<String>('pages');
    final response = List<RecordModel>.empty(growable: true);
    for (var i = 0; i < idPage.length; i++) {
      response.add(await pb.collection('quiz_page').getOne(idPage[i]));
    }
    final pageDTO =
        response.map((record) => PageDTO.fromJson(record.toJson())).toList();
    return pageDTO;
  }

  Future<void> addQuizNewTaker(String id) async {
    const config = Config();
    final pb = PocketBase('https://pb-dev.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final lastCompleteRecordModel =
        await pb.collection('quizes_uquiz').getOne(id);
    final lastComplete = lastCompleteRecordModel.getIntValue('complete');
    final updatedData = {'complete': lastComplete + 1};
    await pb.collection('quizes_uquiz').update(id, body: updatedData);
  }

  Future<StartDTO> getUQuizStartPage(String id) async {
    const config = Config();
    final pb = PocketBase('https://pb-dev.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final idPageRecord =
        await pb.collection('quizes_uquiz').getOne(id);
    final idPage = idPageRecord.getStringValue('start_page');
    final response =
        await pb.collection('start_page_uquiz').getOne(idPage);
    final startDTO = StartDTO.fromJson(response.toJson());
    return startDTO;
  }

  Future<List<FinalDTO>> getUQuizFinalPage(String id) async {
    const config = Config();
    final pb = PocketBase('https://pb-dev.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final idPageRecord =
        await pb.collection('quizes_uquiz').getOne(id);
    final idPage = idPageRecord.getListValue('final_page');
    final response = List<RecordModel>.empty(growable: true);
    for (var i = 0; i < idPage.length; i++) {
      response.add(await pb.collection('final_page_uquiz').getOne(idPage[i]));
    }

    final finalDTO = response.map((record) => FinalDTO.fromJson(record.toJson())).toList();
    return finalDTO;
  }

  Future<List<PageDTO>> getUQuizPages(String id) async {
    const config = Config();
    final pb = PocketBase('https://pb-dev.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final idPageRecord =
        await pb.collection('quizes_uquiz').getOne(id);
    final idPage = idPageRecord.getListValue<String>('pages');
    final response = List<RecordModel>.empty(growable: true);
    for (var i = 0; i < idPage.length; i++) {
      response.add(await pb.collection('quiz_page_uquiz').getOne(idPage[i]));
    }
    final pageDTO =
        response.map((record) => PageDTO.fromJson(record.toJson())).toList();
    return pageDTO;
  }

  Future<void> addUQuizNewTaker(String id) async {
    const config = Config();
    final pb = PocketBase('https://pb-dev.testbroapp.ru');
    await pb.admins.authWithPassword(
      config.pbEmail,
      config.pbPass,
    );
    final lastCompleteRecordModel =
        await pb.collection('quizes_uquiz').getOne(id);
    final lastComplete = lastCompleteRecordModel.getIntValue('complete');
    final updatedData = {'complete': lastComplete + 1};
    await pb.collection('quizes_uquiz').update(id, body: updatedData);
  }
}
