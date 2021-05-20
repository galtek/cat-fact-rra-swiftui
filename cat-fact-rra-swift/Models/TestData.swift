//
//  TestData.swift
//  cat-fact-rra-swift
//
//  Created by Rafael Rodriguez on 5/17/21.
//

import Foundation

struct TestData {
    let cats: [Cat] = getCats()
    
    
    static func getCats() -> [Cat] {
        var catsList:[Cat] = []
        
        catsList.append(Cat(_breed: "Cat 1", _country: "Country 1"))
        catsList.append(Cat(_breed: "Cat 2", _country: "Country 2"))
        catsList.append(Cat(_breed: "Cat 3", _country: "Country 3"))
        catsList.append(Cat(_breed: "Cat 4", _country: "Country 4"))
        catsList.append(Cat(_breed: "Cat 5", _country: "Country 5"))
        catsList.append(Cat(_breed: "Cat 6", _country: "Country 6"))
        catsList.append(Cat(_breed: "Cat 7", _country: "Country 7"))
        catsList.append(Cat(_breed: "Cat 8", _country: "Country 8"))
        catsList.append(Cat(_breed: "Cat 9", _country: "Country 9"))
        catsList.append(Cat(_breed: "Cat 10", _country: "Country 10"))
        catsList.append(Cat(_breed: "Cat 11", _country: "Country 11"))
        catsList.append(Cat(_breed: "Cat 12", _country: "Country 12"))
        catsList.append(Cat(_breed: "Cat 13", _country: "Country 13"))
        catsList.append(Cat(_breed: "Cat 14", _country: "Country 14"))
        catsList.append(Cat(_breed: "Cat 15", _country: "Country 15"))
        catsList.append(Cat(_breed: "Cat 16", _country: "Country 16"))
        catsList.append(Cat(_breed: "Cat 17", _country: "Country 17"))
        catsList.append(Cat(_breed: "Cat 18", _country: "Country 18"))
        catsList.append(Cat(_breed: "Cat 19", _country: "Country 19"))
        
        
        return catsList
    }
    
    static func getCatsCpl() -> [Cat] {
        var catsList:[Cat] = []
        
        catsList.append(Cat(_breed: "Cat 1", _country: "Country 1", _origin: "Origin 1", _coat: "Coat 1", _pattern: "Patter 1"))
        catsList.append(Cat(_breed: "Cat 2", _country: "Country 2", _origin: "Origin 2", _coat: "Coat 2", _pattern: "Patter 2"))
        catsList.append(Cat(_breed: "Cat 3", _country: "Country 3", _origin: "Origin 3", _coat: "Coat 3", _pattern: "Patter 3"))
        catsList.append(Cat(_breed: "Cat 4", _country: "Country 4", _origin: "Origin 4", _coat: "Coat 4", _pattern: "Patter 4"))
        catsList.append(Cat(_breed: "Cat 5", _country: "Country 5", _origin: "Origin 5", _coat: "Coat 5", _pattern: "Patter 5"))
        catsList.append(Cat(_breed: "Cat 6", _country: "Country 6", _origin: "Origin 6", _coat: "Coat 6", _pattern: "Patter 6"))
        catsList.append(Cat(_breed: "Cat 7", _country: "Country 7", _origin: "Origin 7", _coat: "Coat 7", _pattern: "Patter 7"))
        catsList.append(Cat(_breed: "Cat 8", _country: "Country 8", _origin: "Origin 8", _coat: "Coat 8", _pattern: "Patter 8"))
        catsList.append(Cat(_breed: "Cat 9", _country: "Country 9", _origin: "Origin 9", _coat: "Coat 9", _pattern: "Patter 9"))
        catsList.append(Cat(_breed: "Cat 10", _country: "Country 10"))
        catsList.append(Cat(_breed: "Cat 11", _country: "Country 11"))
        catsList.append(Cat(_breed: "Cat 12", _country: "Country 12"))
        catsList.append(Cat(_breed: "Cat 13", _country: "Country 13"))
        catsList.append(Cat(_breed: "Cat 14", _country: "Country 14"))
        catsList.append(Cat(_breed: "Cat 15", _country: "Country 15"))
        catsList.append(Cat(_breed: "Cat 16", _country: "Country 16"))
        catsList.append(Cat(_breed: "Cat 17", _country: "Country 17"))
        catsList.append(Cat(_breed: "Cat 18", _country: "Country 18"))
        catsList.append(Cat(_breed: "Cat 19", _country: "Country 19"))
        
        
        return catsList
    }
    
    static func getCatsNoIpCpl() -> [CatNoId] {
        var catsList:[CatNoId] = []
        
        catsList.append(CatNoId(breed: "Cat 1", country: "Country 1", origin: "Origin 1", coat: "Coat 1", pattern: "Patter 1"))
        catsList.append(CatNoId(breed: "Cat 2", country: "Country 2", origin: "Origin 2", coat: "Coat 2", pattern: "Patter 2"))
        catsList.append(CatNoId(breed: "Cat 3", country: "Country 3", origin: "Origin 3", coat: "Coat 3", pattern: "Patter 3"))
        catsList.append(CatNoId(breed: "Cat 4", country: "Country 4", origin: "Origin 4", coat: "Coat 4", pattern: "Patter 4"))
        catsList.append(CatNoId(breed: "Cat 5", country: "Country 5", origin: "Origin 5", coat: "Coat 5", pattern: "Patter 5"))
        catsList.append(CatNoId(breed: "Cat 6", country: "Country 6", origin: "Origin 6", coat: "Coat 6", pattern: "Patter 6"))
        catsList.append(CatNoId(breed: "Cat 7", country: "Country 7", origin: "Origin 7", coat: "Coat 7", pattern: "Patter 7"))
        catsList.append(CatNoId(breed: "Cat 8", country: "Country 8", origin: "Origin 8", coat: "Coat 8", pattern: "Patter 8"))
        catsList.append(CatNoId(breed: "Cat 9", country: "Country 9", origin: "Origin 9", coat: "Coat 9", pattern: "Patter 9"))
        catsList.append(CatNoId(breed: "Cat 10", country: "Country 10"))
        catsList.append(CatNoId(breed: "Cat 11", country: "Country 11"))
        catsList.append(CatNoId(breed: "Cat 12", country: "Country 12"))
        catsList.append(CatNoId(breed: "Cat 13", country: "Country 13"))
        catsList.append(CatNoId(breed: "Cat 14", country: "Country 14"))
        catsList.append(CatNoId(breed: "Cat 15", country: "Country 15"))
        catsList.append(CatNoId(breed: "Cat 16", country: "Country 16"))
        catsList.append(CatNoId(breed: "Cat 17", country: "Country 17"))
        catsList.append(CatNoId(breed: "Cat 18", country: "Country 18"))
        catsList.append(CatNoId(breed: "Cat 19", country: "Country 19"))
        
        
        return catsList
    }
}
