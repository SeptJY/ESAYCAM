//
//  JYTestView.m
//  ESAYCAM
//
//  Created by Sept on 16/4/25.
//  Copyright © 2016年 九月. All rights reserved.
//

#import "JYTestView.h"

@interface JYTestView ()

@property (weak, nonatomic) IBOutlet UILabel *jizhundian;

@property (weak, nonatomic) IBOutlet UILabel *keyongfanwei;

@property (weak, nonatomic) IBOutlet UILabel *f_yQian;

@property (weak, nonatomic) IBOutlet UILabel *z_yQian;
@property (weak, nonatomic) IBOutlet UILabel *f_yHou;
@property (weak, nonatomic) IBOutlet UILabel *z_yHou;
@property (weak, nonatomic) IBOutlet UILabel *f_xianweihou;
@property (weak, nonatomic) IBOutlet UILabel *z_xianweihou;
@property (weak, nonatomic) IBOutlet UILabel *fcous;
@property (weak, nonatomic) IBOutlet UILabel *zoom;
@property (weak, nonatomic) IBOutlet UILabel *duijaozhi;
@property (weak, nonatomic) IBOutlet UILabel *lada;
@end

@implementation JYTestView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"JYTestView" owner:nil options:nil] lastObject];
        
    }
    return self;
}

@end
