import 'package:i_trade/controllers/avatar/mode_avatar.dart';

String generateDiceBearUrl(AvatarConfig a) {
  final params = {
    'hair': a.hair,
    'eyes': a.eyes,
    'mouth': a.mouth,
    'skinColor': a.skinColor,
    if (a.glasses != null) 'glasses': a.glasses!,
  };

  final query = params.entries.map((e) => '${e.key}=${e.value}').join('&');

  return 'https://api.dicebear.com/7.x/avataaars/png?$query';
}
