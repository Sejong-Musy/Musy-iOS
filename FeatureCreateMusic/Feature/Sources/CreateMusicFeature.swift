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
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .tagButtonTapped(let genre):
                state.music.genre = genre
                return .none
            }
        }
    }
}
