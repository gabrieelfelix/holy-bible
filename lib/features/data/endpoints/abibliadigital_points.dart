class AbibliadigitalEndpoints {
  static String chapter({required String abrevBook, required int chapter}) =>
      'https://www.abibliadigital.com.br/api/verses/nvi/$abrevBook/${chapter.toString()}';
}
