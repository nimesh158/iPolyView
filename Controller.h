//
//  Controller.h
//  HelloPoly
//
//  Created by NIMESH DESAI on 9/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonUIView.h"

@interface Controller : NSObject 
{
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	IBOutlet PolygonShape *polygon;
	IBOutlet PolygonUIView *polygonView;	
	IBOutlet UISlider* slider;
	IBOutlet UISegmentedControl* lineStyle;
}

- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
- (IBAction)changeSlider;
- (void)updateInterface;
- (int) defaultSides;
- (IBAction)changeLineStyle:(id)sender;
- (int)selectedLineStyle;

@end
