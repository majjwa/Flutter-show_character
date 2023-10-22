class AppConstant {
  static const String allCharacter="https://rickandmortyapi.com/api/character";
  static String characterDetail (int id)=>'$allCharacter/$id';
  static String imageUrl(int path)=> '$allCharacter/avatar/$path.jpeg';

}