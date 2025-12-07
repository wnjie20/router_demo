
import { MyFlutterPage } from './MyFlutterPage';

@Entry
@Component
struct Index {
  pathStack:NavPathStack = new NavPathStack()

  @Builder
  routeMap(pathName:string){
    if(pathName==='MyFlutterPage'){
      MyFlutterPage()
    }
  }

  build() {
    Navigation(this.pathStack){
      Column() {
        Text("ArkUI Page")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 50 });

        Button("Push to Flutter Page")
          .onClick(() => {
          let param:Record<string, Object>={'route':'/'};
          this.pathStack.pushPathByName('MyFlutterPage',param)
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center);
    }.navDestination(this.routeMap)

  }
}