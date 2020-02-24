//
//  Model.swift
//  epam-star-wars-heroes-wiki
//
//  Created by Артем Маков on 15/02/2020.
//  Copyright © 2020 Artem Makov. All rights reserved.
//

import Foundation

enum HeroParameters: String{
    case name = "Name"
    case planet = "Planet"
    case sex = "Sex"
}

enum HeroSex: String{
    case undefined = ""
    case male = "Male"
    case female = "Female"
}

func getRandomSex() -> HeroSex {
    switch Int.random(in: 0 ... 2){
    case 0: return .female
    case 1: return .male
    default:
        return .undefined
    }
}

struct Hero {
    var name: String = ""
    var planet: String = ""
    var sex:HeroSex = .undefined
    
    func getHeroVocabulary(withtDeffault:Bool) -> [HeroParameters: String] {
        var heroVocabulary = [HeroParameters: String]()
        if (withtDeffault){
            if (!name.isEmpty){
                heroVocabulary.updateValue(name, forKey: .name)
            }
            if (!planet.isEmpty){
                heroVocabulary.updateValue(planet, forKey: .planet)
            }
        }
        if (!sex.rawValue.isEmpty){
            heroVocabulary.updateValue(sex.rawValue, forKey: .sex)
        }
        return heroVocabulary
    }
}
