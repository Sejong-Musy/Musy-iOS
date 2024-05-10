//
//  LoginDemoApp.swift
//  SharedDesignSystem
//
//  Created by 김도형 on 5/10/24.
//

import SwiftUI
import LoginFeature
import LoginInterface
import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture

@main
struct LoginDemoApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(store: .init(initialState: .init(), reducer: {
                LoginFeature()
            }))
        }
    }
}

#Preview {
    LoginView(store: .init(initialState: .init(), reducer: {
        LoginFeature()
    }))
}
