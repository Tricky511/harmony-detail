import hilog from '@ohos.hilog'
import { VideoItem } from '../common/bean/VideoItem'
import { ALL_PERCENT } from '../common/constants/CommonConstants'
import { SWIPER_VIDEOS } from '../viewmodel/VideoData'
import { VideoView } from './VideoView'

@Component
export struct SwiperVideo {
  private controller: VideoController | undefined = undefined;
  build() {
    Column() {
      Swiper() {
        ForEach(SWIPER_VIDEOS, (item: VideoItem) => {
          VideoView({ source: item.video, controller: this.controller })
        }, (item: VideoItem) => JSON.stringify(item))
      }
      .vertical(true)
      .indicator(false)
    }
    .width(ALL_PERCENT)
    .height(ALL_PERCENT)
    .backgroundColor($r('app.color.black'))
  }
}