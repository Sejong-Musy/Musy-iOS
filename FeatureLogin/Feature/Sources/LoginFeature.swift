//
//  LoginFeature.swift
//  LoginFeature
//
//  Created by 김도형 on 5/8/24.
//

import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture
import LoginInterface

extension LoginFeature {
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .loginButtonTapped:
                return .none
            }
        }
    }
}
