

#import "ParkViewController.h"

@interface ParkViewController ()
@property (weak, nonatomic) IBOutlet UILabel *informationLabel;
@property (weak, nonatomic) IBOutlet UILabel *galleryLabel;
@property (weak, nonatomic) IBOutlet UILabel *mapLabel;
@property (weak, nonatomic) IBOutlet UILabel *directionsLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *informationCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *galleryCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *mapCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *directionsCell;



@end

@implementation ParkViewController
-(void)viewWillAppear:(BOOL)animated
{
    NSString *parkName = [self.thePark getParkName];
    NSString *yearFounded = [self.thePark getYearFounded];
    NSString *title = [NSString stringWithFormat:@"%@:Founded %@",parkName,yearFounded];
    
    UIView *navTitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
    UILabel *myLabel = [[UILabel alloc]init];
    [myLabel setTextColor:[UIColor blackColor]];
    if ([parkName isEqualToString:@"Castillo de San Marcos"])
        [myLabel setFont:[UIFont fontWithName:@"Verdana-Bold" size:16]];
    else
        [myLabel setFont:[UIFont fontWithName:@"Verdana-Bold" size:20]];
    [myLabel setText:title];
    [myLabel sizeToFit];
    [navTitleView addSubview:myLabel];
    self.navigationItem.titleView = navTitleView;
    
   
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"informationsegue"])
     {
         ParkInfoViewController *destination = [segue destinationViewController];
         destination.parkInformation = self.thePark.parkInfo;
         destination.parkName = self.thePark.parkName;
         destination.appFonts = _appFonts;
         destination.colorPalette = _colorPalette;
     }
     else if([[segue identifier] isEqualToString:@"gallerysegue"])
     {
         ParkGalleryViewController *destination = [segue destinationViewController];
         destination.parkGallery = self.thePark.parkGallery;
         destination.parkGalleryCaptions = self.thePark.parkGalleryCaptions;
         destination.parkName = self.thePark.parkName;
         destination.appFonts = _appFonts;
         destination.colorPalette = _colorPalette;
     }
    else if ([[segue identifier] isEqualToString:@"mapsegue"])
    {
        ParkMapViewController *destination = [segue destinationViewController];
        destination.parkName = self.thePark.parkName;
        destination.map = self.thePark.parkMap;
        destination.colorPalette = self.colorPalette;
        
    }
    else if ([[segue identifier] isEqualToString:@"directionssegue"])
    {
        ParkDirectionsViewController *destination = [segue destinationViewController];
        destination.directions = self.thePark.parkDirections;
        destination.parkName = self.thePark.parkName;
        destination.appFonts = _appFonts;
        destination.colorPalette = _colorPalette;
    }
    else
        NSLog (@"%@",[NSString stringWithFormat:@"%s","Something went wrong with one of your segue identifiers."]);
    
}
-(void)setViews
{
    NSString *parkName = [self.thePark getParkName];
    self.informationLabel.text = [NSString stringWithFormat:@"Learn about %@ ",parkName];
    self.galleryLabel.text = [NSString stringWithFormat:@"%@ Gallery",parkName];
    self.mapLabel.text = [NSString stringWithFormat:@"Map of %@",parkName];
    self.directionsLabel.text = [NSString stringWithFormat:@"Directions to %@",parkName];
    
    self.informationLabel.font = [self.appFonts objectAtIndex:0];
    self.galleryLabel.font = [self.appFonts objectAtIndex:0];
    self.mapLabel.font = [self.appFonts objectAtIndex:0];
    self.directionsLabel.font = [self.appFonts objectAtIndex:0];
    
    self.informationCell.backgroundColor = [self.colorPalette objectAtIndex:0];
    self.galleryCell.backgroundColor = [self.colorPalette objectAtIndex:1];
    self.mapCell.backgroundColor = [self.colorPalette objectAtIndex:2];
    self.directionsCell.backgroundColor = [self.colorPalette objectAtIndex:3];
    
    self.informationCell.layer.borderWidth = 2.5;
    self.galleryCell.layer.borderWidth = 2.5;
    self.mapCell.layer.borderWidth = 2.5;
    self.directionsCell.layer.borderWidth = 2.5;
    
    self.informationCell.layer.borderColor = [UIColor blackColor].CGColor;
    self.galleryCell.layer.borderColor = [UIColor blackColor].CGColor;
    self.mapCell.layer.borderColor = [UIColor blackColor].CGColor;
    self.directionsCell.layer.borderColor = [UIColor blackColor].CGColor;
}

@end
