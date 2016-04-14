//
//  ZBStepperView.h
//  XZBTest
//
//  Created by 肖志斌 on 16/4/14.
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

/**
 *  显示/隐藏
 */
- (void)ZB_showStepperView;
- (void)ZB_hideStepperView;

/**
 *  统一设置
 */
- (void)setUpMaxValue:(NSInteger)max minValue:(NSInteger)min currentValue:(NSInteger)cur stepValue:(NSInteger)step;


@end
