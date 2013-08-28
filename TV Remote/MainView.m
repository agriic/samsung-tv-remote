//
//  MainView.m
//  TV Remote 2
//
//  Created by Agris Dumins on 6/12/13.
//  Copyright (c) 2013 Agris Dumins. All rights reserved.
//

#import "MainView.h"
#import "AppDelegate.h"
#import "TV.h"

@implementation MainView

- (void)keyDown:(NSEvent*)event
{
    AppDelegate* delegate = (AppDelegate*)[NSApplication sharedApplication].delegate;
    
    NSLog(@"%d", event.keyCode);
    //event.characters
    
    if ([delegate ipValid])
    {
        tv = [[TV alloc] init];
        
        NSString* chars = [event.characters lowercaseString];
        
        if ([chars isEqual: @" "])
            [tv sendKey:@"KEY_MUTE"];
        else if ([chars isEqual: @"+"])
            [tv sendKey:@"KEY_VOLUP"];
        else if ([chars isEqual: @"-"])
            [tv sendKey:@"KEY_VOLDOWN"];
        
        else if ([chars isEqual: @"0"])
            [tv sendKey:@"KEY_0"];
        else if ([chars isEqual: @"1"])
            [tv sendKey:@"KEY_1"];
        else if ([chars isEqual: @"2"])
            [tv sendKey:@"KEY_2"];
        else if ([chars isEqual: @"3"])
            [tv sendKey:@"KEY_3"];
        else if ([chars isEqual: @"4"])
            [tv sendKey:@"KEY_4"];
        else if ([chars isEqual: @"5"])
            [tv sendKey:@"KEY_5"];
        else if ([chars isEqual: @"6"])
            [tv sendKey:@"KEY_6"];
        else if ([chars isEqual: @"7"])
            [tv sendKey:@"KEY_7"];
        else if ([chars isEqual: @"8"])
            [tv sendKey:@"KEY_8"];
        else if ([chars isEqual: @"9"])
            [tv sendKey:@"KEY_9"];
        
        else if ([chars isEqual: @"<"])
            [tv sendKey:@"KEY_CHUP"];
        else if ([chars isEqual: @">"])
            [tv sendKey:@"KEY_CHDOWN"];
        
        else if ([chars isEqual: @"s"])
            [tv sendKey:@"KEY_SOURCE"];
        else if ([chars isEqual: @"e"])
            [tv sendKey:@"KEY_EXIT"];
        else if ([chars isEqual: @"t"])
            [tv sendKey:@"KEY_TOOLS"];
        else if ([chars isEqual: @"h"])
            [tv sendKey:@"KEY_CONTENTS"];
        else if ([chars isEqual: @"i"])
            [tv sendKey:@"KEY_INFO"];
        else if ([chars isEqual: @"x"])
            [tv sendKey:@"KEY_POWEROFF"];
        
        else if (event.keyCode == 36)
            [tv sendKey:@"KEY_ENTER"];
        else if (event.keyCode == 51)
            [tv sendKey:@"KEY_RETURN"];
        else if (event.keyCode == 126)
            [tv sendKey:@"KEY_UP"];
        else if (event.keyCode == 125)
            [tv sendKey:@"KEY_DOWN"];
        else if (event.keyCode == 123)
            [tv sendKey:@"KEY_LEFT"];
        else if (event.keyCode == 124)
            [tv sendKey:@"KEY_RIGHT"];
        
    }
}

- (BOOL)acceptsFirstResponder
{
    return YES;
}

//-(void)mouseDown:(NSEvent *)event
//{
//    NSLog(@"XXX");
//}

@end

/*

 #KEY_0 #KEY_1 #KEY_2 #KEY_3 #KEY_4 #KEY_5 #KEY_6 #KEY_7 #KEY_8 #KEY_9
 #KEY_UP #KEY_DOWN #KEY_LEFT #KEY_RIGHT
 #KEY_MENU
 #KEY_PRECH
 #KEY_GUIDE
 #KEY_INFO #KEY_RETURN
 #KEY_CH_LIST
 #KEY_EXIT #KEY_ENTER #KEY_SOURCE
 #KEY_AD
 #KEY_PLAY
 #KEY_PAUSE
 #KEY_MUTE
 #KEY_PICTURE_SIZE
 #KEY_VOLUP #KEY_VOLDOWN #KEY_TOOLS
 
 #KEY_POWEROFF
 #KEY_CHUP
 #KEY_CHDOWN
 #KEY_CONTENTS
 #KEY_W_LINK #Media P
 #KEY_RSS #Internet
 #KEY_MTS #Dual
 #KEY_CAPTION #Subt
 #KEY_REWIND
 #KEY_FF
 #KEY_REC
 #KEY_STOP

*/