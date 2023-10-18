import { RightActionItem } from '../common/bean/RightActionItem';
import { RIGHT_ACTION_ICON_SIZE,
  RIGHT_ACTION_ITEM_MARGIN} from '../common/constants/CommonConstants';


@Component
export struct RightActionBarView {
  private rightActionItem: RightActionItem | undefined = undefined;
  @State showPopup: boolean = false
  @Builder popupBuilder(name: string) {
    Column({ space: 2 }) {
      Text(name).fontSize(16)
    }
    .padding({
      top: 10,
      bottom: 10,
      left: 15,
      right: 15
    })
    .alignItems(HorizontalAlign.Center)
  }
  build() {
    Column() {
      Image(this.rightActionItem !== undefined ? this.rightActionItem.image : $r('app.string.empty'))
        .width(RIGHT_ACTION_ICON_SIZE)
        .width(RIGHT_ACTION_ICON_SIZE)
      Text(this.rightActionItem !== undefined ? this.rightActionItem.count : $r('app.string.empty'))
        .margin({ bottom: RIGHT_ACTION_ITEM_MARGIN })
    }
    .onClick(() => {
      if (!this.showPopup) {
        this.showPopup = true;
        setTimeout(() => {
          this.showPopup = false
        }, 3000);
      }
    })
    .bindPopup(this.showPopup, {
      builder: this.popupBuilder(this.rightActionItem !== undefined ? this.rightActionItem.name : ''),
      placement: Placement.Top,
      maskColor: 0x33000000,
      popupColor: Color.White,
    })
  }
}