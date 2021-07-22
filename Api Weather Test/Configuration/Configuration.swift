//
//  Configuration.swift
//  Api Weather Test
//
//  Created by Max Nguyen on 7/21/21.
//

import Foundation

struct API {
    static let APIKey = "89652d405a68b80049a6f3fa42909a1a"
    static let BaseURL = URL(string: "api.openweathermap.org")!
    static var AuthenticationBaseURL: URL{return BaseURL.appendingPathComponent(APIKey)}
}


struct Defaults {
    static let Latitude: Double = 41.8719123
    static let Longitude: Double = -87.6501368

}
