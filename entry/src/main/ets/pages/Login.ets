import router from '@ohos.router'
import Constant from '../common/constant'

@Entry
@Component
struct Login {
  @State username: string = 'lc'
  @State password: string = '123'

  build() {
    Column() {
      Text('Please Login')
        .width('100%')
        .textAlign(TextAlign.Center)
        .fontSize(Constant.LOGIN_SIZE)
        .fontColor(Constant.LOGIN_COLOR)
      TextInput({ text: this.username, placeholder: 'Username' })
        .width(Constant.INPUT_WIDTH)
        .height(Constant.INPUT_HEIGHT)
        .margin({ top: 20 })
        .onChange((val) => {
          this.username = val
          console.log('e', this.username)
        })
      TextInput({ text: this.password, placeholder: 'Password' })
        .type(InputType.Password)
        .width(Constant.INPUT_WIDTH)
        .height(Constant.INPUT_HEIGHT)
        .margin({ top: 20 })
        .onChange((val) => {
          this.password = val
          console.log('e', this.password)
        })
      Button('Login in')
        .width(Constant.BUTTON_WIDTH)
        .height(Constant.BUTTON_HEIGHT)
        .margin({ top: 30 })
        .backgroundColor(Constant.BUTTON_COLOR)
        .onClick(() => {
          console.log('登录', JSON.stringify({ username: this.username, password: this.password }))
          router.pushUrl({ url: 'pages/Index' })
        })
      Flex() {
        Text(`Don't have an account yet? `)
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Regular)
        Text('To Register')
          .fontColor(Constant.BUTTON_COLOR)
          .margin({ left: 5 })
          .onClick(()=>{
            router.pushUrl({url:'pages/Register'})
          })
      }
      .margin({ top: 10 })
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)

  }
}