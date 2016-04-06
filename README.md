# Resized-iOS
This is the iOS client for resized.co, a realtime image resize manipulation service.

# Install

Via Cocoapods

Just add this to your Podfile

````
pod 'Resized'
````
# Usage

````
//Initialize
ResizedService *resizedService = [ResizedService resizedServiceWithServerBaseURL:YOUR_RESIZED_CO_URL
                            key:YOUR_RESIZED_SERVICE_KEY];

//Get URL for resized Image from URL
NSString *resizedImageURL = [resizedService uriForImage:IMAGE_TO_RESIZE_URL withSize:NEW_SIZE];
````

# License

The MIT License (MIT). Please see [License File](https://github.com/square1-io/resized-ios/blob/master/LICENSE) for more information.
