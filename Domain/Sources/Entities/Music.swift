//
//  Music.swift
//  Domain
//
//  Created by 김도형 on 5/12/24.
//

import Foundation

public struct Music: Identifiable, Equatable {
    public let id: UUID
    public let memberId: UUID
    public let url: String
    public var genre: Genre
    public var length: TimeInterval
    public var instruments: Set<Instrument>
    
    public init(
        id: UUID = .init(),
        memberId: UUID,
        url: String = "",
        genre: Genre = .blues,
        length: TimeInterval = 150,
        instruments: Set<Instrument> = .init()) {
        self.id = id
        self.memberId = memberId
        self.url = url
        self.genre = genre
        self.length = length
        self.instruments = instruments
    }
}

public extension Music {
    enum Genre: String, CaseIterable, Equatable {
        case blues = "Blues"
        case classical = "Classical"
        case country = "Country"
        case metal = "Metal"
        case pop = "Pop"
        case reggae = "Reggae"
        case rock = "Rock"
        case hiphop = "Hiphop"
        case Disco = "Disco"
    }
    
    enum Instrument: String, CaseIterable, Equatable {
        case electornicGuitar = "Electronic guitar"
        case acousticGuitar = "Acoustic guitar"
        case bass = "Bass"
        case drums = "Drums"
        case violin = "Violin"
        case piano = "Piano"
        case cello = "Cello"
        case flute = "Flute"
        case clarinet = "Clarinet"
        case horn = "Horn"
        case doubleBass = "Double bass"
        case trumbone = "Trumbone"
        case trumpet = "Trumpet"
        case saxophone = "Saxophone"
    }
}
