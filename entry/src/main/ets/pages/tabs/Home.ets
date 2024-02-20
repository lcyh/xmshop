import { BestCateItemProps } from '../../Models/BestCate'
import { BestCateListData } from '../../Models/MockData'

@Preview
@Component
export struct Home {
  @State searchVal: string = '123'
  @State categoryList: BestCateItemProps[] = BestCateListData
  scroller: Scroller = new Scroller()
  @State scrollY: number = 0
  //自定义组件必须使用根组件来包裹
  @Builder
  AppBarWidget() {
    Column() {
      //导航
      Row() {
        if (this.scrollY < 60)
          Image($r("app.media.xiaomi_icon"))
            .width('88lpx')
            .height("88lpx")
            .fillColor(Color.White)
            .margin({ right: '44lpx' })

        Row() {
          Search({ value: this.searchVal,
            placeholder: '手机' })
            .height('96lpx')
            .backgroundColor('#FCF3EC')
            .placeholderColor(Color.Grey)
            .placeholderFont({ size: "38lpx", weight: 400 })
            .textFont({ size: "38lpx", weight: 400 })
            .onChange((value: string) => {
              console.log('搜索', value)
              this.searchVal = value
            })
            .margin({
              right: "44lpx"
            })
        }
        // .layoutWeight(1)
        .width(this.scrollY > 60 ? '380lpx' : '280lpx')
        .animation({
          duration: 500,
          playMode: PlayMode.Alternate
        })

        Row() {
          Image($r("app.media.qrcode_icon")).width('66lpx').height("66lpx").fillColor(Color.White)
          Image($r("app.media.message_icon")).width('66lpx').height("66lpx").fillColor(Color.White)
            .margin({
              left: "54lpx"
            })
        }.width("200lpx")
      }
      .width("100%")
      .height("140lpx")
      .padding({
        left: "34lpx",
        right: "34lpx"
      })
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor(this.scrollY > 60 ? '#000' : Color.Transparent)
      .opacity(this.scrollY > 60 ? .5 : 1)
    }
  }

  //轮播图
  @Builder
  SwiperWidget() {
    Swiper() {
      Image("https://miapp.itying.com/public/upload/zon0TTXnXUs1z5meqZhP5aNF.png")
        .width('100%')
        .objectFit(ImageFit.Contain)
      Image("https://miapp.itying.com/public/upload/-sXMTb2kFHmRlt2BAtI47_54.png")
        .width('100%')
        .objectFit(ImageFit.Contain)
      Image("https://miapp.itying.com/public/upload/NssHlEUvoWU36EpuF3S1URMB.png")
        .width('100%')
        .objectFit(ImageFit.Contain)
    }
    .autoPlay(true)
    .interval(3000)
    .loop(true)
    .width("100%")
  }

  //推荐分类
  @Builder
  BestCateWidget() {
    Column() {
      Image($r("app.media.xiaomi_banner")).height("92lpx").width("100%").objectFit(ImageFit.Contain)
      Row() {
        Grid() {
          ForEach(this.categoryList, (item: BestCateItemProps) => {
            GridItem() {
              Column() {
                Image(item.imgUrl)
                  .width("160lpx")
                  .height("160lpx")
                Text(item.title).fontSize("38lpx")
              }.alignItems(HorizontalAlign.Center)
              .width("100%")
              .height("100%")
            }
          })
        }
        .rowsTemplate("1fr 1fr")
        .columnsTemplate("1fr 1fr 1fr 1fr 1fr")
        .rowsGap("10lpx")
        .columnsGap("20lpx")
        .height("340lpx")
        .width("100%")
      }
      .padding("20lpx")
      .backgroundColor(Color.White)
    }
  }

  //内容区域
  @Builder
  BodyWidget() {
    Column() {
      Scroll(this.scroller) {
        Column() {
          this.SwiperWidget()
          this.BestCateWidget()
          this.BestCateWidget()
          this.BestCateWidget()
          this.BestCateWidget()
        }.width("100%")
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(0) // 滚动条宽度
      .edgeEffect(EdgeEffect.None)
      .onScroll((xOffset: number, yOffset: number) => {
        this.scrollY = this.scroller.currentOffset().yOffset + yOffset
        console.info('滚动', xOffset + ' ' + yOffset)
        console.log('this.scrollY', this.scrollY)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge', side)
      })
    }
    .width("100%")
    .height("100%")
    .backgroundColor('#f5f5f5')
  }

  build() {
    Stack({
      alignContent: Alignment.Top
    }) {

      this.BodyWidget()
      this.AppBarWidget()
    }
  }
}