//
//  Photos.swift
//  SwiftUImvvm

import Foundation

struct Photos: Decodable, Identifiable {
    let albumId, id: Int
    let title, url, thumbnailUrl: String
}
