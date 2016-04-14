//
//  ViewController.m
//  ZBStepper
//
//  Created by 肖志斌 on 16/4/14.
//  Copyright © 2016年 ZB_Xiao. All rights reserved.
//

#import "ViewController.h"
#import "ZBStepperView.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) ZBStepperView *myStepperView;
@property (weak, nonatomic) IBOutlet UIButton *showBtn;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
/**
 *  宽高建议:105,32
 */
_myStepperView  = [ZBStepperView ZB_InitWithSupView:self.view];
[_myStepperView setUpMaxValue:100 minValue:13 currentValue:16 stepValue:10];
__weak typeof(self) weakSelf = self;
[_myStepperView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.offset(105);
    make.height.offset(32);
    make.centerX.equalTo(weakSelf.view.mas_centerX);
    make.centerY.equalTo(weakSelf.view.mas_centerY);
}];

_myStepperView.stepperViewValueBlock = ^(NSInteger value)
{
    [weakSelf.showBtn setTitle:[@(value) stringValue] forState:UIControlStateNormal];
};
    
}
- (IBAction)btnClick:(id)sender
{
    if (_myStepperView.isHidden)
    {
        [_myStepperView ZB_showStepperView];
    }
    else
    {
        [_myStepperView ZB_hideStepperView];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
