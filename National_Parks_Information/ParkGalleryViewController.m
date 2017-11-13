
#import "ParkGalleryViewController.h"

@interface ParkGalleryViewController ()
{
    NSInteger counter;
    NSUInteger sizeOfGallery;
}
@property (weak, nonatomic) IBOutlet UIImageView *galleryImageView;
@property (weak, nonatomic) IBOutlet UITextView *captionTextView;
@property (weak, nonatomic) IBOutlet UIButton *prevButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *nextButtonOutlet;



@end

@implementation ParkGalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self.colorPalette objectAtIndex:0];
    counter = 0;
    [self checkButtons];
    [self displayImageAndCaption];
    self.prevButtonOutlet.enabled = NO;
    sizeOfGallery = [self.parkGallery count];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    UIView *navTitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
    UILabel *myLabel = [[UILabel alloc]init];
    [myLabel setTextColor:[UIColor blackColor]];
    [myLabel setFont:[UIFont fontWithName:@"Verdana-Bold" size:24]];
    [myLabel setText:self.parkName];
    [myLabel sizeToFit];
    [navTitleView addSubview:myLabel];
    self.navigationItem.titleView = navTitleView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)prevButton:(UIButton *)sender {
    counter--;
    [self checkButtons];
    [self displayImageAndCaption];
}
- (IBAction)nextButton:(UIButton *)sender {
    counter++;
    [self checkButtons];
    [self displayImageAndCaption];
}
-(void)checkButtons
{
    if (counter<= 0)
    {
        self.prevButtonOutlet.enabled = NO;
    }
    else if (counter>0 && counter < (sizeOfGallery - 1))
    {
        self.prevButtonOutlet.enabled = YES;
        self.nextButtonOutlet.enabled = YES;
    }
    else if (counter >= (sizeOfGallery - 1))
    {
        self.nextButtonOutlet.enabled = NO;
    }
    
}
-(void)displayImageAndCaption
{
    self.galleryImageView.image = [self.parkGallery objectAtIndex:counter];
    self.captionTextView.text = [self.parkGalleryCaptions objectAtIndex:counter];
    
    self.captionTextView.font = [self.appFonts objectAtIndex:1];
    self.captionTextView.backgroundColor = [self.colorPalette objectAtIndex:1];
    self.captionTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.captionTextView.layer.borderWidth = 2.5;
    
    
    
}


@end
