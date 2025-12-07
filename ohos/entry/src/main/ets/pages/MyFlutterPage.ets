
import { FlutterEntry, FlutterPage, FlutterView } from '@ohos/flutter_ohos';
import { common } from '@kit.AbilityKit';


@Component
export struct MyFlutterPage {
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext
  private flutterEntry:FlutterEntry | null=null;
  private flutterView?:FlutterView
  pathStack: NavPathStack | undefined

  build() {
    NavDestination(){
      FlutterPage({ viewId: this.flutterView?.getId() })
    }
    .hideTitleBar(true)
    .onReady((context)=>{
      this.init(context)
    })
    .onDisAppear(()=>{
      this.flutterEntry?.aboutToDisappear()
    })
    .onShown(()=>{
      this.flutterEntry?.onPageShow()
    })
    .onHidden(()=>{
      this.flutterEntry?.onPageHide()
    })
    .onBackPressed(()=>{
      console.log('[MyFlutterPage] onBackPressed()')
      this.context.eventHub.emit('EVENT_BACK_PRESS')
      return true
    })
  }

  init(context: NavDestinationContext){
    this.pathStack = context.pathStack;
    let params:Record<string, Object> = this.pathStack.getParamByName('MyFlutterPage')[0] as Record<string,Object>
    this.flutterEntry = new NavFlutterEntry(this.getUIContext().getHostContext()!,params,this.pathStack);
    this.flutterEntry?.aboutToAppear()
    this.flutterView = this.flutterEntry?.getFlutterView()
  }
}

export class NavFlutterEntry extends FlutterEntry{
  private pathStack:NavPathStack;

  constructor(context:Context,params:Record<string, Object>={},pathStack:NavPathStack) {
    super(context,params)
    this.pathStack=pathStack;
  }
  popSystemNavigator(): boolean {
    if(this.pathStack){
      console.log('[MyFlutterPage] popSystemNavigator return true')
      this.pathStack.pop();
      return true;
    }
    console.log('[MyFlutterPage popSystemNavigator return false')
    return false;
  }
}