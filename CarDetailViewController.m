//
//  CarDetailViewController.m
//  TableViewStory
//
//  Created by qbadmin on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CarDetailViewController.h"
#import "XMLParser.h"
@interface CarDetailViewController ()

@end

@implementation CarDetailViewController
@synthesize makeLabel = _makeLabel;
@synthesize modelLabel = _modelLabel;
@synthesize imageView = _imageView;
@synthesize carDetailModel = _carDetailModel;
@synthesize url = _url;

//XMLParser *xmlParser;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}

- (void)viewDidLoad
{
    
   //NSString *myurl = @"http://farm8.staticflickr.com/7256/7874621294_e989db874b_b.jpg";
   // NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:myurl]];
    //UIImage * image = [UIImage imageWithData:imageData];
    self.makeLabel.text = [self.carDetailModel objectAtIndex:0];
    self.modelLabel.text = [self.carDetailModel objectAtIndex:1];
    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self.carDetailModel objectAtIndex:2]]]];
                          
    //self.imageView.image = [UIImage imageWithData:imageData];
    [super viewDidLoad];
//    NSString *append1 = [xmlParser.owner objectAtIndex:(0)];
//    NSString *append2 = [xmlParser.photoid objectAtIndex:(0)];
//    NSString *fullurl = [NSString stringWithFormat:@"http://www.flickr.com/photos/%@/%@",append1,append2];
//    NSURL *url = [NSURL URLWithString:fullurl];
//    [[UIApplication sharedApplication] openURL: url];
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
