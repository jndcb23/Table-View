//
//  Model.swift
//  Case 1 Exam
//
//  Created by John Nikko Borja on 05/11/2019.
//  Copyright © 2019 John Nikko Borja. All rights reserved.
//

import UIKit

class Model: NSObject {
    var imageLbl:String = ""
    var imageName:String = ""
    var imageYear:String = ""
    var imageBy:String = ""
    
    init(nameLbl:String,name:String,year:String,by:String) {
        self.imageLbl = nameLbl
        self.imageName = name
        self.imageYear = year
        self.imageBy = by
    }
    
    class func generateModelArray() -> [Model]{
        var modelAry = [Model]()
        
        modelAry.append(Model(nameLbl: "Mozilla Firefox", name: "img0", year: "2002", by: "Mozilla Foundation"))
        modelAry.append(Model(nameLbl: "Google Chrome", name: "img1", year: "2008", by: "Google LLC"))
        modelAry.append(Model(nameLbl: "Internet Explorer",name: "img2", year: "1995", by: "Microsoft"))
        modelAry.append(Model(nameLbl: "Opera Mini",name: "img3", year: "2005", by: "Opera Software AS"))
        modelAry.append(Model(nameLbl: "Safari",name: "img4", year: "2003", by: "Apple"))
        
        return modelAry
    }
}
