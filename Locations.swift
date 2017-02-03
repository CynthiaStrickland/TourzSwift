//
//  Locations.swift
//  TourzSwift
//
//  Created by Cynthia Whitlatch on 2/3/17.
//  Copyright © 2017 Cynthia Sinclair. All rights reserved.
//

import Foundation

class locationsVisited: NSObject {
    
    var nameOfLocationVisited: String?
    var addressOfLocationVisited: String?
    var websiteOfLocationVisited: String?
    var ratingOfLocationVisited: String?
    var imageOfLocationVisited: UIImage?
    var videoOfLocationVisited: UIVideoEditorController?
    
    init(nameOfLocationVisited:String, addressOfLocationVisited:String, websiteOfLocationVisited:String, ratingOfLocationVisited:String, imageOfLocationVisited: UIImage, videoOfLocationVisited: UIVideoEditorController) {
        self.nameOfLocationVisited = nameOfLocationVisited
        self.addressOfLocationVisited = addressOfLocationVisited
        self.websiteOfLocationVisited = websiteOfLocationVisited
        self.ratingOfLocationVisited = ratingOfLocationVisited
        self.imageOfLocationVisited = imageOfLocationVisited
        self.videoOfLocationVisited = videoOfLocationVisited
    }
    
    
}
