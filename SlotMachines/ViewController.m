//
//  ViewController.m
//  SlotMachines
//
//  Created by Ramesh on 29/11/16.
//  Copyright © 2016 Trellisys. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>

@interface ViewController ()
{
    NSArray* imgGallery;
    CATransition * slideTransition;
    NSTimer * timer_1;
    float gap;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@end

@implementation ViewController

- (void)viewDidLoad {
//    imgGallery = [NSArray arrayWithObjects:@"01.jpg",@"02.jpg",@"03.jpg",@"04.jpg",@"05.jpg",@"06.jpg",@"07.jpg",@"08.jpg",@"09.jpg",nil];
    imgGallery = [NSArray arrayWithObjects:@"01.jpg",@"02.jpg",@"03.jpg",@"04.jpg",@"05.jpg",nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnStartAnimation:(id)sender {
//    [self loadImageView1];
    [self startAnimation];
//    [self startAnimationWithTransform];
//    [self animateLikeGif];
}




#pragma mark PrivateMethods
-(UIImage*)getRandomImage{
    
    int r = arc4random() % (imgGallery.count - 1);
    
    return [UIImage imageNamed:[imgGallery objectAtIndex:r]];
}
-(UIVisualEffectView*)createBlurEffect{
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    UIVisualEffectView *bluredView = [[UIVisualEffectView alloc] initWithEffect:effect];
    
    bluredView.frame = self.imageView1.bounds;
    
    return bluredView;
    
}

#pragma mark Plan:D

- (void)animateLikeGif
{
    [super viewDidLoad];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imgGallery.count; i++) {
        [images addObject:[UIImage imageNamed:[imgGallery objectAtIndex:i]]];
    }
    
    // Normal Animation
    //    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 95, 86, 193)];
    self.imageView1.animationImages = images;
    self.imageView1.animationDuration = 2;
    
    //    [self.view addSubview:animationImageView];
    [self.imageView1 startAnimating];
    //    [self.imageView1 addSubview:[self createBlurEffect]];
}

#pragma mark Plan:C

-(void)startAnimationWithTransform{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    CGAffineTransform scaleTrans  = CGAffineTransformMakeScale(1.0f, 1.0f);
    CGAffineTransform lefttorightTrans  = CGAffineTransformMakeTranslation(-self.imageView1.frame.size.width,0.0f);
    self.imageView1.transform = CGAffineTransformConcat(scaleTrans, lefttorightTrans);
    [UIView commitAnimations];
}

#pragma mark Plan:B

- (void)startAnimation{
    slideTransition = [CATransition animation]; // CATransition * slideTransition; instance variable
    slideTransition.duration = 0.0;
    slideTransition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    slideTransition.type = kCATransitionPush;
    
//    timer_1 = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(slideShow:) userInfo:self.imageView1 repeats:NO];
//    [timer_1 fire];
    gap = 0.50;
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(slideShow:) userInfo:self.imageView1 repeats:NO];
    
//    NSTimer * timer_2 = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(slideShow:) userInfo:self.imageView2 repeats:YES];
//    [timer_2 fire];
//    
//    NSTimer * timer_3 = [NSTimer scheduledTimerWithTimeInterval:0.10 target:self selector:@selector(slideShow:) userInfo:self.imageView3 repeats:YES];
//    [timer_3 fire];
}
-(void)slideShow:(NSTimer*)theTimer{
    UIImageView* imgeView = (UIImageView*)[theTimer userInfo];
    [imgeView setAlpha:0.5];
    slideTransition.subtype =kCATransitionFromLeft;
    [imgeView.layer addAnimation:slideTransition forKey:nil];
    imgeView.image =[self getRandomImage];
    [imgeView setAlpha:1];
    
    if (gap < 0.00) {
        gap = 0.20;
        [NSTimer scheduledTimerWithTimeInterval:gap target:self selector:@selector(slideShow:) userInfo:self.imageView1 repeats:NO];
        return;
    }
    
    gap = gap - 0.05;
    [NSTimer scheduledTimerWithTimeInterval:gap target:self selector:@selector(slideShow:) userInfo:self.imageView1 repeats:NO];
    
}

#pragma mark Plan:A

-(void)loadImageView1{
    
    [UIView transitionWithView:self.imageView1
                      duration:1.0f
                       options:UIViewAnimationOptionCurveEaseIn
                    animations:^{
                        self.imageView1.image = [self getRandomImage];
                    } completion:^(BOOL finished) {
                        [UIView transitionWithView:self.imageView2
                                          duration:1.0f
                                           options:UIViewAnimationOptionCurveEaseIn
                                        animations:^{
                                            self.imageView2.image = [self getRandomImage];
                                        } completion:^(BOOL finished) {
                                            [UIView transitionWithView:self.imageView3
                                                              duration:1.0f
                                                               options:UIViewAnimationOptionCurveEaseIn
                                                            animations:^{
                                                                self.imageView3.image = [self getRandomImage];
                                                            } completion:^(BOOL finished) {
                                                            }];
                                        }];
                    }];
    
}

@end
