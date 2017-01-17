//
//  WebViewStyleVC.m
//  SlotMachines
//
//  Created by Ramesh on 05/12/16.
//  Copyright © 2016 Trellisys. All rights reserved.
//

#import "WebViewStyleVC.h"

@interface WebViewStyleVC ()
@property (weak, nonatomic) IBOutlet UIWebView *slotMWebView;

@end

@implementation WebViewStyleVC

- (void)viewDidLoad {
    
    [self.slotMWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]isDirectory:NO]]];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)CloseButtonClick:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        [self.slotMWebView removeFromSuperview];
       self.slotMWebView = nil;
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
