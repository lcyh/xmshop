import { Home } from './tabs/Home';
import { Cate } from './tabs/Cate';

@Entry
@Component
struct Index {
  tabController: TabsController = new TabsController()
  @State currentIndex: number = 0;

  @Builder
  TabBuilder(title: string, targetIndex: number, normalImg: Resource, selectedImg: Resource) {
    Column() {
      Image(this.currentIndex == targetIndex ? selectedImg : normalImg)
        .width("50lpx")
        .height("50lpx")
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#d81e06' : '#8a8a8a')
        .fontSize(16)
        .fontWeight(this.currentIndex === targetIndex ? 500 : 400)
        .padding({
          top: "10lpx"
        })
    }
    .width('100%')
    .height("150lpx")
    .padding({ top: '10lpx' })
    .justifyContent(FlexAlign.Start)
  }

  build() {
    Column() {
      Tabs({
        barPosition: BarPosition.End, //底部导航
        controller: this.tabController
      }) {
        TabContent() {
          Home()
        }.tabBar(this.TabBuilder("首页", 0, $r("app.media.home_icon"), $r("app.media.home_selected_icon")))

        TabContent() {
          // Text('Cate')
          Cate()
        }.tabBar(this.TabBuilder("分类", 1, $r("app.media.cate_icon"), $r("app.media.cate_selected_icon")))

        TabContent() {
          Text('Service')
        }.tabBar(this.TabBuilder("服务", 2, $r("app.media.service_icon"), $r("app.media.service_selected_icon")))

        TabContent() {
          Text('Cart')
        }.tabBar(this.TabBuilder("购物车", 3, $r("app.media.cart_icon"), $r("app.media.cart_selected_icon")))

        TabContent() {
          Text('User')
        }.tabBar(this.TabBuilder("用户", 4, $r("app.media.user_icon"), $r("app.media.user_selected_icon")))
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .animationDuration(400)
      .barHeight(56)
      .margin(10)
      .onChange((index) => {
        this.currentIndex = index
        console.log('index', index.toString())
      })
    }
    .width('100%')
    .height('100%')
  }
}