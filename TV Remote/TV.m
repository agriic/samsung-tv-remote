//
//  TV.m
//  TV Remote 2
//
//  Created by Agris Dumins on 6/12/13.
//  Copyright (c) 2013 Agris Dumins. All rights reserved.
//

#import "TV.h"
#import "Data.h"
#include "AppDelegate.h"

@implementation TV

-(void)sendKey:(NSString*)key
{
//    NSLog(@"%@", key);
    
    //NSLog(@"%@", [TV base64String:@"Hello"]);
    
    keyToSend = key;
    
	AppDelegate* delegate = [NSApplication sharedApplication].delegate;
	
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)delegate.tvIp, 55000, NULL, &writeStream);
    oStream = (__bridge NSOutputStream *)writeStream;
    [oStream setDelegate:self];
    [oStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [oStream open];

}

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode
{
    if (keyToSend.length <= 0)
        return;
	
	AppDelegate* delegate = [NSApplication sharedApplication].delegate;
    
    NSString* myIp      = delegate.tvIp;
    NSString* appString = @"iphone..iapp.samsung";
    NSString* myMac     = @"Samsung Remote Widget";
    NSString* tvAppString = @"iphone.UE32C6500.iapp.samsung";
    NSString* remoteName  = @"OSX Samsung Remote";
    
    switch(eventCode) {
        case NSStreamEventHasSpaceAvailable:
        {
            if (stream == oStream)
            {
                // should create data
                NSLog(@"Sending %@", keyToSend);
                
                Data* addData = [[Data alloc] init];
                
                [addData addChar:0x64];
                [addData addChar:0];
                NSString* baseMyip = [TV base64String:myIp];
                [addData addChar:baseMyip.length];
                [addData addChar:0];
                [addData addNSString:baseMyip];
                
                NSString* baseMymac = [TV base64String:myMac];
                [addData addChar:baseMymac.length];
                [addData addChar:0];
                [addData addNSString:baseMymac];
                
                NSString* baseRemoteName = [TV base64String:remoteName];
                [addData addChar:baseRemoteName.length];
                [addData addChar:0];
                [addData addNSString:baseRemoteName];
                
                Data* part1 = [[Data alloc] init];
                
                [part1 addChar:0];
                [part1 addChar:appString.length];
                [part1 addChar:0];
                [part1 addNSString:appString];
                
                [part1 addChar:addData.length];
                [part1 addChar:0];
                [part1 addData:addData];
                
                [oStream write:part1.data maxLength:part1.length];
                
                
                Data* add2 = [[Data alloc] init];
                
                [add2 addChar:0xc8];
                [add2 addChar:0];
                
                Data* part2 = [[Data alloc] init];
                
                [part2 addChar:0];
                [part2 addChar:appString.length];
                [part2 addChar:0];
                [part2 addNSString:appString];
                
                [part2 addChar:add2.length];
                [part2 addChar:0];
                [part2 addData:add2];
                
                [oStream write:part2.data maxLength:part2.length];
                
                
                Data* add3 = [[Data alloc] init];
                
                [add3 addChar:0];
                [add3 addChar:0];
                [add3 addChar:0];
                
                NSString* baseKey = [TV base64String:keyToSend];
                
                [add3 addChar:baseKey.length];
                [add3 addChar:0];
                [add3 addNSString:baseKey];
                
                Data* part3 = [[Data alloc] init];
                
                [part3 addChar:0];
                [part3 addChar:tvAppString.length];
                [part3 addChar:0];
                [part3 addNSString:tvAppString];
                
                [part3 addChar:add3.length];
                [part3 addChar:0];
                [part3 addData:add3];
                
                [oStream write:part3.data maxLength:part3.length];
                
                [oStream close];
            }
            break;
        }
        case NSStreamEventOpenCompleted:
//            NSLog(@"E1");
            break;
        case NSStreamEventHasBytesAvailable:
            NSLog(@"E2");
            break;
        case NSStreamEventErrorOccurred:
            NSLog(@"Error conecting");
            break;
        case NSStreamEventNone:
            NSLog(@"E4");
            break;
        case NSStreamEventEndEncountered:
            NSLog(@"E5");
            break;
    }
}

+ (NSString *)base64String:(NSString *)str
{
    NSData *theData = [str dataUsingEncoding: NSASCIIStringEncoding];
    const uint8_t* input = (const uint8_t*)[theData bytes];
    NSInteger length = [theData length];
    
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    
    NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t* output = (uint8_t*)data.mutableBytes;
    
    NSInteger i;
    for (i=0; i < length; i += 3) {
        NSInteger value = 0;
        NSInteger j;
        for (j = i; j < (i + 3); j++) {
            value <<= 8;
            
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
        
        NSInteger theIndex = (i / 3) * 4;
        output[theIndex + 0] =                    table[(value >> 18) & 0x3F];
        output[theIndex + 1] =                    table[(value >> 12) & 0x3F];
        output[theIndex + 2] = (i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
        output[theIndex + 3] = (i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
    }
    
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
}

@end


/*

 #Normal remote keys
 #KEY_0
 #KEY_1
 #KEY_2
 #KEY_3
 #KEY_4
 #KEY_5
 #KEY_6
 #KEY_7
 #KEY_8
 #KEY_9
 #KEY_UP
 #KEY_DOWN
 #KEY_LEFT
 #KEY_RIGHT
 #KEY_MENU
 #KEY_PRECH
 #KEY_GUIDE
 #KEY_INFO
 #KEY_RETURN
 #KEY_CH_LIST
 #KEY_EXIT
 #KEY_ENTER
 #KEY_SOURCE
 #KEY_AD
 #KEY_PLAY
 #KEY_PAUSE
 #KEY_MUTE
 #KEY_PICTURE_SIZE
 #KEY_VOLUP
 #KEY_VOLDOWN
 #KEY_TOOLS
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
 
 #Bonus buttons not on the normal remote:
 #KEY_TV
 
 #Don't work/wrong codes:
 #KEY_CONTENT
 #KEY_INTERNET
 #KEY_PC
 #KEY_HDMI1
 #KEY_OFF
 #KEY_POWER
 #KEY_STANDBY
 #KEY_DUAL
 #KEY_SUBT
 #KEY_CHANUP
 #KEY_CHAN_UP
 #KEY_PROGUP
 #KEY_PROG_UP
 

*/