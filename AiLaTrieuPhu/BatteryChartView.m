//
//  ChartView.m
//  ChartView
//
//  Created by star  on 9/18/12.
//  Copyright (c) 2012 star . All rights reserved.
//

#import "BatteryChartView.h"

@interface BatteryChartView(private)
-(void)drawColumn:(CGContextRef)context rect:(CGRect)_rect;//画列
-(void)drawScale:(CGContextRef)context rect:(CGRect)_rect;//画刻度，没有刻度，就画不了列
-(void)drawTitleByRect:(CGRect)_rect;//画标题，没有刻度，就画不了列（估计和context有关）
-(void)calcScales:(CGRect)_rect;//不用的话，角度是45度
@end

@implementation BatteryChartView
@synthesize groupData;
@synthesize xAxisLabel;
@synthesize chartType;
@synthesize chartTitle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withArrary:(NSDictionary*)dic_ withType:(ChartType)type_
{
    self = [self initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // Set views
        self.groupData = (NSArray *)[dic_ objectForKey:@"groupData"];
        self.xAxisLabel = (NSArray *)[dic_ objectForKey:@"xAxisLabel"];
        self.chartTitle = (NSArray *)[dic_ objectForKey:@"chartTitle"];
        self.chartType = type_;
        
    }
    return self;
}

- (void)drawRect:(CGRect)_rect
{
    
    [self drawTitleByRect:_rect];
    
    [self calcScales:_rect];
    
    //画刻度
    [self drawScale:nil rect:_rect];
    
    //画柱
    [self drawColumn:nil rect:_rect];
    
}


#pragma mark -画title

-(void)drawTitleByRect:(CGRect)_rect
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _rect.size.width, 35)];   //声明UIlbel并指定其位置和长宽
    label.backgroundColor = [UIColor clearColor];   //设置label的背景色，这里设置为透明色。
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];   //设置label的字体和字体大小。
    //    label.transform = CGAffineTransformMakeRotation(0.1);     //设置label的旋转角度
    
    label.text = [chartTitle objectAtIndex:0];   //设置label所显示的文本
    //    label.text = @"某某历年销量水平柱状图";   //设置label所显示的文本
    
    label.textColor = [UIColor whiteColor];    //设置文本的颜色
    label.shadowColor = [UIColor colorWithWhite:0.6f alpha:0.8f];    //设置文本的阴影色彩和透明度。
    label.shadowOffset = CGSizeMake(2.0f, 2.0f);     //设置阴影的倾斜角度。
    label.textAlignment = UITextAlignmentCenter;     //设置文本在label中显示的位置，这里为居中。
    //换行技巧：如下换行可实现多行显示，但要求label有足够的宽度。
    label.lineBreakMode = UILineBreakModeWordWrap;     //指定换行模式
    label.numberOfLines = 1;    // 指定label的行数
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, _rect.size.width, 35)];   //声明UIlbel并指定其位置和长宽
    label2.backgroundColor = [UIColor clearColor];   //设置label的背景色，这里设置为透明色。
    label2.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];   //设置label的字体和字体大小。
    //    label.transform = CGAffineTransformMakeRotation(0.1);     //设置label的旋转角度
    
    label2.text = [chartTitle objectAtIndex:1];   //设置label所显示的文本
    //    label2.text = @"某某历年销量水平柱状图详细介绍";   //设置label所显示的文本
    
    label2.textColor = [UIColor grayColor];    //设置文本的颜色
    label2.textAlignment = UITextAlignmentCenter;     //设置文本在label中显示的位置，这里为居中。
    
    [self addSubview:label2];
    [self addSubview:label];
    
}

#pragma mark -比例，

-(void)calcScales:(CGRect)_rect{
	int columnCount = 0;
	for(NSArray *g in groupData){
        if (!columnCount) {
            columnCount = [g count];
        }
		for(NSNumber *v in g){
			if(maxValue<[v floatValue]) maxValue = [v floatValue];
			if(minValue>[v floatValue]) minValue = [v floatValue];
		}
	}
	
	maxScaleValue = ((int)ceil(maxValue) + (SHOW_SCALE_NUM - (int)ceil(maxValue) % SHOW_SCALE_NUM));
	
	columnWidth = (_rect.size.width - MARGIN_LEFT) /(columnCount *3);
	sideWidth = columnWidth *.2;
	columnWidth *= COLUMN_W_SCALE;
}

#pragma mark -画刻度
-(void)drawScale:(CGContextRef)context rect:(CGRect)_rect{//画比例

	for(int i=0;i<SHOW_SCALE_NUM + 1; i++){
		maxScaleHeight = (_rect.size.height - MARGIN_BOTTOM) * ( i ) / (SHOW_SCALE_NUM + 1);

	}

}

- (void)drawBG{
    //画背景
    UIImage *bgImg=[UIImage imageNamed:@"JTYColumnBase.png"];
    
    bgImg =[bgImg stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    
    UIImageView *bgimgView=[[UIImageView alloc]initWithImage:bgImg];
    
    
    NSArray *g  = [groupData objectAtIndex:0];
    float  interval= [g count] * 20 + baseGroundX + columnWidth * [g count] + columnWidth +40 *[g count] -(0 * 20 + baseGroundX + columnWidth * 0 + columnWidth +40 *0);
    float boundary = (0 * 20 + baseGroundX + columnWidth * 0 + columnWidth +40 *0) -MARGIN_LEFT;
    [bgimgView setFrame:CGRectMake(MARGIN_LEFT
                                   , baseGroundY -7
                                   , (interval+columnWidth/2+boundary)
                                   , bgimgView.bounds.size.height)];
    [self addSubview:bgimgView];
}

- (void)drawxAxisLabelWithRect:(CGRect)_rect{
    
    //显示数据  (200X)
    for(int i=0;i<[[groupData objectAtIndex:0] count]+1; i++){
        
        float x = MARGIN_LEFT + i * 20  + columnWidth * i +40 *i+10;
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(x+columnWidth, _rect.size.height - MARGIN_BOTTOM+18.0, _rect.size.width, 14)];   //声明UIlbel并指定其位置和长宽
        label2.backgroundColor = [UIColor clearColor];   //设置label的背景色，这里设置为透明色。
        label2.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];   //设置label的字体和字体大小。
        //    label.transform = CGAffineTransformMakeRotation(0.1);     //设置label的旋转角度
        if (i<[xAxisLabel count]) {
            NSLog(@"label2=%@",[xAxisLabel objectAtIndex:i]);
            label2.text = [xAxisLabel objectAtIndex:i];   //设置label所显示的文本
        }
        label2.textColor = [UIColor blackColor];    //设置文本的颜色
        label2.textAlignment = UITextAlignmentLeft;     //设置文本在label中显示的位置，这里为居中。
        [self addSubview:label2];
    }

}
#pragma mark -画列柱图

-(void)drawColumn:(CGContextRef)context rect:(CGRect)_rect{//画列柱图
    baseGroundY = _rect.size.height - MARGIN_BOTTOM, baseGroundX = MARGIN_LEFT;//左边界
    
    //画背景
    [self drawBG];
    //显示数据  (200X)
    [self drawxAxisLabelWithRect:_rect];
    //画所有的柱状图；
    for(int gNumber = 0;gNumber<[groupData count];gNumber++){//遍历所有的柱状图；
		NSArray *g  = [groupData objectAtIndex:gNumber];//得到莫个柱状图的数据
        
		for(int vNumber = 0; vNumber < [g count]; vNumber++){
            
            UIImage *img;//BodyImg
            UIImage *aboveImg;
            UIImage *belowImg;
            
            switch (chartType) {
                case REDChartType:
                {
                    if (gNumber == 0){
                        
                        img = [UIImage imageNamed:@"JTYColumnRedbody.png"];
                        aboveImg = [UIImage imageNamed:@"JTYColumnRedAbove.png"];
                        belowImg = [UIImage imageNamed:@"JTYColumnRedBelow.png"];
                        
                    }

                }
                    break;
                case GRChartType:
                {
                    
                    if (gNumber == 0){
                        
                        img = [UIImage imageNamed:@"JTYColumnWhitebody.png"];
                        aboveImg = [UIImage imageNamed:@"JTYColumnWhiteAbove.png"];
                        belowImg = [UIImage imageNamed:@"JTYColumnWhiteBelow.png"];
                        
                    }
                    else {
                        
                        img = [UIImage imageNamed:@"JTYColumnGreenBody.png"];
                        aboveImg = [UIImage imageNamed:@"JTYColumnGreenAbove.png"];
                        belowImg = [UIImage imageNamed:@"JTYColumnGreenBelow.png"];
                        
                    }

                }
                    break;
   
                default:
                    break;
            }
            
            //添加柱图的数据
            NSNumber *v = [g objectAtIndex:vNumber];
			float columnHeight = [v floatValue] / maxScaleValue * maxScaleHeight ;
            UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth +40 *vNumber, baseGroundY - columnHeight -20 , 50, 30)];   //声明UIlbel并指定其位置和长宽
            label2.backgroundColor = [UIColor clearColor];   //设置label的背景色，这里设置为透明色。
            label2.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];   //设置label的字体和字体大小。
            //    label.transform = CGAffineTransformMakeRotation(0.1);     //设置label的旋转角度
            label2.textColor = [UIColor blackColor];    //设置文本的颜色
            label2.textAlignment = UITextAlignmentCenter;     //设置文本在label中显示的位置，这里为居中。
            label2.text = [v stringValue];
            
            //画body
            img = [img stretchableImageWithLeftCapWidth:0 topCapHeight:0];
            
            UIImageView *imgView=[[UIImageView alloc]initWithImage:img];
            
            [imgView setFrame:CGRectMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth +40 *vNumber
                                         , baseGroundY - columnHeight
                                         , columnWidth
                                         , columnHeight)];
            
            
            [self addSubview:imgView];
            
            //画帽子
            
            aboveImg = [aboveImg stretchableImageWithLeftCapWidth:0 topCapHeight:0];
            
            UIImageView *aboveImgView=[[UIImageView alloc]initWithImage:aboveImg];
            
            [aboveImgView setFrame:CGRectMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth +40 *vNumber
                                              , baseGroundY - columnHeight - 5.0
                                              , columnWidth
                                              , 9.0)];
            
            
            
            [self addSubview:aboveImgView];
            
            //画阴影
            img=[UIImage imageNamed:@"JTYColumnShadow.png"];
            
            img=[img stretchableImageWithLeftCapWidth:1 topCapHeight:2];
            
            imgView=[[UIImageView alloc]initWithImage:img];
            
            [imgView setFrame:CGRectMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth +40 *vNumber
                                         , baseGroundY -7
                                         , columnWidth*1.5
                                         , 10.0)];
            [imgView setCenter:CGPointMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth +40 *vNumber+columnWidth*0.5, baseGroundY )];

            [self addSubview:imgView];
            
            //画鞋
            
            belowImg =[belowImg stretchableImageWithLeftCapWidth:0 topCapHeight:0];
            
            imgView=[[UIImageView alloc]initWithImage:belowImg];
            
            [imgView setFrame:CGRectMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth +40 *vNumber
                                         , baseGroundY -7
                                         , columnWidth
                                         , 9.0)];
            //开始画到画布上
            
            [self addSubview:imgView];
            
            
            [self addSubview:label2];
        }
    }
       
}

@end
