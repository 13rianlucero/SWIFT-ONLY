import UIKit

var str = "Hello, playground"

struct Website {
    var title: String
    var URL: String
    
    init()
    {
        let t: String = "title"
        let url:String = "url link"
        title = t
        URL = url
    }
} // end of website struct

struct SocialMediaAccount {
    var nameSM: String
    var username: String
    var password: String {
        didSet {
            var pwSize: CGSize = password.size()
            if pwSize < 4 && pwSize > 8 {
                
            }
        }
    }
    var website: Website
    
    
}
