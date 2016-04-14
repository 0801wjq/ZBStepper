//
//  ZBStepperView.h
//  XZBTest
//
//  Created by zonelue004 on 16/4/14.
//  Copyright © 2016年 xzb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZBStepperViewValueBlock)(NSInteger value);
@interface ZBStepperView : UIView


@property (nonatomic, assign) NSInteger currentValue;/**< 默认50 */
@property (nonatomic, assign) NSInteger maxValue;/**< 默认100 */
@property (nonatomic, assign) NSInteger minValue;/**< 默认0 */
@property (nonatomic, assign) NSInteger step;/**< 每次变化的值,默认为1 */
@property (nonatomic, copy) ZBStepperViewValueBlock stepperViewValueBlock;

- (instancetype)initWithSupView:(UIView *)supView;
+ (instancetype)ZB_InitWithSupView:(UIView *)supView;


- (void)ZB_showStepperView;
- (void)ZB_hideStepperView;

@end
