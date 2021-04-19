#import "Tweak.h"

@interface SBIconBadgeView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface _UIStatusBar
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBFolderIconImageView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@property (nonatomic, strong, readwrite) UIView *backgroundView;
@end

@interface SBHLibraryCategoryPodBackgroundView : UIView
@end

//HideDock
%hook SBDockView
-(void)setBackgroundAlpha:(double)arg1 {
%orig(0);
}

%end


//Hide App Library Pods
%hook SBHLibraryCategoryPodBackgroundView
-(void)didMoveToWindow {
self.hidden = YES;
}
%end

//Hide Search Bar in app library
%hook SBHSearchTextField
-(id)initWithFrame:(struct CGRect)arg1{
 return NULL;
}
%end

//DieBackground Elements
%hook  SBFolderBackgroundView
- (id)initWithFrame:(struct CGRect)arg1{
  return NULL;
}
%end

%hook SBFolderController
-(BOOL)_homescreenAndDockShouldFade{
     return YES;
}
%end


%hook SBFolderIconImageView
-(void)setNeedsLayout{
self.backgroundView.hidden = YES;
}
%end


%hook SBFolderControllerBackgroundView
-(id)initWithFrame:(CGRect)arg1{
return NULL;
}
%end


%hook SBFolderIconImageView
-(id)_folderIconImageCache{
return NULL;
}
%end

%hook SBFolderIconImageView
-(void)setBackgroundView:(UIView *)arg1{
self.backgroundView.hidden = YES;
}
%end


//Hide labels
%hook SBIconView 
-(void)setLabelHidden:(BOOL)arg1 {
    return %orig(YES);
}
%end

//Hide statusbar
%hook _UIStatusBar
- (void)didMoveToWindow{
	%orig;
	self.hidden = NO;
}
%end



//No Badges
%hook SBIconBadgeView
- (void)didMoveToWindow{
	%orig;
	self.hidden = YES;
}
%end


//Hide Folder Titles
%hook SBFolderTitleTextField
-(id)initWithFrame:(CGRect)arg1{
	return NULL;
}
%end




