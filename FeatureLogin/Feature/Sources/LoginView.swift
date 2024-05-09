//
//  LoginView.swift
//  LoginFeature
//
//  Created by 김도형 on 5/8/24.
//

import SwiftUI
import ComposableArchitecture
import LoginInterface

public struct LoginView: View, LoginViewInterface {
    let store: StoreOf<LoginFeature>
    
    public init(store: StoreOf<LoginFeature>) {
        self.store = store
    }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LoginView(store: .init(initialState: .init(), reducer: {
        LoginFeature()
    }))
}
