import 'package:test_bro/src/feature/quize/data/data_source/pb_dataSource.dart';
import 'package:test_bro/src/feature/quize/data/repository/pb_respository.dart';
import 'package:test_bro/src/feature/quize/model/enities/page_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/result_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/start_enity.dart';

class PBrepositoryImpl implements PBrepository {
  final PBdataSource dataSource;

  const PBrepositoryImpl({required this.dataSource});

  @override
  Future<StartEntity> getQuizStartPage(String id) async {
    final startDTOs = await dataSource.getQuizStartPage(id);
    final start = StartEntity.fromDto(startDTOs);
    return start;
  }

  @override
  Future<List<FinalEntity>> getQuizAllFinalles(String id) async {
    final finalDTOs = await dataSource.getQuizFinalPage(id);
    final finals = finalDTOs.map((dto) => FinalEntity.fromDto(dto)).toList();
    return finals;
  }

  @override
  Future<List<PageEntity>> getQuizAllPages(String id) async {
    final pagesDTOs = await dataSource.getQuizPages(id);
    final pages = pagesDTOs.map((dto) => PageEntity.fromDto(dto)).toList();
    return pages;
  }

  @override
  Future<void> updateQuizTakers(String id) async {
    await dataSource.addQuizNewTaker(id);
  }

  @override
  Future<StartEntity> getUQuizStartPage(String id) async {
    final startDTO = await dataSource.getUQuizStartPage(id);
    final start = StartEntity.fromDto(startDTO);
    return start;
  }

  @override
  Future<List<FinalEntity>> getUQuizAllFinalles(String id) async {
    final finalDTOs = await dataSource.getUQuizFinalPage(id);
    final finals = finalDTOs.map((dto) => FinalEntity.fromDto(dto)).toList();
    return finals;
  }

  @override
  Future<List<PageEntity>> getUQuizAllPages(String id) async {
    final pagesDTOs = await dataSource.getUQuizPages(id);
    final pages = pagesDTOs.map((dto) => PageEntity.fromDto(dto)).toList();
    return pages;
  }

  @override
  Future<void> updateUQuizTakers(String id) async {
    await dataSource.addUQuizNewTaker(id);
  }
}
