

#import "ParkInfoViewController.h"

@interface ParkInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextView *informationTextView;

@end

@implementation ParkInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self.colorPalette objectAtIndex:0];
    
    self.informationTextView.text = self.parkInformation;
    self.informationTextView.backgroundColor = [self.colorPalette objectAtIndex:1];
    self.informationTextView.font = [self.appFonts objectAtIndex:2];
    self.informationTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.informationTextView.layer.borderWidth = 2.5;
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
