//
//  SignInFeatrueInterface.swift
//  CreateMusicInterface
//
//  Created by 박근경 on 2024/05/20.
//

import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture

@Reducer
public struct SignInFeature {
    @ObservableState
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action {
        case moveMusicPageTapped
        case HomeButtonTapped
    }
    
    public init() {}
}
