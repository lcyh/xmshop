interface ListItem {
  id: string;
  title: string;
  content: string;
  color: string;
}

@Entry
@Component
export struct Cate {
  @State num: number = 0
  @State flag: boolean = true
  @State list: ListItem[] = [
    {
      id: "1",
      title: "鸿蒙os",
      content: "鸿蒙os",
      color: '#ff9f76cf'
    },
    {
      id: "2",
      title: "flutter",
      content: "flutter",
      color: '#ff72c147'
    }
    ,
    {
      id: "3",
      title: "golang",
      content: "golang",
      color: '#ffc34fa9'
    }
  ]

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Column() {
        Row() {
          Button(`${this.flag ? '隐藏' : '显示'}`).onClick((event: ClickEvent) => {
            this.flag = !this.flag;
          })
          if (this.flag) {
            Text(`你好`)
              .fontSize(24)
              .width(100)
              .height(40)
              .textAlign(TextAlign.Center)
              .backgroundColor("green")
              .borderRadius(20)
          }
        }
        .width('100%')
        .height(60)
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Start)

        List({ space: 10 }) {
          ForEach(this.list, (item: ListItem, key) => {
            ListItem() {
              Text(`${item.title}--id=${item.id}--key=${key}`)
                .fontSize(24)
                .width('100%')
                .height(60)
                .textAlign(TextAlign.Center)
                .backgroundColor(item.color)
                .borderRadius(20)
            }
          }, item => item)
        }

        Button({ type: ButtonType.Capsule }) {
          Text(`当前数值:${this.num}`).fontColor(Color.White).fontSize(20)
        }
        .width('100%')
        .height(40)
        .margin({ top: 10 })
      }.height('100%')
      .width('100%')
      .padding(10)

      Button({ type: ButtonType.Capsule }) {
        Text('+').fontColor(Color.White)
      }
      .width(50)
      .height(50)
      .margin({ right: 30, bottom: 30 })
      .onClick(() => {
        this.num++
      })
    }
  }
}