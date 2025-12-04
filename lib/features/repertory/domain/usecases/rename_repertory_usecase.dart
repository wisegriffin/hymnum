import '../contracts/irepertory_repo.dart';

class RenameRepertoryUsecase {
  final IRepertoryRepo repo;

  RenameRepertoryUsecase(this.repo);

  Future<void> call(int id, String name) async {
    await repo.renameRepertory(id, name);
  }
}