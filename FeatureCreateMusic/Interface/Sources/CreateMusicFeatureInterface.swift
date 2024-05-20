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
        public var phase: CreateMusicPhase = .tag
        public var second: Int = 150
        
        public init() {}
    }
    
    public enum Action {
        case genreTagButtonTapped(Music.Genre)
        case instrumentTagButtonTapped(Music.Instrument)
        case nextButtonTapped
        case lengthDoneButtonTapped
        case completeButtonTapped
        case moveMusicListButtonTapped
        case setLength(Int)
    }
    
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public var body: some ReducerOf<Self> {
        reducer
    }
}

extension CreateMusicFeature {
    public enum CreateMusicPhase {
        case tag
        case length
        case confirm
        case complete
    }
}