import router from '@ohos.router'
import Constant from '../common/constant'

@Entry
@Component
struct Register {
  @State username: string = 'lc'
  @State password: string = '123'
  @State email: string = '1234@qq.com'

  build() {
    Column() {
      Text('Please Register')
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
      TextInput({ text: this.email, placeholder: 'Email' })
        .width(Constant.INPUT_WIDTH)
        .height(Constant.INPUT_HEIGHT)
        .margin({ top: 20 })
        .onChange((val) => {
          this.email = val
          console.log('e', this.email)
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
      Button('Register')
        .width(Constant.BUTTON_WIDTH)
        .height(Constant.BUTTON_HEIGHT)
        .margin({ top: 30 })
        .backgroundColor(Constant.BUTTON_COLOR)
        .onClick(() => {
          router.pushUrl({ url: 'pages/Login' })
        })
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)

  }
}