//
//  NTChartView.h
//  DimensionalHistogram
//
//  Created by benbenxiong on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NTChartView : UIView {
	//组数据
	NSArray *chartTitle;
	//组数据
	NSArray *groupData;
    //组数据名
    NSArray *groupTitle;
    //Ｘ轴标签
    NSArray *xAxisLabel;
	
	//最大值，最小值, 列宽度, 
	float maxValue,minValue,columnWidth,maxScaleValue,maxScaleHeight,sideWidth;
	
	int chartType;
}

@property(strong, nonatomic) NSArray *chartTitle;
@property(strong, nonatomic) NSArray *groupData;
@property(strong, nonatomic) NSArray *groupTitle;
@property(strong, nonatomic) NSArray *xAxisLabel;
@property(assign) int chartType;

@end
