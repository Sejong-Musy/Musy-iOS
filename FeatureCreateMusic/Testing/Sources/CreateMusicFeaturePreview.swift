//
//  CreateMusicFeaturePreview.swift
//  CreateMusicInterface
//
//  Created by 김도형 on 5/13/24.
//

import CreateMusicInterface
import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture

public extension CreateMusicFeature {
    static var preview: CreateMusicFeature {
        return .init(reducer: .init({ state, action in
            return .none
        }))
    }
}
