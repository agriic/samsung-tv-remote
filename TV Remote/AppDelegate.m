//
//  AppDelegate.m
//  TV Remote 2
//
//  Created by Agris Dumins on 6/12/13.
//  Copyright (c) 2013 Agris Dumins. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSLog(@"TV App loaded");
    
    // defaults
    _tvIp = @"";
    standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    // inits app
    if (standardUserDefaults) _tvIp = [standardUserDefaults stringForKey:@"tvIp"];
    if (_tvIp == NULL) _tvIp = @""; else self.tvIpText.stringValue = _tvIp;
}

//- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
//    return YES;
//}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
    NSLog(@"Reopening window");
    [self.window makeKeyAndOrderFront:self];
    return NO;
}

- (IBAction)clickOnInfo:(id)sender
{
    [self.window makeFirstResponder:self.button];
}

- (IBAction)ipEditFinished:(id)sender
{
    if ([self ipValid])
    {
        if (standardUserDefaults)
        {
            [standardUserDefaults setObject:self.tvIpText.stringValue forKey:@"tvIp"];
            [standardUserDefaults synchronize];
        }
    }
}

-(BOOL) ipValid
{
    NSString *urlRegEx = @"(([0-9]{1,3})\\.([0-9]{1,3})\\.([0-9]{1,3})\\.([0-9]{1,3}))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    
    BOOL rez = [urlTest evaluateWithObject:self.tvIpText.stringValue];
    
    if (!rez)
    {
        NSAlert* alert = [NSAlert alertWithMessageText:@"IP address is invalid!"
                                         defaultButton:@"OK" alternateButton:Nil
                                           otherButton:Nil
                             informativeTextWithFormat:@"Please enter correct IP.."];
        [alert runModal];
    }
    
    return rez;
}

@end
