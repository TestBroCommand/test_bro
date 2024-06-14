import 'package:test_bro/src/feature/quize/model/enities/page_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/result_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/start_enity.dart';

abstract interface class PBrepository {
  Future<StartEntity> getStartPage(String id);
  Future<List<FinalEntity>> getAllFinalles(String id);
  Future<List<PageEntity>> getAllPages(String id);
  Future<void> updateTakers(String id);
}
