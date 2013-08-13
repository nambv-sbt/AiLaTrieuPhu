//
//  NTChartView.m
//  DimensionalHistogram
//
//  Created by benbenxiong on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NTChartView.h"

#define MARGIN_LEFT 50
#define MARGIN_BOTTOM 60
#define MARGIN_TOP 60
#define SHOW_SCALE_NUM 5
#define MARGIN_SCALE_BETWEEN 20


@interface NTChartView(private)
-(void)drawColumn:(CGContextRef)context rect:(CGRect)_rect;
-(void)drawScale:(CGContextRef)context rect:(CGRect)_rect;
-(void)drawTitle:(CGContextRef)context rect:(CGRect)_rect;
-(void)drawXAxis:(CGContextRef)context rect:(CGRect)_rect;
-(void)drawLegend:(CGContextRef)context rect:(CGRect)_rect;

-(void)calcScales:(CGRect)_rect;
-(CGColorRef)defaultColorForIndex:(NSUInteger)pieSliceIndex;

@end

@implementation NTChartView
@synthesize groupData;
@synthesize groupTitle;
@synthesize xAxisLabel;
@synthesize chartType;
@synthesize chartTitle;

static const CGFloat colorLookupTable[10][3] =
{
	{
		1.0, 0.0, 0.0
	},
    {
		0.0, 1.0, 0.0
	},
    {
		0.0, 0.0, 1.0
	},
    {
		1.0, 1.0, 0.0
	},
    {
		0.25, 0.5, 0.25
	},
    {
		1.0, 0.0, 1.0
	},
    {
		0.5, 0.5, 0.5
	},
    {
		0.25, 0.5, 0.0
	},
    {
		0.25, 0.25, 0.25
	},
    {
		0.0, 1.0, 1.0
	}
};

/** @brief Creates and returns a CPTColor that acts as the default color for that pie chart index.
 *	@param pieSliceIndex The pie slice index to return a color for.
 *	@return A new CPTColor instance corresponding to the default value for this pie slice index.
 **/

-(CGColorRef)defaultColorForIndex:(NSUInteger)pieSliceIndex
{
    CGColorRef myColor;

    myColor = (__bridge CGColorRef)([UIColor redColor]);
//    myColor = [UIColor colorWithRed: colorLookupTable[pieSliceIndex % 10][0] green: colorLookupTable[pieSliceIndex % 10][1] blue:colorLookupTable[pieSliceIndex % 10][2] alpha:1].CGColor;
    
    return myColor;
}

-(void)drawRect:(CGRect)_rect
{
	
	CGContextRef context = UIGraphicsGetCurrentContext();
    //	CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    //	CGContextFillRect(context, _rect);
    
    CGFloat locations[] = { 0.0, 1.0 };
	NSArray *colors = [NSArray arrayWithObjects:(id)[UIColor grayColor].CGColor, [UIColor grayColor].CGColor, nil];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef) CFBridgingRetain(colors), locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMinX(_rect), CGRectGetMinY(_rect)-150);
    CGPoint endPoint = CGPointMake(CGRectGetMinX(_rect), CGRectGetMaxY(_rect));
    
    CGContextSaveGState(context);
    
	// on the x and y lengths of the given rectangle.
	CGFloat minx = CGRectGetMinX(_rect), midx = CGRectGetMidX(_rect), maxx = CGRectGetMaxX(_rect);
	CGFloat miny = CGRectGetMinY(_rect), midy = CGRectGetMidY(_rect), maxy = CGRectGetMaxY(_rect);
	
	// Next, we will go around the rectangle in the order given by the figure below.
	//       minx    midx    maxx
	// miny    2       3       4
	// midy   1 9              5
	// maxy    8       7       6
	// Which gives us a coincident start and end point, which is incidental to this technique, but still doesn't
	// form a closed path, so we still need to close the path to connect the ends correctly.
	// Thus we start by moving to point 1, then adding arcs through each pair of points that follows.
	// You could use a similar tecgnique to create any shape with rounded corners.
	
	// Start at 1
	CGContextMoveToPoint(context, minx, midy);
	// Add an arc through 2 to 3
	CGContextAddArcToPoint(context, minx, miny, midx, miny, 0);
	// Add an arc through 4 to 5
	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, 0);
	// Add an arc through 6 to 7
	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, 0);
	// Add an arc through 8 to 9
	CGContextAddArcToPoint(context, minx, maxy, minx, midy, 0);
	// Close the path
	CGContextClosePath(context);
	// Fill & stroke the path
    //	CGContextDrawPath(context, kCGPathFillStroke);
    //	CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient); 
    
    [self drawTitle:context rect:_rect];
    [self drawLegend:context rect:_rect];
    
    [self calcScales:_rect];
    //画刻度
    [self drawScale:context rect:_rect];
    //画柱
    [self drawColumn:context rect:_rect]; 
}

#pragma mark -

-(void)drawTitle:(CGContextRef)context rect:(CGRect)_rect
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _rect.size.width, 35)];   //声明UIlbel并指定其位置和长宽
    label.backgroundColor = [UIColor clearColor];   //设置label的背景色，这里设置为透明色。
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];   //设置label的字体和字体大小。 
    //    label.transform = CGAffineTransformMakeRotation(0.1);     //设置label的旋转角度
    label.text = [chartTitle objectAtIndex:0];   //设置label所显示的文本
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
    label2.textColor = [UIColor grayColor];    //设置文本的颜色
    label2.textAlignment = UITextAlignmentCenter;     //设置文本在label中显示的位置，这里为居中。
    
    [self addSubview:label2];
    [self addSubview:label];    
}

-(void)drawLegend:(CGContextRef)context rect:(CGRect)_rect
{
    CGSize myShadowOffset = CGSizeMake (2,  2);
    
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1].CGColor);
    CGContextSetShadow (context, myShadowOffset, 2); 
    CGContextFillRect(context, CGRectMake(MARGIN_LEFT, _rect.size.height - 40.0, _rect.size.width - MARGIN_LEFT*2, 24.0));
    
    int legendCount = [groupTitle count];
    int stepWidth = MARGIN_LEFT+5;
    
    for (int i = 0; i < legendCount; i++)
    {
        if (i == 0)
        {
            CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
        }
        else
        {
            CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
        }
        //        CGContextSetFillColorWithColor(context, [self defaultColorForIndex:i]);
        CGContextSetShadow (context, myShadowOffset, 1); 
        CGContextFillRect(context, CGRectMake(stepWidth, _rect.size.height - 32.0, 10, 10));
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(stepWidth+15, _rect.size.height - 37.0, _rect.size.width, 18)];   //声明UIlbel并指定其位置和长宽
        label2.backgroundColor = [UIColor clearColor];   //设置label的背景色，这里设置为透明色。
        label2.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];   //设置label的字体和字体大小。 
        //    label.transform = CGAffineTransformMakeRotation(0.1);     //设置label的旋转角度
        label2.text = [groupTitle objectAtIndex:i];   //设置label所显示的文本
        label2.textColor = [UIColor grayColor];    //设置文本的颜色
        label2.textAlignment = UITextAlignmentLeft;     //设置文本在label中显示的位置，这里为居中。
        [self addSubview:label2];
        
        stepWidth += (_rect.size.width - MARGIN_LEFT*2 -10) / legendCount;
    }
    
    
    CGContextRestoreGState(context);
}

-(void)drawNum:(CGContextRef)context rect:(CGRect)_rect
{
    CGSize myShadowOffset = CGSizeMake (2,  2);
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1].CGColor);
    CGContextSetShadow (context, myShadowOffset, 2); 
    CGContextFillRect(context, CGRectMake(MARGIN_LEFT, _rect.size.height - 40.0, _rect.size.width - MARGIN_LEFT*2, 24.0));
    CGContextSetFillColorWithColor(context, [self defaultColorForIndex:1]);
    CGContextSetStrokeColorWithColor(context, [self defaultColorForIndex:1]);
    CGContextRestoreGState(context);
}

-(void)drawScale:(CGContextRef)context rect:(CGRect)_rect{
    
    CGContextSaveGState(context);
    
	CGPoint points[3];
	points[0] = CGPointMake(MARGIN_LEFT - 10, MARGIN_TOP);
	points[1] = CGPointMake(MARGIN_LEFT -10, _rect.size.height - MARGIN_BOTTOM + 1);
	points[2] = CGPointMake(_rect.size.width - 10, _rect.size.height - MARGIN_BOTTOM + 1);
	CGContextSetAllowsAntialiasing(context, NO);
	CGContextAddLines(context, points, 3);
    CGContextDrawPath(context, kCGPathStroke);
    
    //画第二个坐标轴
    CGPoint points2[3];
	points2[0] = CGPointMake(MARGIN_LEFT - 10+MARGIN_SCALE_BETWEEN, MARGIN_TOP-MARGIN_SCALE_BETWEEN);
	points2[1] = CGPointMake(MARGIN_LEFT -10+MARGIN_SCALE_BETWEEN, _rect.size.height - MARGIN_BOTTOM + 1-MARGIN_SCALE_BETWEEN);
	points2[2] = CGPointMake(_rect.size.width - 10+MARGIN_SCALE_BETWEEN, _rect.size.height - MARGIN_BOTTOM + 1-MARGIN_SCALE_BETWEEN);
    
    float partren[] = {2,3};
    
    CGContextSetLineDash(context, 0,partren , 2);
    CGContextAddLines(context, points2, 3);
    CGContextSetAllowsAntialiasing(context, NO);
    CGContextDrawPath(context, kCGPathStroke);
    
	CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor); 
	
	for(int i=0;i<SHOW_SCALE_NUM + 1; i++)
    {
		maxScaleHeight = (_rect.size.height - MARGIN_BOTTOM) * ( i ) / (SHOW_SCALE_NUM + 1);
		int vScal = ceil(1.0 * maxScaleValue / (SHOW_SCALE_NUM ) * (i ));
		float y = (_rect.size.height - MARGIN_BOTTOM) -
        maxScaleHeight;
		
		NSString *scaleStr = [NSString stringWithFormat:@"%d",vScal];
		[scaleStr
         drawAtPoint:CGPointMake(MARGIN_LEFT - 20 - [scaleStr sizeWithFont:[UIFont fontWithName:@"DBLCDTempBlack" size:12]].width, y - 10) withFont:[UIFont fontWithName:@"DBLCDTempBlack" size:12]];
		points[0] = CGPointMake(MARGIN_LEFT - 10, y);
		points[1] = CGPointMake(MARGIN_LEFT - 13, y);
		CGContextSetLineDash(context, 0, NULL, 0);
		CGContextAddLines(context, points, 2);
		CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
        
		CGContextDrawPath(context, kCGPathStroke);
        
		CGPoint points3[2];
		points3[0] = CGPointMake(MARGIN_LEFT - 10, y);
		points3[1] = CGPointMake(MARGIN_LEFT - 10+MARGIN_SCALE_BETWEEN, y-MARGIN_SCALE_BETWEEN);
		float partren[] = {2,3};
        
		CGContextSetLineDash(context, 0,partren , 2);
		CGContextAddLines(context, points3, 2);
		CGContextDrawPath(context, kCGPathStroke);
        
        CGPoint points4[2];
		points4[0] = CGPointMake(MARGIN_LEFT - 10+MARGIN_SCALE_BETWEEN, y-MARGIN_SCALE_BETWEEN);
		points4[1] = CGPointMake(_rect.size.width - 10+MARGIN_SCALE_BETWEEN , y-MARGIN_SCALE_BETWEEN);
        
		CGContextSetLineDash(context, 0,partren , 2);
		CGContextAddLines(context, points4, 2);
		CGContextDrawPath(context, kCGPathStroke);
	}
    
    for(int i=0;i<[[groupData objectAtIndex:0] count]+1; i++)
    {
		
		float x = MARGIN_LEFT + i * 20  + columnWidth * i +40 *i+10;
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(x, _rect.size.height - 55.0, _rect.size.width, 14)];   //声明UIlbel并指定其位置和长宽
        label2.backgroundColor = [UIColor clearColor];   //设置label的背景色，这里设置为透明色。
        label2.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];   //设置label的字体和字体大小。 
        //    label.transform = CGAffineTransformMakeRotation(0.1);     //设置label的旋转角度
        if (i<[xAxisLabel count])
        {
            label2.text = [xAxisLabel objectAtIndex:i];   //设置label所显示的文本
        }
        label2.textColor = [UIColor blackColor];    //设置文本的颜色
        label2.textAlignment = UITextAlignmentLeft;     //设置文本在label中显示的位置，这里为居中。
        [self addSubview:label2];
	}
    
	CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
	CGContextDrawPath(context, kCGPathStroke);
	CGContextSetAllowsAntialiasing(context, YES);
	CGContextRestoreGState(context);
}

#pragma mark - 

-(void)drawColumn:(CGContextRef)context rect:(CGRect)_rect
{
	CGPoint points[4];
    CGContextSaveGState(context);
    
	int baseGroundY = _rect.size.height - MARGIN_BOTTOM, baseGroundX = MARGIN_LEFT;
    
	for(int gNumber = 0;gNumber<[groupData count];gNumber++)
    {
		NSArray *g  = [groupData objectAtIndex:gNumber];
        
		for(int vNumber = 0; vNumber < [g count]; vNumber++)
        {
            UIColor *columnColor;
            if (gNumber == 0)
            {
                columnColor = [UIColor redColor];
                
                CGContextSetFillColorWithColor(context, columnColor.CGColor);
                CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
            }
            else
            {
                columnColor = [UIColor blueColor];
                
                CGContextSetFillColorWithColor(context, columnColor.CGColor);
                CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
            }
            
            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
            [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
            
            NSNumber *v = [g objectAtIndex:vNumber];
			float columnHeight = [v floatValue] / maxScaleValue * maxScaleHeight ;
            
            NSString *valueStr = [numberFormatter stringFromNumber:v];
            
            [valueStr
             drawAtPoint:CGPointMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth *gNumber+40 *vNumber + 20, baseGroundY - columnHeight - [valueStr sizeWithFont:[UIFont fontWithName:@"DBLCDTempBlack" size:16]].height -24) withFont:[UIFont fontWithName:@"DBLCDTempBlack" size:16]];
            
			
            //画正面
            CGContextSetFillColorWithColor(context, columnColor.CGColor);
            CGContextAddRect(context, CGRectMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth *gNumber+40 *vNumber
                                                 , baseGroundY - columnHeight 
                                                 , columnWidth
                                                 , columnHeight));
            CGContextDrawPath(context, kCGPathFill);
            NSLog(@"columnHeight:%f, (_rect.size.height - MARGIN_TOP - MARGIN_BOTTOM ):%f",columnHeight,(_rect.size.height - MARGIN_TOP - MARGIN_BOTTOM ));
            
            if(columnHeight < 10)
            {
                vNumber++;
                continue;
            }
            
            //画右侧面
            if (gNumber == 0)
            {
                CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.7 green:0 blue:0 alpha:1].CGColor);}
            else
            {
                CGContextSetFillColorWithColor(context, [UIColor colorWithRed: 0 green:0 blue:0.7 alpha:1].CGColor);
            }
            points[0] = CGPointMake(vNumber * 20 + columnWidth *gNumber+ baseGroundX + columnWidth * vNumber + columnWidth+40 *vNumber, baseGroundY - columnHeight);
            points[1] = CGPointMake(vNumber * 20 + columnWidth *gNumber+ baseGroundX + columnWidth * vNumber + columnWidth + MARGIN_SCALE_BETWEEN+40 *vNumber, baseGroundY - columnHeight -MARGIN_SCALE_BETWEEN );
            points[2] = CGPointMake(vNumber * 20 + columnWidth *gNumber+ baseGroundX + columnWidth * vNumber + columnWidth + MARGIN_SCALE_BETWEEN+40 *vNumber, baseGroundY - MARGIN_SCALE_BETWEEN );
            points[3] = CGPointMake(vNumber * 20 + columnWidth *gNumber+ baseGroundX + columnWidth * vNumber + columnWidth+40 *vNumber, baseGroundY );
            
            CGContextAddLines(context, points, 4);
            CGContextDrawPath(context, kCGPathFill);
            
            //画上面
            if (gNumber == 0)
            {
                CGContextSetFillColorWithColor(context, [UIColor colorWithRed:1 green:.4 blue:.4 alpha:1].CGColor);}
            else
            {
                CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.4 green:.4 blue:1 alpha:1].CGColor);
            }
            points[0] = CGPointMake(vNumber * 20 + columnWidth *gNumber+ baseGroundX + columnWidth * vNumber+40 *vNumber , baseGroundY - columnHeight );
            points[1] = CGPointMake(vNumber * 20 + columnWidth *gNumber+ baseGroundX + columnWidth * vNumber + MARGIN_SCALE_BETWEEN+40 *vNumber, baseGroundY - columnHeight -MARGIN_SCALE_BETWEEN );
            points[2] = CGPointMake(vNumber * 20 + columnWidth *gNumber+ baseGroundX + columnWidth * vNumber + columnWidth + MARGIN_SCALE_BETWEEN+40 *vNumber , baseGroundY - columnHeight -MARGIN_SCALE_BETWEEN );
            points[3] = CGPointMake(vNumber * 20 + columnWidth *gNumber+ baseGroundX + columnWidth * vNumber + columnWidth+40 *vNumber, baseGroundY - columnHeight );
            
            CGContextAddLines(context, points, 4);
            CGContextDrawPath(context, kCGPathFill);
		}
	}
}

#pragma mark - 

-(void)calcScales:(CGRect)_rect
{
	int columnCount = 0;
	for(NSArray *g in groupData)
    {
        if (!columnCount)
        {
            columnCount = [g count];
        }
		for(NSNumber *v in g)
        {
			if(maxValue<[v floatValue]) maxValue = [v floatValue];
			if(minValue>[v floatValue]) minValue = [v floatValue];
		}
	}
	
	maxScaleValue = ((int)ceil(maxValue) + (SHOW_SCALE_NUM - (int)ceil(maxValue) % SHOW_SCALE_NUM));
	
	columnWidth = (_rect.size.width - MARGIN_LEFT) /(columnCount *3);
	sideWidth = columnWidth *.2;
	columnWidth *= .8;	
}

@end