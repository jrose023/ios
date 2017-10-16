//
//  ViewController.m
//  assig2
//
//  Created by Julie Rosenbaum on 10/11/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "ViewController.h"
#import "Object_Info.h"
#import "StockController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *productPic;
@property (weak, nonatomic) IBOutlet UITextField *productName;
@property (weak, nonatomic) IBOutlet UITextField *productDesc;
@property (weak, nonatomic) IBOutlet UITextField *productCost;
@property (weak, nonatomic) IBOutlet UITextField *productAvail;
@property (strong, nonatomic) NSMutableArray *productArray;
@property int idx;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation ViewController
- (IBAction)increment:(id)sender {
    Object_Info *obj = [self.productArray objectAtIndex:_idx];
        [obj setUnitsLeft:[obj getUnitsLeft]+1];
        self.productAvail.text = [[NSString alloc] initWithFormat:@"%.0d", [obj getUnitsLeft]];
        [_productArray replaceObjectAtIndex:_idx withObject:obj];
}
- (IBAction)decrement:(id)sender {
    Object_Info *obj = [self.productArray objectAtIndex:_idx];
    if ([obj getUnitsLeft] > 0){
        [obj setUnitsLeft:[obj getUnitsLeft]-1];
        self.productAvail.text = [[NSString alloc] initWithFormat:@"%.0d", [obj getUnitsLeft]];
        [_productArray replaceObjectAtIndex:_idx withObject:obj];
    }
}
- (IBAction)nextProduct:(id)sender {
    if ([self.productArray objectAtIndex:_idx] != [_productArray lastObject]){
        [_backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _idx++;
        Object_Info *obj = [self.productArray objectAtIndex:_idx];
        self.productCost.text = [[NSString alloc] initWithFormat:@"%.2f", [obj getRetail]];
        self.productAvail.text = [[NSString alloc] initWithFormat:@"%d", [obj getUnitsLeft]];
        self.productName.text = [obj getName];
        self.productDesc.text = [obj getDescription];
        self.productPic.image = [UIImage imageNamed:[obj getImage]];
        }
    else{
         [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}
- (IBAction)backProduct:(id)sender {
    if ([_productArray objectAtIndex:_idx] != [_productArray firstObject]){
        [_nextButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _idx--;
        Object_Info *obj = [self.productArray objectAtIndex:_idx];
        self.productCost.text = [[NSString alloc] initWithFormat:@"%.2f", [obj getRetail]];
        self.productAvail.text = [[NSString alloc] initWithFormat:@"%d", [obj getUnitsLeft]];
        self.productName.text = [obj getName];
        self.productDesc.text = [obj getDescription];
        self.productPic.image = [UIImage imageNamed:[obj getImage]];
    }
    else{
        [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    StockController *stock = [StockController new];
    
    [stock add_item:0 withName:@"iPhone" withDescription:@"Apple" withRetail:700 withStock:43 withImage:@"/Users/jrose/Documents/F17/iOS/iphone.jpg"];
    [stock add_item:1 withName:@"Pixel" withDescription:@"Google" withRetail:600 withStock:37 withImage:@"/Users/jrose/Documents/F17/iOS/pixel.jpg"];
    [stock add_item:2 withName:@"Galaxy" withDescription:@"Samsung" withRetail:400 withStock:84 withImage:@"/Users/jrose/Documents/F17/iOS/galaxy.jpeg"];
    [stock add_item:3 withName:@"S8" withDescription:@"Samsung" withRetail:500 withStock:60 withImage:@"/Users/jrose/Documents/F17/iOS/s8.jpeg"];
    
    self.productArray = [stock getStockArray];
    Object_Info *obj = [self.productArray objectAtIndex:0];
    
    self.productCost.text = [[NSString alloc] initWithFormat:@"%.2f", [obj getRetail]];
    self.productAvail.text = [[NSString alloc] initWithFormat:@"%d", [obj getUnitsLeft]];
    self.productName.text = [obj getName];
    self.productDesc.text = [obj getDescription];
    self.productPic.image = [UIImage imageNamed:[obj getImage]];

    _idx = 0;
    
}
@end
#import "Object_Info.h"
@interface SecondViewController ()
@property Object_Info *newObj;

@end

@implementation SecondViewController
- (IBAction)name:(id)sender {
    NSString *text = [sender value];
    [_newObj setName: text];
}
- (IBAction)desc:(id)sender {
}
@end








