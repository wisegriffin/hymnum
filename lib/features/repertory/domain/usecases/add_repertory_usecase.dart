import '../contracts/irepertory_repo.dart';

class AddRepertoryUsecase {
  final IRepertoryRepo repertoryRepo;

  AddRepertoryUsecase(this.repertoryRepo);

  Future<void> call(String name) async {
    if (name.trim().isEmpty) {
      throw Exception("Invalid name");
    }

    try {
      await repertoryRepo.createRepertory(name);
    } catch (e) {
      throw Exception("Failure");
    }
  }
}
