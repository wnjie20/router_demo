import {ExclusiveAppComponent,FlutterManager} from '@ohos/flutter_ohos'
import UIAbility from '@ohos.app.ability.UIAbility'
import AbilityConstant from '@ohos.app.ability.AbilityConstant'
import Want from '@ohos.app.ability.Want'
import window from '@ohos.window';

export default class EntryAbility extends UIAbility implements ExclusiveAppComponent<UIAbility>{
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    FlutterManager.getInstance().pushUIAbility(this)
  }

  onDestroy(): void | Promise<void> {
    FlutterManager.getInstance().popUIAbility(this)
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.getMainWindowSync().setWindowLayoutFullScreen(true)
    FlutterManager.getInstance().pushWindowStage(this, windowStage);
    windowStage.loadContent('pages/Index')
  }

  onWindowStageDestroy(): void {
    FlutterManager.getInstance().popWindowStage(this)
  }

  detachFromFlutterEngine(): void {

  }
  getAppComponent(): UIAbility {
    return this;
  }
}