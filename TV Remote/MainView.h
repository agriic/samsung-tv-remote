//
//  MainView.h
//  TV Remote 2
//
//  Created by Agris Dumins on 6/12/13.
//  Copyright (c) 2013 Agris Dumins. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TV.h"

@interface MainView : NSView
{
    TV* tv;
}

- (IBAction)clickButton:(id)sender;

- (void) commandReceived:(NSString*)cmd;

@end
