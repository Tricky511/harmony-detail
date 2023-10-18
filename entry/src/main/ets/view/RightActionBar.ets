import { RightActionItem } from '../common/bean/RightActionItem';
import { RIGHT_ACTION_LIST } from '../common/constants/CommonConstants';
import { RightActionBarView } from './RightActionView';

@Component
export struct RightActionBar {
  build() {
    Column() {
      ForEach(RIGHT_ACTION_LIST, (item: RightActionItem) => {
        RightActionBarView({ rightActionItem: item })
      }, (item: RightActionItem) => JSON.stringify(item))
    }
  }
}