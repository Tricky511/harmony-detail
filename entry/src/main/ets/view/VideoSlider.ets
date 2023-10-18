import { ALL_PERCENT, FONT_SIZE, SLIDER_BLOCK_SIZE } from '../common/constants/CommonConstants';
import {
  getSliderBlockColor, getSliderOpacity, getTextOpacity, sliderOnChange } from '../model/VideoModel';

@Component
export struct VideoProgress {
  private controller: VideoController = new VideoController();
  @Consume currentStringTime: string;
  @Consume currentTime: number;
  @Consume durationTime: number;
  @Consume durationStringTime: string;
  @Consume isPlay: boolean;
  build() {
    Column() {
      Text(this.currentStringTime + ' | ' + this.durationStringTime)
        .fontSize(FONT_SIZE)
        .opacity(getTextOpacity(this.isPlay))
      Slider({
        value: this.currentTime,
        max: this.durationTime,
        style: SliderStyle.OutSet
      }).width(ALL_PERCENT)
        .opacity(getSliderOpacity(this.isPlay))
        .blockColor(getSliderBlockColor(this.isPlay))
        .blockSize(SLIDER_BLOCK_SIZE)
        .onChange((value, mode) =>
          sliderOnChange(this.controller, value, mode)
        )
    }
  }
}