

#import "ParkDirectionsViewController.h"

@interface ParkDirectionsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *directionsTextView;

@end

@implementation ParkDirectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self.colorPalette objectAtIndex:0];
    self.directionsTextView.text = self.directions;
    self.directionsTextView.font = [self.appFonts objectAtIndex:2];
    self.directionsTextView.backgroundColor = [self.colorPalette objectAtIndex:1];
    self.directionsTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.directionsTextView.layer.borderWidth = 2.5;
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



@end
