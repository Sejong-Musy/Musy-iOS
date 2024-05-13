//
//  CreateMusicFeatureInterface.swift
//  CreateMusicInterface
//
//  Created by 김도형 on 5/12/24.
//

import Domain
import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture

@Reducer
public struct CreateMusicFeature {
    @ObservableState
    public struct State: Equatable {
        public var music: Music = .init(memberId: .init())
        
        public init() {}
    }
    
    public enum Action {
        case tagButtonTapped(Music.Genre)
    }
    
    public init() {}
}
