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

- (IBAction)clickButton:(id)sender
{
    NSLog(@"Tooltip: %@", ((NSButton*)sender).toolTip);
    
    NSString* tooltip = ((NSButton*)sender).toolTip.lowercaseString;
    
    tooltip = [tooltip stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    [self commandReceived:tooltip];
}

- (void)keyDown:(NSEvent*)event
{
    
    
    NSLog(@"Keycode: %d", event.keyCode);
    //event.characters
    
    
        
        
        NSString* chars = [event.characters lowercaseString];
        
        if ([chars isEqualToString: @" "])
            chars = @"[space]";
        else if (event.keyCode == 36)
            chars = @"[enter]";
        else if (event.keyCode == 51)
            chars = @"[backspace]";
        else if (event.keyCode == 53)
            chars = @"[esc]";
        else if (event.keyCode == 126)
            chars = @"[up]";
        else if (event.keyCode == 125)
            chars = @"[down]";
        else if (event.keyCode == 123)
            chars = @"[left]";
        else if (event.keyCode == 124)
            chars = @"[right]";
        
        [self commandReceived:chars];
        
    
}

- (void) commandReceived:(NSString*)cmd
{
    NSLog(@"CMD: |%@| %lu", cmd, (unsigned long)cmd.length);
    
    AppDelegate* delegate = (AppDelegate*)[NSApplication sharedApplication].delegate;
    
    
    if ([delegate ipValid])
    {
        tv = [[TV alloc] init];
        
        if ([cmd isEqualToString: @"[space]"])
        {
            printf("HA\n");
            [tv sendKey:@"KEY_MUTE"];
        }
        else if ([cmd isEqual: @"+"] ||
                 [cmd isEqual: @"="])
            [tv sendKey:@"KEY_VOLUP"];
        else if ([cmd isEqual: @"-"] ||
                 [cmd isEqual: @"_"])
            [tv sendKey:@"KEY_VOLDOWN"];
        
        else if ([cmd isEqual: @"0"])
            [tv sendKey:@"KEY_0"];
        else if ([cmd isEqual: @"1"])
            [tv sendKey:@"KEY_1"];
        else if ([cmd isEqual: @"2"])
            [tv sendKey:@"KEY_2"];
        else if ([cmd isEqual: @"3"])
            [tv sendKey:@"KEY_3"];
        else if ([cmd isEqual: @"4"])
            [tv sendKey:@"KEY_4"];
        else if ([cmd isEqual: @"5"])
            [tv sendKey:@"KEY_5"];
        else if ([cmd isEqual: @"6"])
            [tv sendKey:@"KEY_6"];
        else if ([cmd isEqual: @"7"])
            [tv sendKey:@"KEY_7"];
        else if ([cmd isEqual: @"8"])
            [tv sendKey:@"KEY_8"];
        else if ([cmd isEqual: @"9"])
            [tv sendKey:@"KEY_9"];
        
        else if ([cmd isEqual: @"<"] || [cmd isEqual: @","])
            [tv sendKey:@"KEY_CHUP"];
        else if ([cmd isEqual: @">"] || [cmd isEqual: @"."])
            [tv sendKey:@"KEY_CHDOWN"];
        
        else if ([cmd isEqual: @"w"])
            [tv sendKey:@"KEY_PRECH"];
        else if ([cmd isEqual: @"m"])
            [tv sendKey:@"KEY_MENU"];
        else if ([cmd isEqual: @"g"])
            [tv sendKey:@"KEY_GUIDE"];
        else if ([cmd isEqual: @"l"])
            [tv sendKey:@"KEY_CH_LIST"];
        
        else if ([cmd isEqual: @"a"])
            [tv sendKey:@"KEY_AD"];
        
        else if ([cmd isEqual: @"]"])
            [tv sendKey:@"KEY_FF"];
        else if ([cmd isEqual: @"["])
            [tv sendKey:@"KEY_REWIND"];
        else if ([cmd isEqual: @"p"])
            [tv sendKey:@"KEY_PAUSE"];
        else if ([cmd isEqual: @";"])
            [tv sendKey:@"KEY_PLAY"];
        else if ([cmd isEqual: @"q"])
            [tv sendKey:@"KEY_STOP"];
        else if ([cmd isEqual: @"r"])
            [tv sendKey:@"KEY_REC"];
        
        else if ([cmd isEqual: @"s"])
            [tv sendKey:@"KEY_SOURCE"];
        else if ([cmd isEqual: @"t"])
            [tv sendKey:@"KEY_TOOLS"];
        else if ([cmd isEqual: @"h"])
            [tv sendKey:@"KEY_CONTENTS"];
        else if ([cmd isEqual: @"i"])
            [tv sendKey:@"KEY_INFO"];
        else if ([cmd isEqual: @"x"])
            [tv sendKey:@"KEY_POWEROFF"];
        
        else if ([cmd isEqual: @"[enter]"])
            [tv sendKey:@"KEY_ENTER"];
        else if ([cmd isEqual: @"[backspace]"])
            [tv sendKey:@"KEY_RETURN"];
        else if ([cmd isEqual: @"[esc]"])
            [tv sendKey:@"KEY_EXIT"];
        else if ([cmd isEqual: @"[up]"])
            [tv sendKey:@"KEY_UP"];
        else if ([cmd isEqual: @"[down]"])
            [tv sendKey:@"KEY_DOWN"];
        else if ([cmd isEqual: @"[left]"])
            [tv sendKey:@"KEY_LEFT"];
        else if ([cmd isEqual: @"[right]"])
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