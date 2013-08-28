//
//  Data.m
//  TV Remote 2
//
//  Created by Agris Dumins on 6/12/13.
//  Copyright (c) 2013 Agris Dumins. All rights reserved.
//

#import "Data.h"

@implementation Data

-(id)init
{
    length = 0;
    memset(data, 0, DATA_MAX);
    return [super init];
}

-(uint8_t*) data
{
    return &data[0];
}

-(uint32_t) length
{
    return length;
}

-(void) addNSString:(NSString*) string
{
    if (length+string.length < DATA_MAX)
    {
        memcpy(&data[length], string.UTF8String, string.length);
        length += string.length;
    }
}

-(void) addChar:(char)oneChar
{
    if (length+1 < DATA_MAX)
    {
        data[length] = oneChar;
        length++;
    }
}

-(void) addData:(Data*)otherData
{
    if (otherData->length + length < DATA_MAX)
    {
        memcpy(&data[length], otherData->data, otherData->length);
        length += otherData->length;
    }
}

@end
