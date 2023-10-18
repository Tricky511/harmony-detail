import hilog from '@ohos.hilog';
import { ALL_PERCENT,
  RIGHT_ACTION_BOTTOM_MARGIN,
  RIGHT_ACTION_ICON_SIZE,
  RIGHT_ACTION_RIGHT_MARGIN,
  SLIDER_MARGIN_BOTTOM, SLIDER_WIDTH } from '../common/constants/CommonConstants';
import { changeSliderTime } from '../model/VideoModel';
import { RightActionBar } from './RightActionBar';
import { VideoProgress } from './VideoSlider';

@Component
export struct VideoView {
  private source: string | Resource = '';
  private controller: VideoController | undefined = undefined;
  @Provide currentStringTime: string = "";
  @Provide currentTime: number = 0;
  @Provide durationTime: number = 0;
  @Provide durationStringTime: string = "";
  @Provide isPlay: boolean = false;
  build() {
    RelativeContainer() {
      Video({
        src: this.source,
        controller: this.controller
      })
        .height(ALL_PERCENT)
        .width(ALL_PERCENT)
        .id('video')
        .alignRules({
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          top: { anchor: '__container__', align: VerticalAlign.Top }
        })
        .autoPlay(true)
        .loop(true)
        .controls(false)
        .onUpdate((event) => {
          if (event) {
            hilog.info(0x0000, "onUpdate", String(event.time))
            this.currentTime = event.time;
            this.currentStringTime = changeSliderTime(this.currentTime);
          }
        })
        .onPrepared((event) => {
          if (event) {
            hilog.info(0x0000, "onPrepared", String(event.duration))
            this.durationTime = event.duration;
            this.durationStringTime = changeSliderTime(event.duration);
          }
        })
        .onClick((event) => {
          if (this.isPlay) {
            if (this.controller !== undefined) {
              this.controller.pause()
            }
          } else {
            if (this.controller !== undefined) {
              this.controller.start()
            }
          }
        })
        .onPause(() =>
          this.isPlay = false
        )
        .onStart(() => {
          this.isPlay = true
        })

      Column() {
        VideoProgress({ controller: this.controller })
          .margin({ bottom: SLIDER_MARGIN_BOTTOM })
          .width(SLIDER_WIDTH)
      }
      .alignItems(HorizontalAlign.Center)
      .id('video_progress')
      .alignRules({
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
      })
      .width(ALL_PERCENT)

      RightActionBar()
        .id('right_action_bar')
        .alignRules({
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
          right: { anchor: '__container__', align: HorizontalAlign.End },
        })
        .width(RIGHT_ACTION_ICON_SIZE)
        .margin({bottom: RIGHT_ACTION_BOTTOM_MARGIN, right: RIGHT_ACTION_RIGHT_MARGIN})
    }
    .height(ALL_PERCENT)
    .width(ALL_PERCENT)
  }
}