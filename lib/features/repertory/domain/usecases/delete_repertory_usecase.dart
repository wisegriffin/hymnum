import '../contracts/irepertory_repo.dart';

class DeleteRepertoryUsecase {
  final IRepertoryRepo repo;

  DeleteRepertoryUsecase(this.repo);

  Future<void> call(int id) async {
    await repo.deleteRepertory(id);
  }
}