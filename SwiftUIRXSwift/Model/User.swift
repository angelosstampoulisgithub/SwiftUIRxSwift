//
//  User.swift
//  SwiftUIRXSwift
//
//  Created by Angelos Staboulis on 6/10/25.
//

import Foundation
struct User: Decodable, Identifiable {
    let id: Int
    let name: String
    let email: String
}
