//
//  AVViewController.m
//  UIWebView
//
//  Created by Anatoly Ryavkin on 26/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVViewController.h"


@interface AVViewController ()

@end

@implementation AVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.indicator.hidesWhenStopped = YES;
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    self.webView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    NSURL*urlRemove = [[NSURL alloc]initWithString:@"https://www.yandex.ru"];
    NSURLRequest*request = [NSURLRequest requestWithURL:urlRemove];
    [self.webView loadRequest:request];
    [self.barButtonRewind setAction:@selector(actionRewind)];
    [self.barButtonForward setAction:@selector(actionForward)];
    [self.barButtonRefresh setAction:@selector(actionRefresh)];
}

-(void)dealloc{
    NSLog(@"dealloc");
}

-(void)checkRewFor{
    self.barButtonRewind.enabled =  self.webView.canGoBack;
    self.barButtonForward.enabled = self.webView.canGoForward;
}

-(void)actionRewind{
    [self.webView stopLoading];
    [self.webView goBack];
}

- (IBAction)actionForward{
    [self.webView stopLoading];
    [self.webView goForward];
}

- (IBAction)actionRefresh{
    [self.webView stopLoading];
    [self.webView reload];
}

#pragma mark - DelegationNavigate

/*
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
     NSLog(@"decidePolicyForNavigationAction");
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    NSLog(@"decidePolicyForNavigationResponse");
}

*/

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
     [self.indicator startAnimating];
    NSLog(@"didStartProvisionalNavigation");
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"didReceiveServerRedirectForProvisionalNavigation");
    [self checkRewFor];
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    if(error){
        [error debugDescription];
        [self.webView stopLoading];
        [self checkRewFor];
    }
    NSLog(@"didFailProvisionalNavigation");
}
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"didCommitNavigation");
    [self checkRewFor];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    [self.indicator stopAnimating];
    [self checkRewFor];
    NSLog(@"didFinishNavigation");
}
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    if(error){
        [error debugDescription];
        [self.webView stopLoading];
        [self checkRewFor];
    }

    NSLog(@"didFailNavigation");
}
/*
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler{
     NSLog(@"didReceiveAuthenticationChallenge");
}
*/

- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView API_AVAILABLE(macosx(10.11), ios(9.0)){
    NSLog(@"webViewWebContentProcessDidTerminate");
    [self checkRewFor];
}



#pragma mark - Delegat
/*
-(nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    NSLog(@"createWebViewWithConfiguration");
    return self.webView;

}

*/
- (void)webViewDidClose:(WKWebView *)webView{
    NSLog(@"webViewDidClose");
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    NSLog(@"111");
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{
    NSLog(@"11");
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler{
    NSLog(@"1");

}

- (BOOL)webView:(WKWebView *)webView shouldPreviewElement:(WKPreviewElementInfo *)elementInfo API_AVAILABLE(ios(10.0)){
     NSLog(@"shouldPreviewElement");
    return YES;
}

- (nullable UIViewController *)webView:(WKWebView *)webView previewingViewControllerForElement:(WKPreviewElementInfo *)elementInfo defaultActions:(NSArray<id <WKPreviewActionItem>> *)previewActions API_AVAILABLE(ios(10.0)){
    NSLog(@"previewingViewControllerForElement");
    return self;
}

- (void)webView:(WKWebView *)webView commitPreviewingViewController:(UIViewController *)previewingViewController API_AVAILABLE(ios(10.0)){
    NSLog(@"commitPreviewingViewController");
}



@end
