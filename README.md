# ZBStepper



 ![image](https://github.com/k373379320/raw/master/ZBStepper.PNG)

-自定义Stepper

使用:
- import "ZBStepperView.h"

- _myStepperView  = [ZBStepperView ZB_InitWithSupView:self.view];

- [_myStepperView setUpMaxValue:100 minValue:13 currentValue:16 stepValue:10];

- 设置位置,大小

- @property (nonatomic, copy) ZBStepperViewValueBlock stepperViewValueBlock;