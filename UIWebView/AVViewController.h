//
//  AVViewController.h
//  UIWebView
//
//  Created by Anatoly Ryavkin on 26/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AVViewController : UIViewController<WKUIDelegate,WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonRewind;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonForward;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonRefresh;

- (IBAction)actionRewind;
- (IBAction)actionForward;
- (IBAction)actionRefresh;




@end

NS_ASSUME_NONNULL_END
