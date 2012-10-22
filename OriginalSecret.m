//
//  XMLParser.m
//  ParsingXMLTutorial
//
//  Created by kent franks on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OriginalSecret.h"
#import "YOSSocial.h"
#import "XML.h"


@implementation OriginalSecret 
@synthesize data = _data;
@synthesize  photoid = _photoid;
@synthesize detailDic = _detailDic;
@synthesize originalSecret = _originalSecret;


- (id) init {
    
    if(self == [super init]) {
        
        
        _originalSecret			= [[NSMutableArray alloc] init];
        
             
    }
    
    return self;
    
}

-(id) loadXMLByString:(NSString *)XMLString
{
   
    NSData* data = [XMLString dataUsingEncoding:NSUnicodeStringEncoding];
    parser			= [[NSXMLParser alloc] initWithData:data];
	parser.delegate = self;
	[parser parse];
	return self;
}
- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    if ([elementname isEqualToString:@"photo"]) 
	{
        
        _detailDic = [[NSMutableDictionary alloc]init];
        NSLog(@"%@",[attributeDict objectForKey:@"originalsecret"]);
        [_detailDic setObject:[attributeDict objectForKey:@"originalsecret"] forKey:@"originalsecret"];
        [_originalSecret addObject:_detailDic];
       
    } 
}




- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{  }
@end

