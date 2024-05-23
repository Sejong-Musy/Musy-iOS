//
//  SiginInFeature.swift
//  CreateMusicInterface
//
//  Created by 박근경 on 2024/05/20.
//

import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture
import SignInInterface

extension SignInFeature {
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .moveMusicPageTapped:
                return .none
            case .HomeButtonTapped:
                return .none
            }
        }
    }
}
