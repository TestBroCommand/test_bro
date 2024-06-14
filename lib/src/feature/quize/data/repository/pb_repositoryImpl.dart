import 'package:test_bro/src/feature/quize/data/data_source/pb_dataSource.dart';
import 'package:test_bro/src/feature/quize/data/repository/pb_respository.dart';
import 'package:test_bro/src/feature/quize/model/enities/page_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/result_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/start_enity.dart';

class PBrepositoryImpl implements PBrepository {
  final PBdataSource dataSource;

  const PBrepositoryImpl({required this.dataSource});

  @override
  Future<StartEntity> getStartPage(String id) async {
    final startDTOs = await dataSource.getStartPage(id);
    final start = StartEntity.fromDto(startDTOs);
    return start;
  }

  @override
  Future<List<FinalEntity>> getAllFinalles(String id) async {
    final finalDTOs = await dataSource.getFinalPage(id);
    final finals = finalDTOs.map((dto) => FinalEntity.fromDto(dto)).toList();
    return finals;
  }

  @override
  Future<List<PageEntity>> getAllPages(String id) async {
    final pagesDTOs = await dataSource.getPages(id);
    final pages = pagesDTOs.map((dto) => PageEntity.fromDto(dto)).toList();
    return pages;
  }

  @override
  Future<void> updateTakers(String id) async {
    await dataSource.addNewTaker(id);
  }
}
