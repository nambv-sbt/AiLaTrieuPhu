//
//  ViewController.h
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/8/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface ViewController : UIViewController

- (IBAction)doStartGame:(id)sender;
- (IBAction)doShowGuide:(id)sender;
- (IBAction)doShowAbout:(id)sender;
- (void)pushViewToPlayingView;

@end
