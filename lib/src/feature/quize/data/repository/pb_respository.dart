import 'package:test_bro/src/feature/quize/model/enities/page_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/result_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/start_enity.dart';

abstract interface class PBrepository {
  Future<StartEntity> getQuizStartPage(String id);
  Future<List<FinalEntity>> getQuizAllFinalles(String id);
  Future<List<PageEntity>> getQuizAllPages(String id);
  Future<void> updateQuizTakers(String id);
  Future<StartEntity> getUQuizStartPage(String id);
  Future<List<FinalEntity>> getUQuizAllFinalles(String id);
  Future<List<PageEntity>> getUQuizAllPages(String id);
  Future<void> updateUQuizTakers(String id);
}
