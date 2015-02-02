//
//  EGYWebViewController.m
//
//  Created by Mokhles Hussien on 30.01.2015.
//  Copyright 2015 iMokhles. All rights reserved.
//
//  https://github.com/iMokhles/iFileTweak
//
//  only for Reverse Engineering
//
// This is a feature which i hope to see in iFile's update ( because i'm tired from refreshing the table manually everytime i add new file from the computer)
//
// of course iFile's dev could add method better than mine.

#import <UIKit/UIKit.h>
#import <substrate.h>

@interface FileBrowserView : UIView
@property(retain) UITableView *browserTableView;
@end

@interface FileViewController : UIViewController
-(void)loadView;
@end

@interface AppDelegate : NSObject
@property(retain, nonatomic) FileViewController* fileViewController;
@end

%hook AppDelegate
- (void)applicationDidBecomeActive:(id)arg1 {
	%orig;
	[self.fileViewController loadView];
	// Or we could use
	// FileBrowserView *browserView = MSHookIvar<FileBrowserView *>(self.fileViewController, "_browserView");
	// [browserView.browserTableView reloadData];
}
%end