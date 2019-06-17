//
//  DataManager.swift
//  domStar
//
//  Created by Dominick Hera on 6/12/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    var user = User.shared()
    let ariesStart = "03-21"
    let ariesEnd = "04-19"
    let taurusStart = "04-20"
    let tarusEnd = "05-20"
    let geminiStart = "05-21"
    let geminiEnd = "06-20"
    let cancerStart = "06-21"
    let cancerEnd = "07-22"
    let leoStart = "07-23"
    let leoEnd = "08-22"
    let virgoStart = "08-23"
    let virgoEnd = "09-22"
    let libraStart = "09-23"
    let libraEnd = "10-22"
    let scorpioStart = "10-23"
    let scorpioEnd = "11-21"
    let sagittariusStart = "11-22"
    let sagittariusEnd = "12-21"
    let aquariusStart = "01-20"
    let aquariusEnd = "02-18"
    let piscesStart = "02-19"
    let piscesEnd = "03-20"
    
    
    private init() {}
    
    func getSunSign(birthDateString: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, d, yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        if let tempIdea = (dateFormatter.date(from: birthDateString)) {
            dateFormatter.dateFormat = "MM-dd"
            let stringBirth = dateFormatter.string(from: tempIdea)
            let convertedBirthdate = dateFormatter.date(from: stringBirth)

            if((convertedBirthdate?.isBetween(dateFormatter.date(from: ariesStart)!, dateFormatter.date(from: ariesEnd)!))!) {
                return "Aries"
            } else if((convertedBirthdate?.isBetween(dateFormatter.date(from: taurusStart)!, dateFormatter.date(from: tarusEnd)!))!) {
                return "Taurus"
            } else if((convertedBirthdate?.isBetween(dateFormatter.date(from: geminiStart)!, dateFormatter.date(from: geminiEnd)!))!) {
                return "Gemini"
            } else if((convertedBirthdate?.isBetween(dateFormatter.date(from: cancerStart)!, dateFormatter.date(from: cancerEnd)!))!) {
                return "Cancer"
            } else if((convertedBirthdate?.isBetween(dateFormatter.date(from: leoStart)!, dateFormatter.date(from: leoEnd)!))!) {
                return "Leo"
            } else if((convertedBirthdate?.isBetween(dateFormatter.date(from: virgoStart)!, dateFormatter.date(from: virgoEnd)!))!) {
                return "Virgo"
            } else if((convertedBirthdate?.isBetween(dateFormatter.date(from: libraStart)!, dateFormatter.date(from: libraEnd)!))!) {
                return "Libra"
            } else if((convertedBirthdate?.isBetween(dateFormatter.date(from: scorpioStart)!, dateFormatter.date(from: scorpioEnd)!))!) {
                return "Scorpio"
            } else if((convertedBirthdate?.isBetween(dateFormatter.date(from: sagittariusStart)!, dateFormatter.date(from: sagittariusEnd)!))!) {
                return "Sagittarius"
            } else if((convertedBirthdate?.isBetween(dateFormatter.date(from: aquariusStart)!, dateFormatter.date(from: aquariusEnd)!))!) {
                return "Aquarius"
            } else if((convertedBirthdate?.isBetween(dateFormatter.date(from: piscesStart)!, dateFormatter.date(from: piscesEnd)!))!) {
                return "Pisces"
            }
        }
        
        return "Capricorn"
    }
    
    func getGreetingString(name: String, birthdate: String ) -> String {
        let sunSign = getSunSign(birthDateString: birthdate)
        var returnString = ""

        if (name == "" && birthdate == "") {
            returnString = "You should probably fill out your information first"
        } else if(name == "") {
            returnString = "Hello, your sun is in \(sunSign)"
        } else {
            returnString = "Hello \(name), your sun is in \(sunSign)"
        }
        
        return returnString
    }
}
