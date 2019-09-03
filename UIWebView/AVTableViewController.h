//
//  AVTableViewController.h
//  UIWebView
//
//  Created by Anatoly Ryavkin on 26/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AVTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIButton *firstPDF;
@property (weak, nonatomic) IBOutlet UIButton *secondPDF;
@property (weak, nonatomic) IBOutlet UIButton *firstURL;
@property (weak, nonatomic) IBOutlet UIButton *secondURL;
@property UIStoryboardSegue*segue;

@property (weak)AVViewController*webController;

- (IBAction)actionFirstPDF:(UIButton *)sender;
- (IBAction)actionSecondPDF:(UIButton *)sender;
- (IBAction)actionFirstURL:(UIButton *)sender;
- (IBAction)actionSecondURL:(UIButton *)sender;


@end

NS_ASSUME_NONNULL_END
