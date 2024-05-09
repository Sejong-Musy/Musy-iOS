//
//  LoginFeature.swift
//  LoginFeature
//
//  Created by 김도형 on 5/8/24.
//

import ComposableArchitecture
import LoginInterface

extension LoginFeature {
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .loginButtonTapped:
                return .none
            }
        }
    }
}
