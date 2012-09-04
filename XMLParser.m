//
//  XMLParser.m
//  ParsingXMLTutorial
//
//  Created by kent franks on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"

@implementation XMLParser 
@synthesize data = _data;
@synthesize make = _make;
@synthesize model = _model;
@synthesize image = _image;

-(id) loadXMLByURL:(NSString *)urlString
{
	_data			= [[NSMutableArray alloc] init];
    _make          = [[NSMutableArray alloc]init];
    _model          = [[NSMutableArray alloc]init];
    _image          = [[NSMutableArray alloc]init];
	NSURL *url		= [NSURL URLWithString:urlString];
	NSData	*data   = [[NSData alloc] initWithContentsOfURL:url];
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
	if ([elementname isEqualToString:@"car"]) 
	{
		currentNode = [XML alloc];
        isStatus = YES;
        
	}
	//if ([elementname isEqualToString:@"user"]) 
	//{
        //isStatus = NO;
	//}
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{  //titles = [[NSMutableArray alloc] initWithObjects:nil];
//    author = [[NSMutableArray alloc] initWithObjects:nil];

    if (isStatus) 
    {
        if ([elementname isEqualToString:@"make"]) 
        {
            currentNode.make = currentNodeContent;
            [self.make addObject:currentNodeContent];
           // NSLog(@"%i",_make.count);
        }
        if ([elementname isEqualToString:@"model"]) 
        {
            currentNode.model = currentNodeContent;
            [self.model addObject:currentNodeContent];
           // NSLog(@"%i",_model.count);
            
        }
        if ([elementname isEqualToString:@"image"]) 
        {
            currentNode.image = currentNodeContent;
            [self.image addObject:currentNodeContent];
            //NSLog(@"%i",_image.count);
            
        }
    }
	if ([elementname isEqualToString:@"car"]) 
	{
		[self.data addObject:currentNode];
        
		currentNode = nil;
		currentNodeContent = nil;
	}
}

@end

