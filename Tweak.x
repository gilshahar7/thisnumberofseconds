//#include <RemoteLog.h>

@interface AVButton
@property (nonatomic,readonly) NSString *imageName;
@end

@interface AVPlaybackControlsController
@property (nonatomic,readonly) CGFloat currentTime;
-(void)scrubToTime:(CGFloat)arg1 resolution:(CGFloat)arg2;
@end

%hook AVPlaybackControlsController
-(void)skipButtonTouchUpInside:(AVButton *)arg1{
  //RLog(@"imageName: %@", arg1.imageName);
  if([arg1.imageName isEqualToString:@"FullScreen_SkipForward15"]){
    [self scrubToTime:self.currentTime + 5 resolution:0];
  }else if([arg1.imageName isEqualToString:@"FullScreen_SkipBack15"]){
    [self scrubToTime:self.currentTime - 5 resolution:0];
  }
  //%orig;
}
%end
