//
//  Terminal.swift
//  Airportzo
//
//  Created by Pradeep Ramanathan on 10/08/22.
//

import Foundation

// MARK: - TerminalList
struct TerminalList: Codable {
    let statusCode: Int?
    let title, message: String?
    let data: DataClass?

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case title, message, data
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let common, arrival, departure, transit: [Common]?
}

// MARK: - Arrival
struct Common: Codable {
    let ttrToken, airportToken, airportName, airportCode: String?
    let cityID, cityName, countryID: String?
    let countryName: String?
    let countryCode: String?
    let terminalToken: String?
    let terminalName: String?
    let typeToken, typeName, categoryToken: String?
    let categoryName: CategoryName?
    let terminalString1, terminalString2, terminalString: String?

    enum CodingKeys: String, CodingKey {
        case ttrToken = "ttr_token"
        case airportToken = "airport_token"
        case airportName = "airport_name"
        case airportCode = "airport_code"
        case cityID = "city_id"
        case cityName = "city_name"
        case countryID = "country_id"
        case countryName = "country_name"
        case countryCode = "country_code"
        case terminalToken = "terminal_token"
        case terminalName = "terminal_name"
        case typeToken = "type_token"
        case typeName = "type_name"
        case categoryToken = "category_token"
        case categoryName = "category_name"
        case terminalString1 = "terminal_string1"
        case terminalString2 = "terminal_string2"
        case terminalString = "terminal_string"
    }
}

enum CategoryName: String, Codable {
    case arrival = "Arrival"
    case departure = "Departure"
    case transit = "Transit"
}

//enum CountryCode: String, Codable {
//    case countryCodeIN = "IN"
//    case my = "MY"
//    case us = "US"
//}

//enum CountryName: String, Codable {
//    case india = "India"
//    case malaysia = "Malaysia"
//    case unitedStatesOfAmerica = "United States of America"
//}

//enum TerminalName: String, Codable {
//    case terminal = "Terminal"
//    case terminal1 = "Terminal 1"
//    case terminal2 = "Terminal 2"
//    case terminal3 = "Terminal 3"
//}

