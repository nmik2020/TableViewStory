//
//  Yahoo.h
//  TableViewStory
//
//  Created by qbadmin on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YOSSession.h"
#import "YOSSocial.h"
#import "XMLParser.h"

@interface Yahoo : YOSSession {
//NSMutableDictionary *_detailDic;
}
-(void) sendRequests:(id) val;
-(void) requestDidFinishLoading:(YOSResponseData *)data;
- (id)init ;


@end
