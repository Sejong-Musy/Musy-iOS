//
//  LoginFeature.swift
//  SharedDesignSystem
//
//  Created by 김도형 on 5/8/24.
//

import ComposableArchitecture

@Reducer
public struct LoginFeature {
    @ObservableState
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action {
        case loginButtonTapped
    }
    
    public init() {}
}
