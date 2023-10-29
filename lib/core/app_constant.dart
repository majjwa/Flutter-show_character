class AppConstant {
  static String baseUrl = 'https://rickandmortyapi.com/api/character';
  static String allCharacter(int page) => '$baseUrl/?page=$page';
  static String characterDetail(int id) => '$baseUrl/$id';
  static String imageUrl(int path) => '$baseUrl/avatar/$path.jpeg';
}
