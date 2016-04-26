//
//  JYSupportView.m
//  SeptEsayCam
//
//  Created by Sept on 16/4/5.
//  Copyright © 2016年 九月. All rights reserved.
//

#import "JYSupportView.h"

NSString * version(NSInteger value)
{
    NSString *str = [NSString stringWithFormat:@"%04ld", (long)value];
    NSMutableString *mStr = [NSMutableString stringWithString:str];
    if ([[mStr substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"0"]) {
        [mStr deleteCharactersInRange:NSMakeRange(0, 1)];
        
        [mStr insertString:@"." atIndex:1];
        [mStr insertString:@"." atIndex:3];
    } else{
        [mStr insertString:@"." atIndex:2];
        [mStr insertString:@"." atIndex:4];
    }
    
    return [NSString stringWithFormat:@"Version %@", mStr];
}

static void * HardVersion = &HardVersion;
static void * HardSoftVersion = &HardSoftVersion;

@interface JYSupportView ()

@property (strong, nonatomic) UIButton *imgBtn;

@property (strong, nonatomic) UIButton *nameBtn;

@property (strong, nonatomic) UILabel *appLabel;
@property (strong, nonatomic) UILabel *v_appLabel;

@property (strong, nonatomic) UILabel *yjLabel;
@property (strong, nonatomic) UILabel *v_yjLabel;

@property (strong, nonatomic) UILabel *threeLabel;   // 硬件软件版本
@property (strong, nonatomic) UILabel *v_threeLabel;

@end

@implementation JYSupportView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage) name:@"changeLanguage" object:nil];
        
        [[JYSeptManager sharedManager] addObserver:self forKeyPath:@"hardVersion" options:NSKeyValueObservingOptionNew context:HardVersion];
        
        [[JYSeptManager sharedManager] addObserver:self forKeyPath:@"hardSoftVersion" options:NSKeyValueObservingOptionNew context:HardSoftVersion];
        
        [[JYSeptManager sharedManager] addObserver:self forKeyPath:@"hardSoftVersion" options:NSKeyValueObservingOptionNew context:HardSoftVersion];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == HardVersion) {
        self.v_yjLabel.text = version([JYSeptManager sharedManager].hardVersion);
    } else if (context == HardSoftVersion) {
        self.v_threeLabel.text = version([JYSeptManager sharedManager].hardSoftVersion);
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)changeLanguage
{
    [self.nameBtn setTitle:[[JYLanguageTool bundle] localizedStringForKey:@"无线跟焦器" value:nil table:@"Localizable"] forState:UIControlStateNormal];
    
    self.yjLabel.text = [[JYLanguageTool bundle] localizedStringForKey:@"硬件版本:" value:nil table:@"Localizable"];
    
    self.threeLabel.text = [[JYLanguageTool bundle] localizedStringForKey:@"固件版本:" value:nil table:@"Localizable"];
}

- (UIButton *)imgBtn
{
    if (!_imgBtn) {
        
        _imgBtn = [[UIButton alloc] init];
        
        [_imgBtn addTarget:self action:@selector(pushEsaycamWebView) forControlEvents:UIControlEventTouchUpInside];
//        _imgBtn.backgroundColor = [UIColor cyanColor];
        [_imgBtn setImage:[UIImage imageNamed:@"home_suporrt_icon"] forState:UIControlStateNormal];
        
        [self addSubview:_imgBtn];
    }
    return _imgBtn;
}

- (UIButton *)nameBtn
{
    if (!_nameBtn) {
        
        _nameBtn = [[UIButton alloc] init];
        [_nameBtn setBackgroundImage:[UIImage imageNamed:@"home_support_btn_bg_icon"] forState:UIControlStateNormal];
        [_nameBtn setBackgroundImage:[UIImage imageNamed:@"home_support_btn_bg_icon_selected"] forState:UIControlStateHighlighted];
        [_nameBtn setTitle:NSLocalizedString(@"无线跟焦器", nil) forState:UIControlStateNormal];
        [_nameBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nameBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        _nameBtn.titleLabel.font = setFont(10);
        
        [_nameBtn addTarget:self action:@selector(pushEsaycamWebView) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_nameBtn];
    }
    return _nameBtn;
}

- (UILabel *)appLabel
{
    if (!_appLabel) {
        
        UIFont *font = (screenW == 480) ? setFont(13) : setFont(15);
        
        _appLabel = [self createLableWithText:@"ESAYCAME:" color:[UIColor yellowColor] font:font];
        _appLabel.textAlignment = NSTextAlignmentRight;
    }
    return _appLabel;
}

- (UILabel *)v_appLabel
{
    if (!_v_appLabel) {
        UIFont *font = (screenW == 480) ? setFont(11) : setFont(13);
        _v_appLabel = [self createLableWithText:version([JYSeptManager sharedManager].version) color:[UIColor whiteColor] font:font];
        
        [self addSubview:_v_appLabel];
    }
    return _v_appLabel;
}

- (UILabel *)yjLabel
{
    if (!_yjLabel) {
        UIFont *font = (screenW == 480) ? setFont(13) : setFont(15);
        _yjLabel = [self createLableWithText:@"硬件版本:" color:[UIColor yellowColor] font:font];
        _yjLabel.textAlignment = NSTextAlignmentRight;
    }
    return _yjLabel;
}

- (UILabel *)v_yjLabel
{
    if (!_v_yjLabel) {
        UIFont *font = (screenW == 480) ? setFont(11) : setFont(13);
        _v_yjLabel = [self createLableWithText:@"Version 1.1.0" color:[UIColor whiteColor] font:font];
    }
    return _v_yjLabel;
}

- (UILabel *)threeLabel
{
    if (!_threeLabel) {
        UIFont *font = (screenW == 480) ? setFont(13) : setFont(15);
        _threeLabel = [self createLableWithText:@"固件版本:" color:[UIColor yellowColor] font:font];
        _threeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _threeLabel;
}

- (UILabel *)v_threeLabel
{
    if (!_v_threeLabel) {
        UIFont *font = (screenW == 480) ? setFont(11) : setFont(13);
        _v_threeLabel = [self createLableWithText:@"Version 1.1.0" color:[UIColor whiteColor] font:font];
    }
    return _v_threeLabel;
}

- (UILabel *)createLableWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] init];
    
    label.text = NSLocalizedString(text, nil);
    label.textColor = color;
    label.font = font;
    
    [self addSubview:label];
    
    return label;
}

- (void)pushEsaycamWebView
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(pushEsaycamWebView)]) {
        [self.delegate pushEsaycamWebView];
    }
}

- (void)layoutSubviews
{
    CGFloat margin = 15;
    
    self.imgBtn.frame = CGRectMake(margin, margin, self.width * 0.5 - 30, self.height - 15);
    
    self.nameBtn.frame = CGRectMake((self.width * 0.5 - 120) * 0.5 + self.width * 0.5, self.height - 10 - 28, 120, 28);
    
    CGSize labelSize = [NSString sizeWithText:self.appLabel.text font:self.appLabel.font maxSize:CGSizeMake(200, 50)];
    CGFloat labelX = self.width * 0.5 + (self.width * 0.5 - 2 * labelSize.width) / 2;
    
    self.appLabel.frame = CGRectMake(labelX, 20, labelSize.width, labelSize.height);
    self.v_appLabel.frame = CGRectMake(self.appLabel.x + labelSize.width + 5, self.appLabel.y, labelSize.width, labelSize.height);
    
    CGFloat space = (self.nameBtn.y - 30 - 30 - 3 * labelSize.height) * 0.5;
    self.yjLabel.frame = CGRectMake(labelX, self.appLabel.y + self.appLabel.height + space, labelSize.width, labelSize.height);
    self.v_yjLabel.frame = CGRectMake(self.v_appLabel.x, self.yjLabel.y, labelSize.width, labelSize.height);
    
    self.threeLabel.frame = CGRectMake(labelX, self.yjLabel.y + self.yjLabel.height + space, labelSize.width, labelSize.height);
    self.v_threeLabel.frame = CGRectMake(self.v_appLabel.x, self.yjLabel.y + self.yjLabel.height + space, labelSize.width, labelSize.height);
}

- (void)dealloc
{
    [[JYSeptManager sharedManager] removeObserver:self forKeyPath:@"hardVersion" context:HardVersion];
    
    [[JYSeptManager sharedManager] removeObserver:self forKeyPath:@"HardSoftVersion" context:HardSoftVersion];
}

@end
