//
//  JYViewController.m
//  ESAYCAM
//
//  Created by Sept on 16/4/26.
//  Copyright © 2016年 九月. All rights reserved.
//

#import "JYViewController.h"

@interface JYViewController ()

@property (weak, nonatomic) IBOutlet UIButton *addView;
@property (weak, nonatomic) IBOutlet UIButton *minusView;
@property (weak, nonatomic) IBOutlet UIView *transView;

@property(nonatomic,strong)CALayer *myLayer;

@property (assign, nonatomic) int i;

@property (assign, nonatomic) CGFloat value;

@end

@implementation JYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //创建layer
    CALayer *myLayer=[CALayer layer];
    //设置layer的属性
    myLayer.bounds=CGRectMake(0, 0, 50, 80);
    myLayer.backgroundColor=[UIColor yellowColor].CGColor;
    myLayer.position=CGPointMake(50, 50);
    myLayer.anchorPoint=CGPointMake(0, 0);
    myLayer.cornerRadius=20;
    //添加layer
    [self.view.layer addSublayer:myLayer];
    self.myLayer=myLayer;
    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panOnClick:)];
//    
//    [self.view addGestureRecognizer:pan];
}

- (void)panOnClick:(UIPanGestureRecognizer *)panGesture
{
    if (panGesture.state == UIGestureRecognizerStateChanged || panGesture.state == UIGestureRecognizerStateEnded) {
        CGPoint translation = [panGesture translationInView:self.view];
        self.value += translation.y;
//        if (self.value >= 0) {
//            <#statements#>
//        }
        [self animationWith:self.value];
        NSLog(@"%f", self.value);
        
        [panGesture setTranslation:CGPointMake(0, 0) inView:self.view];
    }
}

- (void)animationWith:(CGFloat)value
{
    CABasicAnimation *anima=[CABasicAnimation animation];
    
    //1.1告诉系统要执行什么样的动画
    anima.keyPath=@"position";
    //设置通过动画，将layer从哪儿移动到哪儿
    anima.toValue=[NSValue valueWithCGPoint:CGPointMake(0, value)];
    
    //1.2设置动画执行完毕之后不删除动画
    anima.removedOnCompletion=NO;
    //1.3设置保存动画的最新状态
    anima.fillMode=kCAFillModeForwards;
    //2.添加核心动画到layer
    [self.myLayer addAnimation:anima forKey:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.i == 0) {
        //1.创建核心动画
        //    CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:<#(NSString *)#>]
        CABasicAnimation *anima=[CABasicAnimation animation];
        
        //1.1告诉系统要执行什么样的动画
        anima.keyPath=@"position";
        //设置通过动画，将layer从哪儿移动到哪儿
        anima.toValue=[NSValue valueWithCGPoint:CGPointMake(0, 300)];
        
        //1.2设置动画执行完毕之后不删除动画
        anima.removedOnCompletion=NO;
        //1.3设置保存动画的最新状态
        anima.fillMode=kCAFillModeForwards;
        //2.添加核心动画到layer
        [self.myLayer addAnimation:anima forKey:nil];
        NSLog(@"%@", NSStringFromCGRect(self.myLayer.frame));
        self.i = self.i+1;
    } else{
        CABasicAnimation *anima=[CABasicAnimation animation];
        
        //1.1告诉系统要执行什么样的动画
        anima.keyPath=@"position";
        //设置通过动画，将layer从哪儿移动到哪儿
        anima.toValue=[NSValue valueWithCGPoint:CGPointMake(0, 150)];
        
        //1.2设置动画执行完毕之后不删除动画
        anima.removedOnCompletion=NO;
        //1.3设置保存动画的最新状态
        anima.fillMode=kCAFillModeForwards;
        //2.添加核心动画到layer
        [self.myLayer addAnimation:anima forKey:nil];
        NSLog(@"%@", NSStringFromCGRect(self.myLayer.frame));
        self.i = 0;
    }
}

- (IBAction)minsOnclick:(id)sender
{
    NSLog(@"%@",NSStringFromCGRect(self.transView.frame));
    [UIView animateWithDuration:1 animations:^{
        self.transView.transform = CGAffineTransformMakeTranslation(0, -50);
    } completion:^(BOOL finished) {
        NSLog(@"%@",NSStringFromCGRect(self.transView.frame));
    }];
}
- (IBAction)addOnClick:(id)sender
{
    NSLog(@"%@",NSStringFromCGRect(self.transView.frame));
    [UIView animateWithDuration:1 animations:^{
        self.transView.transform = CGAffineTransformMakeTranslation(0, 50);
    } completion:^(BOOL finished) {
        NSLog(@"%@",NSStringFromCGRect(self.transView.frame));
    }];
}
@end
