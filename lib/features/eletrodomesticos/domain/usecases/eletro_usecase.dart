

//
// class EletrodomesticoUsecase extends UseCase<List<Map<String, dynamic>>, EletrodomesticoModel > {
//
//   final EletrodomesticoRepository eletroRepository;
//
//   EletrodomesticoUsecase(this.eletroRepository);
//
//   @override
//   Future<Either<Failure, List<Map<String, dynamic>>>> call (
//
//       ) {
//     final result = await eletroRepository.getAllEletrodomesticos();
//     return result.fold(initialValue, combine);
//   }
// }