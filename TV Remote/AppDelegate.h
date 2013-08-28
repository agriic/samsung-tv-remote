//
//  AppDelegate.h
//  TV Remote 2
//
//  Created by Agris Dumins on 6/12/13.
//  Copyright (c) 2013 Agris Dumins. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    NSUserDefaults* standardUserDefaults;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *tvIpText;
@property (assign) IBOutlet NSButton *button;

@property NSString* tvIp;

- (IBAction)clickOnInfo:(id)sender;
- (IBAction)ipEditFinished:(id)sender;


-(BOOL) ipValid;

@end
