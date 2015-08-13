

#import "ViewController.h"
#import "InfoDisplayViewController.h"

@interface ViewController ()


@end

@implementation ViewController
@synthesize textFieldFirstname;
@synthesize textFieldLastname;
@synthesize textFieldState;
@synthesize textFieldCity;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Details entry page";
    // Do any additional setup after loading the view, typically from a nib.
}
//ON click save button

- (IBAction)saveData:(UIButton *)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    InfoDisplayViewController *infoDisplayViewController =  [storyboard instantiateViewControllerWithIdentifier:@"InfoDisplayViewController"];
    infoDisplayViewController.firstname = textFieldFirstname.text;
    
    //navigating to other display controller
    
    [self.navigationController pushViewController:infoDisplayViewController animated:true];
    infoDisplayViewController.firstname = textFieldFirstname.text;
    infoDisplayViewController.lastname = textFieldLastname.text;
    infoDisplayViewController.state = textFieldState.text;
    infoDisplayViewController.city = textFieldCity.text;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end