//
//  PlayingViewController.h
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/8/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface PlayingViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIView   *questionView;
@property (strong, nonatomic) IBOutlet UIView   *answerView;
@property (strong, nonatomic) IBOutlet UILabel  *questionTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel  *questionContentLabel;
@property (strong, nonatomic) IBOutlet UIButton *answerAButton;
@property (strong, nonatomic) IBOutlet UIButton *answerBButton;
@property (strong, nonatomic) IBOutlet UIButton *answerCButton;
@property (strong, nonatomic) IBOutlet UIButton *answerDButton;
@property (strong, nonatomic) IBOutlet UILabel *moneyLabel;
@property (strong, nonatomic) IBOutlet UIButton *help5050Button;
@property (strong, nonatomic) IBOutlet UIButton *helpCallButton;
@property (strong, nonatomic) IBOutlet UIButton *helpAudienceButton;

- (IBAction)doAnswerA:(id)sender;
- (IBAction)doAnswerB:(id)sender;
- (IBAction)doAnswerC:(id)sender;
- (IBAction)doAnswerD:(id)sender;
- (IBAction)doBackToMain:(id)sender;
- (IBAction)doHelp5050:(id)sender;
- (IBAction)doHelpCall:(id)sender;
- (IBAction)doHelpAudience:(id)sender;
- (IBAction)doHelpStopSession:(id)sender;


@end