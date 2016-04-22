//
//  JYRulesVIew.m
//  ESAYCAM
//
//  Created by Sept on 16/4/22.
//  Copyright © 2016年 九月. All rights reserved.
//

#import "JYRulesView.h"

float range()
{
    return (screenH -30) * 0.5;
}

@interface JYRulesView ()

@property (strong, nonatomic) CALayer *showLayer;

@end

@implementation JYRulesView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }
    return self;
}

- (CALayer *)showLayer
{
    if (!_showLayer) {
        
        _showLayer = [CALayer layer];
        
        //设置需要显示的图片
        _showLayer.contents=(id)[UIImage imageNamed:@"home_i_show_view_icon"].CGImage;
        
        [self.layer insertSublayer:_showLayer below:self.focusView.layer];
    }
    return _showLayer;
}

- (UIImageView *)focusView
{
    if (!_focusView) {
        
        _focusView = [JYRulesView createImageViewWithImage:@"yibei_duijiao_keduchi"];
        
        [self addSubview:_focusView];
    }
    return _focusView;
}

- (UIImageView *)zoomView
{
    if (!_zoomView) {
        
        _zoomView = [JYRulesView createImageViewWithImage:@"home_dz_rule_icon"];
        _zoomView.hidden = YES;
        
        [self addSubview:_zoomView];
    }
    return _zoomView;
}

- (void)ruleViewImageViewHidden
{
    self.focusView.hidden = !self.focusView.hidden;
    self.zoomView.hidden = !self.zoomView.hidden;
}

+ (UIImageView *)createImageViewWithImage:(NSString *)image
{
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.image = [UIImage imageNamed:image];
    imageView.layer.opacity = ([[NSUserDefaults standardUserDefaults] floatForKey:@"opacity"] == 0) ? 1 : [[NSUserDefaults standardUserDefaults] floatForKey:@"opacity"];
    imageView.opaque = NO;
    
    return imageView;
}

- (void)layoutSubviews
{
    self.focusView.frame = self.bounds;
    self.zoomView.frame = CGRectMake(0, -range(), self.width, self.height);
    
    CGFloat layerH = 30;
    self.showLayer.frame = CGRectMake(0, (self.height - layerH) * 0.5, self.width, layerH);
}

@end
