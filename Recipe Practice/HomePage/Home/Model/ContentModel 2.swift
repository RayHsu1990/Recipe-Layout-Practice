//
//  Content.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/17.
//

import UIKit


enum ContentStyle {
    case large(_ image:UIImage, _ title:String, _ type: FoodType)
    case medium(_ image: UIImage, _ title: String)
    case small(_ image: UIImage, _ type: FoodType)
}

struct Content {
    
    let contentImage: UIImage
    let type: String?
    let title: String?
    
    init(style:ContentStyle) {
        switch style {
        case let .large(image, title, type):
            self.contentImage = image
            self.type = type.rawValue
            self.title = title
        case let .medium(image, title):
            self.contentImage = image
            self.type = nil
            self.title = title
            
        case let .small(image, type):
            self.contentImage = image
            self.type = type.capitalTitle
            self.title = nil
            
        }
    }
}



extension Content {
    static func getLargeContents ()-> [Content] {
        return [
            Content(style: .large(UIImage(named: "bitmap1")!, "Soup with cooked mushroms", .soup)),
            Content(style: .large(UIImage(named: "bitmap1")!, "Soup with cooked mushroms", .soup)),
            Content(style: .large(UIImage(named: "bitmap1")!, "Soup with cooked mushroms", .soup))
        ]
    }
    static func getMediumContents ()-> [Content] {
        return [
            Content(style: .medium(UIImage(named: "bitmap")!, "Compose your own meal.")),
            Content(style: .medium(UIImage(named: "bitmap")!, "Compose your own meal.")),
            Content(style: .medium(UIImage(named: "bitmap")!, "Compose your own meal."))
            
        ]
    }
    static func getSmallContents ()-> [Content] {
        return [
            Content(style: .small(UIImage(named: "carrots")!, .vege)),
            Content(style: .small(UIImage(named: "service")!, .maindishes)),
            Content(style: .small(UIImage(named: "cakes")!, .cakes)),
            Content(style: .small(UIImage(named: "fastFood")!, .fastFood)),
            Content(style: .small(UIImage(named: "kids")!, .kids)),
            Content(style: .small(UIImage(named: "soup")!, .soup))
        ]
    }
    
}

enum FoodType: String {
    case soup , vege , maindishes , cakes , fastFood , kids
    
    var capitalTitle: String {
        switch self{
        case .soup: return "Soup"
        case .vege: return "Vege"
        case .maindishes: return "Main dishes"
        case .cakes: return "Cakes"
        case .fastFood: return "Fast food"
        case .kids: return "Kid's menu"
            
        }
    }
}


protocol PagingDelegate{
    
    func changePage(vc: UIViewController)
}


enum MainPageContentStyle: Int, CaseIterable {
    case largeContent , smallContent , mediumContent, recipeWithRate
}

