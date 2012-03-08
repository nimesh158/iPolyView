//
//  PolygonViewUI.h
//  HelloPoly
//
//  Created by NIMESH DESAI on 10/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

#define LINE_STYLE_SOLID 0
#define LINE_STYLE_DASHED 1

@interface PolygonUIView : UIView
{
    IBOutlet PolygonShape *polygon;
	IBOutlet UILabel *polygonLabel;
	int lineStyle;
}

@property (retain)PolygonShape* polygon;
@property int lineStyle;

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;
- (void) paintGradient:(CGRect)rect context:(CGContextRef)context;
- (void)setLineStyle:(int)style;

@end
