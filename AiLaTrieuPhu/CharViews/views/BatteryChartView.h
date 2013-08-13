//
//  ChartView.h
//  ChartView
//
//  Created by star  on 9/18/12.
//  Copyright (c) 2012 star . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CV_Config.h"

@interface BatteryChartView : UIView{
	//标题数据
	NSArray *chartTitle;
	//柱状图组数据
	NSArray *groupData;
    //Ｘ轴标签最下面的（200X）
    NSArray *xAxisLabel;
	
	//最大值，最小值, 列宽度,比率,高比率，边宽
	float maxValue,minValue,columnWidth,maxScaleValue,maxScaleHeight,sideWidth;
	
	ChartType chartType; //类型
    
    int baseGroundY;
    int baseGroundX;
}

@property(retain, nonatomic) NSArray *chartTitle;
@property(retain, nonatomic) NSArray *groupData;
@property(retain, nonatomic) NSArray *xAxisLabel;
@property(assign) ChartType chartType;

- (id)initWithFrame:(CGRect)frame withArrary:(NSDictionary*)dic_ withType:(ChartType)type_;
@end
