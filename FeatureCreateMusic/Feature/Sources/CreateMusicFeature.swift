//
//  CreateMusicFeature.swift
//  CreateMusicFeature
//
//  Created by 김도형 on 5/12/24.
//

import CreateMusicInterface
import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture

extension CreateMusicFeature {
    public init() {
        let reducer: Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .genreTagButtonTapped(let genre):
                state.music.genre = genre
                print(state.music.genre)
                return .none
            case .instrumentTagButtonTapped(let instrument):
                guard !state.music.instruments.contains(instrument) else {
                    state.music.instruments.remove(instrument)
                    return .none
                }
                state.music.instruments.insert(instrument)
                print(state.music.instruments)
                return .none
            }
        }
        
        self.init(reducer: reducer)
    }
}
