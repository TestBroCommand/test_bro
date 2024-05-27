import 'package:test_bro/src/feature/home/data/data_source/pb_dataSource.dart';
import 'package:test_bro/src/feature/home/data/repository/pb_repository.dart';
import 'package:test_bro/src/feature/home/model/entities/quiz_entity.dart';

 class PBrepositoryImpl implements PBrepository {
  final PBdataSource dataSource;

  const PBrepositoryImpl({required this.dataSource});

  @override
  Future<List<Quiz>> getAllQuizes() async {
    return await dataSource.getAllQuizes();
  }
}
