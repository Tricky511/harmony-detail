import { COMMON_NUM_DOUBLE, COMMON_NUM_MINUTE,
  SLIDER_PAUSE_OPACITY,
  SLIDER_START_OPACITY,
  SPLIT,
  TEXT_PAUSE_OPACITY,
  TEXT_START_OPACITY,
  ZERO_STR } from '../common/constants/CommonConstants';

export function changeSliderTime(value: number): string {
  let second: number = value % COMMON_NUM_MINUTE;
  let min: number = Number.parseInt((value / COMMON_NUM_MINUTE).toString());
  let head = min < COMMON_NUM_DOUBLE ? `${ZERO_STR}${min}` : min;
  let end = second < COMMON_NUM_DOUBLE ? `${ZERO_STR}${second}` : second;
  let nowTime = `${head}${SPLIT}${end}`;
  return nowTime;
}

export function getTextOpacity(isPlay: boolean): number {
  if (isPlay) {
    return TEXT_START_OPACITY;
  } else {
    return TEXT_PAUSE_OPACITY;
  }
}

export function getSliderOpacity(isPlay: boolean): number {
  if (isPlay) {
    return SLIDER_START_OPACITY;
  } else {
    return SLIDER_PAUSE_OPACITY;
  }
}

export function sliderOnChange(control: VideoController, value: number, mode: SliderChangeMode) {
  control.setCurrentTime(value)
  if (mode == SliderChangeMode.Begin) {
    control.pause()
  } else if (mode == SliderChangeMode.End) {
    control.start()
  }
}

export function getSliderBlockColor(isPlay: boolean) : ResourceColor {
  if (isPlay) {
    return '#00ffffff'
  } else {
    return '#ffffffff'
  }
}