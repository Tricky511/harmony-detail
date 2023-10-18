
export class RightActionItem {
  name: string;
  image: Resource;
  count: string;

  constructor(name: string, image: Resource, count: string) {
    this.name = name;
    this.image = image;
    this.count = count;
  }
}