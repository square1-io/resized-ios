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
ResizedService *resizedService = [ResizedService resizedServiceWithServerBaseURL:YOUR_RESIZED_CO_SERVICE_URL
                                                                             key:YOUR_RESIZED_CO_SERVICE_KEY];

//...or initialize with placeholder URL
ResizedService *resizedService = [ResizedService resizedServiceWithServerBaseURL:YOUR_RESIZED_CO_SERVICE_URL
                                                                             key:YOUR_RESIZED_CO_SERVICE_KEY
                                                                     placeholder:YOUR_PLACEHOLDER_URL];


//Get URL for resized Image from URL
NSString *resizedImageURL = [resizedService uriForImage:IMAGE_TO_RESIZE_URL
                                               withSize:NEW_SIZE];

//And you can use a specific placeholder as a wrong resizing fallback
NSString *resizedImageURL = [resizedService uriForImage:IMAGE_TO_RESIZE_URL
                                               withSize:NEW_SIZE
                                            placeholder:YOUR_PLACEHOLDER_URL];                                      
````

# License

The MIT License (MIT). Please see [License File](https://github.com/square1-io/resized-ios/blob/master/LICENSE) for more information.
