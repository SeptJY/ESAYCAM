//
//  JYTestView.m
//  ESAYCAM
//
//  Created by Sept on 16/4/25.
//  Copyright © 2016年 九月. All rights reserved.
//

#import "JYTestView.h"

@interface JYTestView ()


@end

@implementation JYTestView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"JYTestView" owner:nil options:nil] lastObject];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
