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

@interface XMLParser : NSObject <NSXMLParserDelegate>  {
   
    NSMutableArray *_make;
    NSMutableString	*currentNodeContent;
    NSMutableArray *_model ;
    NSXMLParser		*parser;
    XML			*currentNode;
    NSMutableArray  *_photoid;
    NSMutableArray *_title ;
    NSMutableArray *_owner ;
    NSMutableArray *_org_secret ;
    NSMutableDictionary *_detailDic;
    NSString *_YQLQuery2 ;
    


}

@property (strong, readonly) NSMutableArray *data;
@property (nonatomic, retain) NSMutableArray *make;
@property (nonatomic, retain) NSMutableArray *model;
@property (nonatomic, retain) NSMutableArray *photoid;
@property (nonatomic, retain) NSMutableArray *title;
@property (nonatomic, retain) NSMutableArray *owner;
@property (nonatomic, retain) NSMutableArray *org_secret;
@property (nonatomic, retain) NSMutableDictionary *detailDic;
@property (nonatomic, retain) NSMutableDictionary *originalSecret;
@property (nonatomic, retain) NSString *YQLQuery2;

-(id) loadXMLByURL:(NSString *)urlString;
-(id) loadXMLByString:(NSString *)String;

@end
