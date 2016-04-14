//
//  ZBStepperView.m
//  XZBTest
//
//  Created by zonelue004 on 16/4/14.
//  Copyright © 2016年 xzb. All rights reserved.
//

#import "ZBStepperView.h"

@interface ZBStepperView ()

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UITextField *showTextField;

@end

@implementation ZBStepperView


- (instancetype)initWithSupView:(UIView *)supView
{
    self = [super init];
    if (self)
    {
        if (supView)
        {
            [supView addSubview:self];
            
            [self sInit];
        }
    }
    return self;
}
+ (instancetype)ZB_InitWithSupView:(UIView *)supView
{
    return [[[self class] alloc] initWithSupView:supView];
}
- (void)sInit
{
    self.layer.cornerRadius = 32/2;
    self.layer.masksToBounds = YES;
    _maxValue = 100;
    _minValue = 0;
    _step = 1;
    _currentValue = 50;
    
    self.backgroundColor = [UIColor colorWithWhite:0.945 alpha:1.000];
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftBtn setImage:[UIImage imageNamed:@"stepperLeft"] forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_leftBtn];
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.width.offset(32);
        make.height.offset(32);
    }];
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_rightBtn setImage:[UIImage imageNamed:@"stepperRight"] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_rightBtn];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.offset(0);
        make.width.offset(32);
        make.height.offset(32);
    }];
    
    __weak typeof(self) weakSelf = self;
    _showTextField = [[UITextField alloc] init];
    _showTextField.textColor = [UIColor colorWithWhite:0.196 alpha:1.000];
    _showTextField.textAlignment = NSTextAlignmentCenter;
    _showTextField.text = @"50";
    _showTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:_showTextField];
    [_showTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftBtn.mas_right);
        make.right.equalTo(weakSelf.rightBtn.mas_left);
        make.height.equalTo(weakSelf.leftBtn.mas_height);
        make.top.offset(0);
    }];
    
    [_showTextField addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
}
- (void)dealloc
{
    [_showTextField removeObserver:self forKeyPath:@"text"];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([object isKindOfClass:[UITextField class]])
    {
        NSInteger curValue = 0;
        if (![_showTextField.text isPureInt])
        {
            id oldValue = change[NSKeyValueChangeOldKey];
            curValue = [oldValue integerValue];
        }
        else
        {
            curValue = [_showTextField.text integerValue];
            if (curValue > _maxValue)
            {
                curValue = _maxValue;
            }
            if (curValue < _minValue)
            {
                curValue = _minValue;
            }
            _currentValue = curValue;
        }

        if (_stepperViewValueBlock)
        {
            _stepperViewValueBlock(curValue);
        }
        
        if ([self.showTextField.text integerValue] != curValue)
        {
            self.showTextField.text = [@(curValue) stringValue];
        }
    }
}
- (void)leftBtnClick
{
    self.currentValue = self.currentValue - _step;
}
- (void)rightBtnClick
{
    self.currentValue = self.currentValue + _step;
}
- (void)setCurrentValue:(NSInteger)currentValue
{
    if (currentValue < _minValue)
    {
        currentValue = _minValue;
    }
    if (currentValue > _maxValue)
    {
        currentValue = _maxValue;
    }
    
    _currentValue = currentValue;
    
    [self sShowTextFieldText:currentValue];
}
- (void)sShowTextFieldText:(NSInteger)value
{
    if (value >= _minValue && value <=_maxValue )
    {
        _showTextField.text = [@(value) stringValue];
    }
}
- (void)ZB_showStepperView
{
    UIView *supView = self.superview;
    
    if (supView)
    {
        [self setHidden:NO];
        [supView bringSubviewToFront:self];
    }
}
- (void)ZB_hideStepperView
{
    [self setHidden:YES];
}

@end
