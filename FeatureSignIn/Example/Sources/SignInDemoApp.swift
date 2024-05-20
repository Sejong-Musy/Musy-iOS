//
//  SignInDemo.swift
//  CreateMusicInterface
//
//  Created by 박근경 on 2024/05/20.
//

import SwiftUI
import SignInFeature
import SignInInterface
import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture

@main
struct LoginDemoApp: App {
    var body: some Scene {
        WindowGroup {
            SignInView(store: .init(initialState: .init(), reducer: {
                SignInFeature()
            }))
        }
    }
}

#Preview {
    SignInView(store: .init(initialState: .init(), reducer: {
        SignInFeature()
    }))
}
