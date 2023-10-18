import { SwiperVideo } from '../view/VideoSwiper'

@Entry
@Component
struct SlideIndex {
  private controller: VideoController | undefined = new VideoController();
  @State message: string = 'Hello World'

  onPageShow() {
    if (this.controller !== undefined) {
      this.controller.start()
    }
  }

  build() {
    Tabs() {
      TabContent() {
        SwiperVideo({ controller: this.controller })
      }.tabBar('上下滑')
      TabContent() {
      }.tabBar('未实现')
      TabContent() {
      }.tabBar('未实现')
    }
    .barHeight(50)
    .width('100%')
    .height('100%')
  }
}