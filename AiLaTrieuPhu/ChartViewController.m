//
//  ChartViewController.m
//  AiLaTrieuPhu
//
//  Created by Nam Bùi on 8/13/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import "ChartViewController.h"

@interface ChartViewController ()

@end

@implementation ChartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    int px = 320;
    int py = 480;
    
    NTChartView *chartView = [[NTChartView alloc] initWithFrame:CGRectMake(0, 0, px, py)];
	
	NSArray *graphic =  [NSArray arrayWithObjects:
                         [NSNumber numberWithFloat:78],
                         [NSNumber numberWithFloat:82],
                         [NSNumber numberWithFloat:90.2],
                         [NSNumber numberWithFloat:94.1],
                         [NSNumber numberWithFloat:92.5],
                         [NSNumber numberWithFloat:93.9],
                         [NSNumber numberWithFloat:95.2],
                         [NSNumber numberWithFloat:93.5],nil];
    
    NSArray *groupData = [NSArray arrayWithObjects:graphic, nil];
    NSArray *groupTitle = [NSArray arrayWithObjects:@"Khán giả bình chọn", nil];
    NSArray *xAxisLabel = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", nil];
    NSArray *chartTitle = [NSArray arrayWithObjects:@"Kết quả bình chọn của khán giả",@"", nil];
    
	chartView.groupData = groupData;
    chartView.groupTitle = groupTitle;
    chartView.xAxisLabel = xAxisLabel;
    chartView.chartTitle = chartTitle;
    
    chartView.backgroundColor = [UIColor clearColor];
    chartView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:chartView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
