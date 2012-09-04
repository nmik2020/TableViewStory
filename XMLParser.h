//
//  XMLParser.h
//  ParsingXMLTutorial
//
//  Created by kent franks on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XML.h"

@interface XMLParser : NSObject <NSXMLParserDelegate> {
   
    NSMutableArray *_make;
    NSMutableString	*currentNodeContent;
    NSMutableArray *_model ;
    NSMutableArray *_image ;
    //NSMutableArray *author ;
    NSXMLParser		*parser;
    XML			*currentNode;
    bool            isStatus;

}

@property (strong, readonly) NSMutableArray *data;
@property (nonatomic, retain) NSMutableArray *make;
@property (nonatomic, retain) NSMutableArray *model;
@property (nonatomic, retain) NSMutableArray *image;

-(id) loadXMLByURL:(NSString *)urlString;

@end
