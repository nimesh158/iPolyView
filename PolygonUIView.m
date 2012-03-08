//
//  PolygonViewUI.m
//  HelloPoly
//
//  Created by NIMESH DESAI on 10/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PolygonUIView.h"

@implementation PolygonUIView

@synthesize polygon, lineStyle;

- (void)setLineStyle:(int)style
{	
	lineStyle = style;	
	[self setNeedsDisplay];	
}

-(void) drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	[self paintGradient:rect context:context];
	CGContextBeginPath (context);
	
	NSArray *points = [PolygonUIView pointsForPolygonInRect:rect numberOfSides:polygon.numberOfSides];
	
	CGPoint point = [[points objectAtIndex:0] CGPointValue];
	if (lineStyle == LINE_STYLE_DASHED) 
	{
		CGFloat pattern[] = {6,2};
		CGContextSetLineDash(context, 0, pattern, 2);
	}
	CGContextSetLineWidth(context, 2);	
	CGContextMoveToPoint(context, point.x, point.y);
	
	NSLog(@"%d", [points count]);
	NSLog(@"%d", polygon.numberOfSides);
	for(NSValue * point in points)
	{
		CGPoint val = [point CGPointValue];
		if([points indexOfObject:point] == 0 )
			CGContextMoveToPoint (context, val.x, val.y);
		else
			CGContextAddLineToPoint (context, val.x, val.y); 
	}
	
	CGContextClosePath (context); 
	[[UIColor redColor] setFill]; 
	[[UIColor blackColor] setStroke]; 
	CGContextDrawPath (context, kCGPathFillStroke);
	polygonLabel.text = polygon.name;
}

- (void)paintGradient:(CGRect)rect context:(CGContextRef)context
{
	CGFloat gradientComponents[] = {0.62, 0.62, 0.78, 1, 0.9, 0.9, 255, 1};
	CGColorSpaceRef cs = CGColorSpaceCreateDeviceRGB();
	CGGradientRef gradient = CGGradientCreateWithColorComponents(cs, gradientComponents, NULL, 2);
	CGContextDrawLinearGradient(context, gradient, rect.origin, CGPointMake(rect.origin.x, rect.origin.y + rect.size.height), 0);
	CGColorSpaceRelease(cs);
	CGGradientRelease(gradient);
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides
{ 
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
	float radius = 0.9 * center.x; 
	NSMutableArray *result = [NSMutableArray array]; 
	float angle = (2.0 * M_PI) / numberOfSides; 
	float exteriorAngle = M_PI - angle; 
	float rotationDelta = angle - (0.5 * exteriorAngle); 
	
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
		float newAngle = (angle * currentAngle) - rotationDelta; 
		float curX = cos(newAngle) * radius; 
		float curY = sin(newAngle) * radius; 
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, 
																center.y + curY)]]; 
	} 
	
	return result;
} 

@end
