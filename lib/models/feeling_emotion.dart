import 'package:flutter_svg/flutter_svg.dart';

const soHappy = 'SO_GOOD';
const littleBitHappy = 'GOOD';
const common = 'NORMAL';
const littleBitUnHappy = 'BAD';
const soUnHappy = 'SO_BAD';

enum FeelingValue {
  soHappy,
  littleBitHappy,
  common,
  littleBitUnHappy,
  soUnHappy
}

class FeelingEmotion {
  FeelingEmotion({required this.feelingValue, required this.svgPicture});
  final SvgPicture svgPicture;
  FeelingValue feelingValue;

  static List<FeelingEmotion> getFeelingEmotionList() {
    return [
      FeelingEmotion(
        feelingValue: FeelingValue.soHappy,
        svgPicture: SvgPicture.asset('images/max_smiling.svg'),
      ),
      FeelingEmotion(
        feelingValue: FeelingValue.littleBitHappy,
        svgPicture: SvgPicture.asset('images/normal_smiling.svg'),
      ),
      FeelingEmotion(
        feelingValue: FeelingValue.common,
        svgPicture: SvgPicture.asset('images/normal_face.svg'),
      ),
      FeelingEmotion(
        feelingValue: FeelingValue.littleBitUnHappy,
        svgPicture: SvgPicture.asset('images/normal_sad.svg'),
      ),
      FeelingEmotion(
        feelingValue: FeelingValue.soUnHappy,
        svgPicture: SvgPicture.asset('images/max_sad.svg'),
      ),
    ];
  }
}
