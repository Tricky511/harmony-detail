import { RightActionItem } from '../bean/RightActionItem';

export const ALL_PERCENT: string = '100%';

export const SLIDER_MARGIN_BOTTOM: number = 3;

export const SLIDER_WIDTH: string = '90%';

export const COMMON_NUM_MINUTE: number = 60;

export const COMMON_NUM_DOUBLE: number = 10;

export const ZERO_STR: string = '0';

export const SPLIT: string = ':';

export const SLIDER_START_OPACITY: number = 0.6;

export const SLIDER_PAUSE_OPACITY: number = 1;

export const TEXT_START_OPACITY: number = 0;

export const TEXT_PAUSE_OPACITY: number = 0.8;

export const FONT_SIZE: number = 18;

export const SLIDER_BLOCK_SIZE: SizeOptions = {width: 5, height: 5}

export const RIGHT_ACTION_ICON_SIZE: number = 56;

export const RIGHT_ACTION_ITEM_MARGIN: number = 10;

export const RIGHT_ACTION_BOTTOM_MARGIN: number = 200;

export const RIGHT_ACTION_RIGHT_MARGIN: number = 20;

export const RIGHT_ACTION_LIST: RightActionItem[] = [
  new RightActionItem('点赞', $r('app.media.like'), '999'),
  new RightActionItem('评论', $r('app.media.comment'), '123'),
  new RightActionItem('收藏', $r('app.media.collect'), '456'),
]