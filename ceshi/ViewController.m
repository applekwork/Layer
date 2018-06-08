//
//  ViewController.m
//  ceshi
//
//  Created by 郭立军 on 2018/5/18.
//  Copyright © 2018年 com.guolijun.daofeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *dynamicView;
@property (nonatomic, strong) CAShapeLayer *indicateLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dynamicView.backgroundColor = [UIColor grayColor];
    _dynamicView.layer.borderColor = [UIColor blackColor].CGColor;
    _dynamicView.layer.borderWidth = 2;
    _dynamicView.layer.cornerRadius = 5;
    _dynamicView.clipsToBounds = YES;
    NSTimer *timer =  [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(refresh) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
- (void)refresh {
    [self refreshUIWithVoicePower:arc4random()% 10];

}
-(void)refreshUIWithVoicePower : (NSInteger)voicePower{
    CGFloat height = (voicePower)*(CGRectGetHeight(_dynamicView.frame)/10);
    [_indicateLayer removeFromSuperlayer];
    _indicateLayer = nil;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, CGRectGetHeight(_dynamicView.frame)-height, CGRectGetWidth(_dynamicView.frame), height) cornerRadius:0];
    _indicateLayer = [CAShapeLayer layer];
    _indicateLayer.path = path.CGPath;
    _indicateLayer.fillColor = [UIColor whiteColor].CGColor;
    [_dynamicView.layer addSublayer:_indicateLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
