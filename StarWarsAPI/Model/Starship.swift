//
//  Starship.swift
//  StarWarsAPI
//
//  Created by Zebadiah Watson on 10/3/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation

struct TopLevelDectionary: Codable {
    let starships: [Starship]
}

struct Starship: Codable {
    
    enum CodingKeys: String, CodingKey {
        case model = "model"
        case name = "name"
        case cost = "cost_in_credits"
        case speed = "max_atmosphering_speed"
        case films = "films"
    }
    
    let name: String
    let model: String
    let cost: String
    let speed: String
    let films: [String]
    
}

