//
//  FirstViewController.m
//  PostOffice
//
//  Created by Utsav Kumar on 11/06/18.
//  Copyright © 2018 Home. All rights reserved.
//

#import "FirstViewController.h"
#import "AFHTTPSessionManager.h"
#import "FeedTableViewController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor yellowColor];
    self.myView = [[UITextView alloc] init];
    self.myView.text = @"Enter Pincode";
    self.myView.frame = CGRectMake(100,100,100,94);
    [self.view addSubview:self.myView];
    [self.myView sizeToFit];
    
    
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goButton.frame = CGRectMake(100,150,100,94);
    [goButton setTitle:@"Enter" forState:UIControlStateNormal];
    [self.view addSubview:goButton];
    
    
    [goButton addTarget:self
                 action:@selector(buttonPressed:)
       forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed:(UIButton *) sender
{
    NSURL *baseURL = [NSURL URLWithString:@"http://postalpincode.in/api/pincode"];
    NSString *path = self.myView.text;
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    
    [manager GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         // Success
//         NSLog(@"Success: %@", [[[responseObject objectForKey:@"PostOffice"] objectAtIndex:0] objectForKey:@"Name"]);
    NSLog(@"Success: %@", [responseObject allObjects]);
         self.jsonData  = responseObject;

         FeedTableViewController *feedVC = [[FeedTableViewController alloc] init];
         feedVC.responseObject = [responseObject objectForKey:@"PostOffice"];
         
         [self.navigationController pushViewController:feedVC animated:YES];
         //         [self requestSuccesful];
     }failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         // Failure
         NSLog(@"Failure: %@", error);
     }];
    

    
    
    
    
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
