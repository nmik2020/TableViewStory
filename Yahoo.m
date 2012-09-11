//
//  Yahoo.m
//  TableViewStory
//
//  Created by qbadmin on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Yahoo.h"

@implementation Yahoo
NSString *ConsumerKey2 = @"dj0yJmk9N2RRaUxlSkp3ZVBxJmQ9WVdrOVIzWTFOWEpNTXpBbWNHbzlPVEE1TXpNek1EWXkmcz1jb25zdW1lcnNlY3JldCZ4PTI0" ;
NSString *ConsumerSecret2 = @"5a01aeeac818d12236ff2bba2eadd1dec2eaa5b1";
NSString *ApplicationID2 = @"Gv55rL30";
XMLParser *xmlParser;

//- (id)init {
//    if(self == [super init]) {
//    self.detailDic = [[NSMutableDictionary alloc]init];
//    }
//    return self;
//}

-(void) sendRequests:(id) val {  

   NSString *query = val;
YOSSession *session = [YOSSession sessionWithConsumerKey:ConsumerKey2  
                                       andConsumerSecret:ConsumerSecret2  
                                        andApplicationId:ApplicationID2];

YQLQueryRequest *yqlrequest = [YQLQueryRequest   
                               requestWithSession:session];  

NSString *structuredProfileLocationQuery = [NSString   
                                            stringWithFormat:query];

[yqlrequest query:structuredProfileLocationQuery  
     withDelegate:self]; 



}  

- (void )requestDidFinishLoading:(YOSResponseData *)data {  

    [xmlParser loadXMLByString:data.responseText];
    
   // NSMutableDictionary *idArray = [[NSMutableDictionary alloc] init];
    //idArray a xmlParser.photoid;
//    for (int i = 0; i<[xmlParser.photoid count]; i++) {
//        
//        
//        
//        
//        NSLog(@"owner: %@",[[xmlParser.photoid 
//                             objectAtIndex:i] valueForKey:@"owner"]); 
//        NSLog(@"title: %@",[[xmlParser.photoid 
//                             objectAtIndex:i] valueForKey:@"title"]);  
//        NSLog(@"id: %@",[[xmlParser.photoid 
//                          objectAtIndex:i] valueForKey:@"id"]);  
//        NSLog(@"farm: %@",[[xmlParser.photoid 
//                            objectAtIndex:i] valueForKey:@"farm"]);
//        NSLog(@"secret: %@",[[xmlParser.photoid 
//                              objectAtIndex:i] valueForKey:@"secret"]);
//        NSLog(@"server: %@",[[xmlParser.photoid 
//                              objectAtIndex:i] valueForKey:@"server"]);
//        NSLog(@"org secret %@",[[xmlParser.photoid 
//                                       objectAtIndex:i] valueForKey:@"originalsecret"]);
//        
//        
//    }
    NSLog(@"photoid YAHOO = %@",xmlParser.photoid);
    //return xmlParser.originalSecret;
//    NSString *url = [NSString stringWithFormat:@"http://farm%@.staticflickr.com/%@/%@_%@_o.jpg",[[idArray objectAtIndex:0] objectForKey:@"farm"],[[idArray objectAtIndex:0] objectForKey:@"server"],[[idArray objectAtIndex:0] objectForKey:@"id"],[[idArray objectAtIndex:0] objectForKey:@"originalsecret"]];
//    NSLog(@"URL %@",url);

   

}  
@end
