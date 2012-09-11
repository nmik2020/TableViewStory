//
//  XMLParser.h
//  ParsingXMLTutorial
//
//  Created by kent franks on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XML.h"
#import "Yahoo.h"

@interface OriginalSecret : NSObject <NSXMLParserDelegate>  {
    
    NSMutableArray *_make;
    NSMutableString	*currentNodeContent;
    NSMutableArray *_model ;
    NSXMLParser		*parser;
    XML			*currentNode;
    NSMutableArray *_originalSecret ;
    NSMutableDictionary *_detailDic;
       
    
}

@property (strong, readonly) NSMutableArray *data;
@property (nonatomic, retain) NSMutableArray *photoid;
@property (nonatomic, retain) NSMutableArray *originalSecret;
@property (nonatomic, retain) NSMutableDictionary *detailDic;



-(id) loadXMLByString:(NSString *)String;

@end