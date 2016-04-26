//
//  JYHomeController.h
//  ESAYCAM
//
//  Created by Sept on 16/4/22.
//  Copyright © 2016年 九月. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CoreBlueUseModel) {
    CoreBlueUseModelFocus,
    CoreBlueUseModelZOOM,
    CoreBlueUseModelDurationAndFucus,
    CoreBlueUseModelDurationAndZoom,
    CoreBlueUseModelRepeatRecording,
};

typedef NS_ENUM(NSUInteger, CamereFangDaModel) {
    CamereFangDaModelAuto,
    CamereFangDaModelLock,
    CamereFangDaModelHidden,
};

typedef NS_ENUM(NSUInteger, JYPhotoImgModel) {
    JYPhotoImgNone,
    JYPhotoImgPhtoto,
    JYPhotoImgTVPhtoto,
};

@interface JYHomeController : UIViewController

@property (assign, nonatomic) CoreBlueUseModel useModel;

@property (assign, nonatomic) CamereFangDaModel fangDaModel;

@property (assign, nonatomic) JYPhotoImgModel imgModel;

@end
