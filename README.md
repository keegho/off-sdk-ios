# Open Food Facts iOS SDK
An easy to use framework for building iOS apps for the open food facts database.
More coming soon...
## Install using cocoapods
`pod 'OpenFoodFactsSDK', :git => 'https://github.com/keegho/off-sdk-ios.git'`
## How to use the SDK?
Example:
`//Import the open food facts sdk to your view controller`
`import OpenFoodFactsSDK`

`//Initiate a variable from OFF class`
`private let off = OFF()`

`override func viewDidLoad() {
    super.viewDidLoad()
    //Call get product closure function
    off.getProduct(code: "34673490998") { (product, message) in
            if product != nil {
                print(product?.genericName ?? "NO PRODUCT NAME")
            } else {
                print(message ?? "NO MESSAGE")
            }
        }
}`

