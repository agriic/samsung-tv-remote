//
//  TV.h
//  TV Remote 2
//
//  Created by Agris Dumins on 6/12/13.
//  Copyright (c) 2013 Agris Dumins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TV : NSObject
{
    NSOutputStream* oStream;
    NSString* keyToSend;
}

-(void)sendKey:(NSString*)key;

+ (NSString *)base64String:(NSString *)str;

@end
