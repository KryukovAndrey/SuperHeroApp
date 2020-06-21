//
//  File.swift
//  SuperHeroApp
//
//  Created by Andrey on 21.06.2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

struct Persons: Decodable {
    let results: [Person]?
    let info: Info?
}

struct Person: Decodable {
    let gender: String?
    let name: Name?
    let email: String?
    let phone: String?
    let picture: Picture
}

struct Name: Decodable {
    let title: String?
    let first: String?
    let last: String?
}

struct Picture: Decodable {
    let large: String?
    let medium: String?
    let thumbnail: String?
}

struct Info: Decodable {
    let seed: String?
    let results: Int?
    let page: Int?
    let version: String?
}



