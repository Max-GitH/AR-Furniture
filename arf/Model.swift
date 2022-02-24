//
//  Model.swift
//  arf
//
//  Created by Max Nonisa on 2/24/22.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory: CaseIterable {
    case swan
    case saucer_set
    case tulip
    case teapot
    
    var label: String{
        get{
            switch self{
            case .swan:
                return "chair_swan"
            case .saucer_set:
                return "cup_saucer_set"
            case .tulip:
                return "flower_tulip"
            case .teapot:
                return "teapot"
            }
        }
    }
}

class Model {
    var name: String
    var category: ModelCategory
    var thumbnail: UIImage
    var modelEntity: ModelEntity?
    var scaleCompendation: Float
    
    init(name: String, category: ModelCategory, scaleCompensation: Float = 1.0){
        self.name = name
        self .category = category
        // TODO: add thumbnail for other 3d assets
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.scaleCompendation = scaleCompensation
    }
    
    // TODO: create a method to async load modelEntity
}

struct Models{
    var all: [Model] = []
    
    init() {
        let chair_swan = Model(name: "chair_swan", category: .swan, scaleCompensation: 0.5)
        self.all.append(chair_swan)
        
        let cup_saucer_set = Model(name: "cup_sauacer_set", category: .saucer_set, scaleCompensation: 1.0)
        self.all.append(cup_saucer_set)
        
        let flower_tulip = Model(name: "flower_tulip", category: .tulip, scaleCompensation: 0.32/100)
        self.all.append(flower_tulip)
        
        let teapot = Model(name: "teapot", category: .teapot, scaleCompensation: 1.0)
        self.all.append(teapot)
    }
    
    func get(category: ModelCategory) -> [Model] {
        return all.filter({$0.category == category})
    }
}
