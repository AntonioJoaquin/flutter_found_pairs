enum DifficultyModeType {
  easy(0, 'Easy Mode'),
  medium(1, 'Medium Mode'),
  hard(2, 'Hard Mode');

  final int id;
  final String text;

  const DifficultyModeType(
    this.id,
    this.text,
  );
}
