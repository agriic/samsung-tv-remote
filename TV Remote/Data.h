//
//  Data.h
//  TV Remote 2
//
//  Created by Agris Dumins on 6/12/13.
//  Copyright (c) 2013 Agris Dumins. All rights reserved.
//

#import <Foundation/Foundation.h>

enum
{
    DATA_MAX = 1000,
};

@interface Data : NSObject
{
    uint8_t data[DATA_MAX];
    uint32_t length;
}


-(uint8_t*) data;
-(uint32_t) length;

- (id)init;
-(void) addNSString:(NSString*) string;
-(void) addChar:(char)oneChar;
-(void) addData:(Data*)otherData;

@end
