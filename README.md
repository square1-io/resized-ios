# Resized-iOS
This is an iOS client for resized.co, a realtime image resize manipulation service.

# Install

Via Cocoapods

Just add this to your Podfile

````
pod 'Resized'
````
# Usage

````objective-c
//Initialize...
ResizedService *resizedService = [ResizedService serviceWithKey:YOUR_RESIZED_CO_SERVICE_KEY
                                                         secret:YOUR_RESIZED_CO_SERVICE_SECRET];

//Override host if applicable (optional)
resizedService.host = @"https://img.resized.co";

//Set the default failover image (optional)
resizedService.defaultImageURL = @"http:/www.example.com/no-image.jpg";

//Get URL for resized Image from URL
NSString *resizedImageURL = [resizedService resizeImage:IMAGE_TO_RESIZE_URL
                                               withSize:NEW_SIZE];

````

# License

The MIT License (MIT). Please see [License File](https://github.com/square1-io/resized-ios/blob/master/LICENSE) for more information.
