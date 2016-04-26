//
//  JYCameraManager.h
//  Esaycamera
//
//  Created by Sept on 16/4/8.
//  Copyright © 2016年 九月. All rights reserved.
//

#import <GPUImage/GPUImage.h>

@protocol JYCameraManagerDelegate <NSObject>

@optional
- (void)cameraManagerRecodingSuccess:(NSURL *)url;

- (void)cameraManageTakingPhotoSucuess:(NSData *)data;

@end

typedef void(^CanSetSessionPreset)(BOOL isCan);

typedef void(^JYLableText)(NSString *text);

@interface JYCameraManager : GPUImageVideoCamera

@property (weak, nonatomic) id<JYCameraManagerDelegate>cameraDelegate;

@property (nonatomic, strong) GPUImageSaturationFilter *filter;
- (void)startCamera;
- (void)stopCamera;

@property (nonatomic , strong) GPUImageStillCamera *camera;

@property (strong, nonatomic) GPUImageView *subPreview;

- (instancetype)initWithFrame:(CGRect)frame superview:(UIView *)superview;

- (void)takePhoto;

- (void)startVideo;

- (void)stopVideo;

- (void)cameraManagerChangeFoucus:(CGFloat)value;

/** 设置曝光时间和感光度 */
- (void)videoCameraWithExposureTime:(CGFloat)time andIso:(CGFloat)iso;
/** 设置相机拍摄质量 */
- (void)cameraManagerEffectqualityWithTag:(NSInteger)tag withBlock:(CanSetSessionPreset)canSetSessionPreset;
/** 设置相机的曝光模式 */
- (void)exposeMode:(AVCaptureExposureMode)exposureMode;
/** 设置相机的白平衡模式 */
- (void)whiteBalanceMode:(AVCaptureWhiteBalanceMode)whiteBalanceMode;

/** 设置闪光灯 */
@property (nonatomic,assign,getter=isFlashEnabled) BOOL enableFlash;

#pragma mark -------------------------> 设置曝光补偿
// 设置曝光属性  ---> 曝光补偿
- (void)cameraManagerWithExposure:(CGFloat)value;

- (void)cameraManagerVideoZoom:(CGFloat)zoom;

- (void)cameraManagerSetWhiteBalanceGains:(AVCaptureWhiteBalanceGains)gains;

- (void)cameraManagerBalanceGainsWithTemp:(CGFloat)temp andTint:(CGFloat)tint;

@property (assign, nonatomic) CGSize videoSize;

@property (assign, nonatomic) BOOL tempAuto;
@property (assign, nonatomic) BOOL tintAuto;
@property (assign, nonatomic) BOOL isoAuto;
@property (assign, nonatomic) BOOL timeAuto;

@property (assign, nonatomic) CGFloat temp;
@property (assign, nonatomic) CGFloat tint;

@property (assign, nonatomic) BOOL imgHidden;

- (void)cameraManagerExposureIOS:(CGFloat)iso;

- (void)setExposureDurationWith:(CGFloat)value withBlock:(JYLableText)text;

@end
