//
//  CoreImageStudyVC.m
//  TTToolSamples
//
//  Created by admin on 2018/7/19.
//  Copyright © 2018年 tongfy. All rights reserved.
//

#import "CoreImageStudyVC.h"

@interface CoreImageStudyVC ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic,strong) NSArray *categories;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CoreImageStudyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.categories = @[
                        kCICategoryDistortionEffect,
                        kCICategoryGeometryAdjustment,
                        kCICategoryCompositeOperation,
                        kCICategoryHalftoneEffect,
                        kCICategoryColorAdjustment,
                        kCICategoryColorEffect,
                        kCICategoryTransition,
                        kCICategoryTileEffect,
                        kCICategoryGenerator,
                        kCICategoryReduction,
                        kCICategoryGradient,
                        kCICategoryStylize,
                        kCICategorySharpen,
                        kCICategoryBlur,
                        kCICategoryVideo,
                        kCICategoryStillImage,
                        kCICategoryInterlaced,
                        kCICategoryNonSquarePixels,
                        kCICategoryHighDynamicRange,
                        kCICategoryBuiltIn,
                        kCICategoryFilterGenerator
                        ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.categories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *category = self.categories[section];
    return [CIFilter filterNamesInCategory:category].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSString *category = self.categories[indexPath.section];
    NSString *filterName = [[CIFilter filterNamesInCategory:category] objectAtIndex:indexPath.row];
    cell.textLabel.text = filterName;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *name = self.categories[section];
    NSString *shortName = [name stringByReplacingOccurrencesOfString:@"CICategory" withString:@""];
    return shortName;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *category = self.categories[indexPath.section];
    NSString *filterName = [[CIFilter filterNamesInCategory:category] objectAtIndex:indexPath.row];
    [self setupFilter:filterName];
}

- (void)setupFilter:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:@"image"];
    CGFloat scale = image.scale;
    UIImageOrientation oritentation = image.imageOrientation;
    
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    // CIDotScreen CICircularScreen CICMYKHalftone CIHatchedScreen CILineScreen
    CIFilter *filter = [CIFilter filterWithName:name];
    if ([filter.inputKeys containsObject:kCIInputImageKey]) {
        [filter setValue:inputImage forKey:kCIInputImageKey];
    }
    

    CIImage *outputImage = nil;

    if (filter && filter.outputImage) {

        outputImage = filter.outputImage;

        CIContext *context = [CIContext contextWithOptions:nil];
        CGImageRef imageRef = [context createCGImage:outputImage fromRect:outputImage.extent];
        UIImage *newImage = [UIImage imageWithCGImage:imageRef scale:scale orientation:oritentation];
        CGImageRelease(imageRef);

        self.imageView.image = newImage;
        NSLog(@"%@",filter.inputKeys);
    } else {
        NSLog(@"参数错误，查看文档");
    }
    NSLog(@"参数文档地址: %@",filter.attributes[@"CIAttributeReferenceDocumentation"]);

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)modeChange:(UISegmentedControl *)sender {
    
    NSArray *selectors = @[
                           NSStringFromSelector(@selector(orignal)),
                           NSStringFromSelector(@selector(halftone)),
                           NSStringFromSelector(@selector(sepiaTone))
                           ];
    
    if (sender.selectedSegmentIndex >= selectors.count) {
        return;
    }
    
    SEL sel = NSSelectorFromString(selectors[sender.selectedSegmentIndex]);
    [self performSelector:sel];
    
}

- (void)orignal
{
    UIImage *image = [UIImage imageNamed:@"image"];
    self.imageView.image = image;
}

- (void)halftone
{
    
//    NSArray *array = [CIFilter filterNamesInCategory:kCICategoryHalftoneEffect];
    
    UIImage *image = [UIImage imageNamed:@"image"];
    CGFloat scale = image.scale;
    UIImageOrientation oritentation = image.imageOrientation;
    
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    // CIDotScreen CICircularScreen CICMYKHalftone CIHatchedScreen CILineScreen
    CIFilter *filter = [CIFilter filterWithName:@"CIHatchedScreen"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    
    CIImage *outputImage = filter.outputImage;
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = [context createCGImage:outputImage fromRect:outputImage.extent];
    UIImage *newImage = [UIImage imageWithCGImage:imageRef scale:scale orientation:oritentation];
    CGImageRelease(imageRef);
    
    self.imageView.image = newImage;
    
    NSLog(@"%@",filter.attributes);
}
- (void)sepiaTone
{
    UIImage *image = [UIImage imageNamed:@"image"];

}

@end
