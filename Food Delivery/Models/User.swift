//
//  User.swift
//  Food Delivery
//
//  Created by Manny Gonzales on 12/21/22.
//

import Foundation

class User: ObservableObject, Codable {
    
    enum CodingKeys: CodingKey {
        case username, firstName, lastName, contactNumber, profileImage
    }
        
    @Published var username = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var contactNumber = ""
    @Published var profileImage = ""
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(username, forKey: .username)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(contactNumber, forKey: .contactNumber)
        try container.encode(profileImage, forKey: .profileImage)
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        username = try container.decode(String.self, forKey: .username)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        contactNumber = try container.decode(String.self, forKey: .contactNumber)
        profileImage = try container.decode(String.self, forKey: .profileImage)
    }
}
