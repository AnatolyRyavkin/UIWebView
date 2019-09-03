//
//  AVTableViewController.m
//  UIWebView
//
//  Created by Anatoly Ryavkin on 26/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVTableViewController.h"

@interface AVTableViewController ()

@end

@implementation AVTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)dealloc{
    NSLog(@"dealloc table");
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender{
    self.webController = segue.destinationViewController;
}


- (IBAction)actionFirstPDF:(UIButton *)sender {

    [self performSegueWithIdentifier:@"segueShowWeb" sender:nil];
    [self.webController.webView stopLoading];
    [self.webController.webView stopLoading];
    NSURL*url = [[NSURL alloc] initFileURLWithPath:@"Users/ryavkinto/Documents/Programming_in_Objective-C_-_6th_Edition.pdf"];
    NSData*data = [[NSData alloc]initWithContentsOfFile:@"Users/ryavkinto/Documents/Programming_in_Objective-C_-_6th_Edition.pdf"];
    [self.webController.webView loadData:data MIMEType:@"application/pdf" characterEncodingName:@"UTF-8" baseURL:url];

}

- (IBAction)actionSecondPDF:(UIButton *)sender {

    [self performSegueWithIdentifier:@"segueShowWeb" sender:nil];
    [self.webController.webView stopLoading];
    NSURL*url = [[NSURL alloc] initFileURLWithPath:@"/Users/ryavkinto/Documents/Development/Учебники/4иВ.А. Усов. Swift. Основы разработки приложений под iOS и macOS.pdf"];
    NSURLRequest*request = [NSURLRequest requestWithURL:url];
    [self.webController.webView loadRequest:request];

}

- (IBAction)actionFirstURL:(UIButton *)sender {

    //https://oauth.vk.com/authorize?client_id=1&display=page&redirect_uri=http://example.com/callback&scope=friends&response_type=token&v=5.101&state=123456


    [self performSegueWithIdentifier:@"segueShowWeb" sender:nil];
    [self.webController.webView stopLoading];
    NSURL*url = [[NSURL alloc] initWithString:@"https://oauth.vk.com/authorize?client_id=505195860&display=page&redirect_uri=http://example.com/callback&scope=friends&response_type=token&v=5.101&state=123456"];
//https://www.google.com/?client=safari"];
    NSURLRequest*request = [NSURLRequest requestWithURL:url];
    [self.webController.webView loadRequest:request];
}

- (IBAction)actionSecondURL:(UIButton *)sender {

    [self performSegueWithIdentifier:@"segueShowWeb" sender:nil];
    [self.webController.webView stopLoading];
    NSURL*url = [[NSURL alloc] initWithString:@"https://vk.com/iosdevcourse"];
    NSURLRequest*request = [NSURLRequest requestWithURL:url];
    [self.webController.webView loadRequest:request];

}

@end
