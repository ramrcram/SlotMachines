//
//  3ViewVC.m
//  SlotMachines
//
//  Created by Ramesh on 06/12/16.
//  Copyright © 2016 Trellisys. All rights reserved.
//

#import "3ViewVC.h"

@interface _ViewVC ()

@end

@implementation _ViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)CloseButtonClick:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
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
