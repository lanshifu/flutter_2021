// Autogenerated from Pigeon (v0.2.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class FLTDemoReply;
@class FLTDemoRequest;

@interface FLTDemoReply : NSObject
@property(nonatomic, copy, nullable) NSString * result;
@end

@interface FLTDemoRequest : NSObject
@property(nonatomic, copy, nullable) NSString * methodName;
@end

@protocol FLTPigeonDemoApi
-(nullable FLTDemoReply *)getMessage:(FLTDemoRequest*)input error:(FlutterError *_Nullable *_Nonnull)error;
-(nullable FLTDemoReply *)getDeviceId:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void FLTPigeonDemoApiSetup(id<FlutterBinaryMessenger> binaryMessenger, id<FLTPigeonDemoApi> _Nullable api);

NS_ASSUME_NONNULL_END
