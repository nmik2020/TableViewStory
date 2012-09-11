//
//  XMLParser.m
//  ParsingXMLTutorial
//
//  Created by kent franks on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"
#import "YOSSocial.h"
#import "XML.h"


@implementation XMLParser 
@synthesize data = _data;
@synthesize make = _make;
@synthesize model = _model;
@synthesize  photoid = _photoid;
@synthesize  org_secret = _org_secret;
@synthesize title = _title;
@synthesize owner = _owner;
@synthesize detailDic = _detailDic;
@synthesize originalSecret = _originalSecret;
@synthesize YQLQuery2 = _YQLQuery2;

//@synthesize yahoo = _yahoo;

- (id) init {
    
    if(self == [super init]) {
        
        _data			= [[NSMutableArray alloc] init];
        _title          = [[NSMutableArray alloc]init];
        _photoid			= [[NSMutableArray alloc] init];
//        _detailDic          = [[NSMutableDictionary alloc]init];
        
    }
    
    return self;
    
}

-(id) loadXMLByURL:(NSString *)urlString
{
	_data			= [[NSMutableArray alloc] init];
    _make          = [[NSMutableArray alloc]init];
    _model          = [[NSMutableArray alloc]init];
	NSURL *url		= [NSURL URLWithString:urlString];
	NSData	*data   = [[NSData alloc] initWithContentsOfURL:url];
    parser			= [[NSXMLParser alloc] initWithData:data];
	parser.delegate = self;
	[parser parse];
	return self;
}
-(id) loadXMLByString:(NSString *)XMLString
{
//	_data			= [[NSMutableArray alloc] init];
//    _title          = [[NSMutableArray alloc]init];
//    _photoid			= [[NSMutableArray alloc] init];
//    _detailDic          = [[NSMutableDictionary alloc]init];
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
        [_detailDic setObject:[attributeDict objectForKey:@"id"] forKey:@"id"];
        [_detailDic setObject:[attributeDict objectForKey:@"title"] forKey:@"title"];
        [_detailDic setObject:[attributeDict objectForKey:@"owner"] forKey:@"owner"];
        [_detailDic setObject:[attributeDict objectForKey:@"secret"] forKey:@"secret"];
        [_detailDic setObject:[attributeDict objectForKey:@"farm"] forKey:@"farm"];
        [_detailDic setObject:[attributeDict objectForKey:@"server"] forKey:@"server"];
        [_photoid addObject:_detailDic];
        NSLog(@"Array :%@",_photoid);
     } 
}




- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{  }
@end

