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
            case .nextButtonTapped:
                guard !state.music.instruments.isEmpty else {
                    return .none
                }
                state.phase = .length
                return .none
            case .lengthDoneButtonTapped:
                state.phase = .confirm
                return .none
            case .completeButtonTapped:
                state.phase = .complete
                return .none
            case .moveMusicListButtonTapped:
                return .none
            case .setLength(let length):
                state.second = length
                return .none
            }
        }
        
        self.init(reducer: reducer)
    }
}
