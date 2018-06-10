//
//  ViewController.m
//  PostOffice
//
//  Created by Utsav Kumar on 10/06/18.
//  Copyright © 2018 Home. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPSessionManager.h"
#import "FeedTableViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextView *myTextView = [[UITextView alloc] init];
    myTextView.text = @"Enter Pincode";
    myTextView.frame = CGRectMake(100,100,100,94);
    [self.view addSubview:myTextView];
    [myTextView sizeToFit];
    
    
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goButton.frame = CGRectMake(100,150,100,94);
    [goButton setTitle:@"Enter" forState:UIControlStateNormal];
    [self.view addSubview:goButton];
    
    
    [goButton addTarget:self
                                action:@selector(buttonPressed:)
                      forControlEvents:UIControlEventTouchUpInside];
    
    
    
    

    

    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)buttonPressed:(UIButton *) sender
{
    NSURL *baseURL = [NSURL URLWithString:@"http://postalpincode.in/api/pincode"];
    NSString *path = @"121006";

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    
    [manager GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         // Success
         NSLog(@"Success: %@", [responseObject allKeys]);
         self.jsonData  = responseObject;
//         [self requestSuccesful];
     }failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         // Failure
         NSLog(@"Failure: %@", error);
     }];
    

    

    
    
    
}


@end
