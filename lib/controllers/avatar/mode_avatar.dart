class AvatarConfig {
  String hair;
  String eyes;
  String mouth;
  String skinColor;
  String? glasses;

  AvatarConfig({
    required this.hair,
    required this.eyes,
    required this.mouth,
    required this.skinColor,
    this.glasses,
  });
}
