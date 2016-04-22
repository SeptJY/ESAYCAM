//
//  JYRulesVIew.h
//  ESAYCAM
//
//  Created by Sept on 16/4/22.
//  Copyright © 2016年 九月. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYRulesView : UIView

@property (strong, nonatomic) UIImageView *focusView;

@property (strong, nonatomic) UIImageView *zoomView;

/** 切换对焦图片和zoom图片的显示 */
- (void)ruleViewImageViewHidden;

@end
