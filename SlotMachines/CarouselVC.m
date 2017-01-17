//
//  CarouselVC.m
//  SlotMachines
//
//  Created by Ramesh on 07/12/16.
//  Copyright © 2016 Trellisys. All rights reserved.
//

#import "CarouselVC.h"
#import "iCarousel.h"

@interface CarouselVC ()<iCarouselDelegate,iCarouselDataSource>{
    
    NSArray* imgGallery;
    int autoScrollValue;
}
@property (weak, nonatomic) IBOutlet iCarousel *carouselView;
@property (nonatomic, assign) BOOL wrap;

@end

@implementation CarouselVC

- (void)viewDidLoad {
//    imgGallery = [NSArray arrayWithObjects:@"01.jpg",@"02.jpg",@"03.jpg",@"04.jpg",@"05.jpg",@"06.jpg",@"07.jpg",@"08.jpg",@"09.jpg",nil];
    imgGallery = [NSArray arrayWithObjects:@"01.jpg",@"02.jpg",@"03.jpg",@"04.jpg",@"05.jpg",@"06.jpg",@"07.jpg",@"08.jpg",@"09.jpg",nil];
    self.carouselView.type = iCarouselTypeLinear;
    self.carouselView.delegate = self;
    self.carouselView.dataSource = self;
    self.wrap = YES;
    autoScrollValue = 2;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnCloseClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)btnSpinClick:(id)sender {
 
    [self.carouselView scrollByNumberOfItems:100 duration:5];

    
//    [self performSelector:@selector(autoScroll:) withObject:@"2" afterDelay:0.0];
//
//    [self performSelector:@selector(autoScroll:) withObject:@"5" afterDelay:3.0];
//    
//    [self performSelector:@selector(autoScroll:) withObject:@"7" afterDelay:5.0];
//    
//    [self performSelector:@selector(autoScroll:) withObject:@"10" afterDelay:7.0];
//    
//    [self performSelector:@selector(autoScroll:) withObject:@"5" afterDelay:9.0];
//    
//    [self performSelector:@selector(autoScroll:) withObject:@"1" afterDelay:11.0];
//    
//    [self performSelector:@selector(autoScroll:) withObject:@"0" afterDelay:12.0];
}

-(void)autoScroll:(NSString*)value{
    if ([value integerValue] == 0) {
        self.carouselView.autoscroll= 0;
//        [self.carouselView setStopAtItemBoundary:YES];
//        [self.carouselView stopAtItemBoundary];
        [self.carouselView setScrollEnabled:NO];

        return;
    }
    self.carouselView.autoscroll= [value integerValue];
}

-(UIImage*)getRandomImage{
    
    int r = arc4random() % (imgGallery.count - 1);
    
    return [UIImage imageNamed:[imgGallery objectAtIndex:r]];
}

#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(__unused iCarousel *)carousel
{
    return (NSInteger)[imgGallery count];
}

- (UIView *)carousel:(__unused iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, carousel.frame.size.width, carousel.frame.size.height)];
        ((UIImageView *)view).image = [self getRandomImage];
        view.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    return view;
}

- (NSInteger)numberOfPlaceholdersInCarousel:(__unused iCarousel *)carousel
{
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 2;
}

- (UIView *)carousel:(__unused iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, carousel.frame.size.width, carousel.frame.size.height)];
        ((UIImageView *)view).image = [self getRandomImage];
        view.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return view;
}

//- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
//{
//    //implement 'flip3D' style carousel
//    transform = CATransform3DRotate(transform, M_PI / 8.0, 0.0, 1.0, 0.0);
//    return CATransform3DTranslate(transform, 0.0, 0.0, offset * self.carousel.itemWidth);
//}
//
- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return self.wrap;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.05;
        }
        case iCarouselOptionFadeMax:
        {
            if (self.carouselView.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}

#pragma mark -
#pragma mark iCarousel taps

- (void)carousel:(__unused iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSNumber *item = (imgGallery)[(NSUInteger)index];
    NSLog(@"Tapped view number: %@", item);
}

- (void)carouselCurrentItemIndexDidChange:(__unused iCarousel *)carousel
{
//    NSLog(@"Index: %@", @(self.carousel.currentItemIndex));
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
