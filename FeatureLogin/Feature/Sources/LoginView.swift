//
//  LoginView.swift
//  LoginFeature
//
//  Created by 김도형 on 5/8/24.
//

import SwiftUI
import LoginInterface
import Shared
import SharedThirdPartyLibrary
import SharedDesignSystem
import ComposableArchitecture
import AuthenticationServices

public struct LoginView: View, LoginViewInterface {
    let store: StoreOf<LoginFeature>
    
    public init(store: StoreOf<LoginFeature>) {
        self.store = store
    }
    
    public var body: some View {
        VStack {
            Spacer()
            
            title
            
            Spacer()
            
            loginButton
                .padding(.bottom, 104)
        }
        .padding(.horizontal, 32)
        .background {
            LinearGradient.musyDark
                .ignoresSafeArea()
        }
    }
    
    public var title: some View {
        HStack {
            Spacer()
            
            VStack(spacing: 16) {
                Text("안녕하세요:)")
                    .font(.musy(weight: .medium, size: 20))
                
                Text("MUSY")
                    .font(.musy(weight: .light, size: 20)) +
                
                Text(" 입니다.")
                    .font(.musy(weight: .medium, size: 20))
            }
            .foregroundStyle(.white)
            
            Spacer()
        }
    }
    
    public var loginButton: some View {
        SignInWithAppleButton(.continue) { request in
            store.send(.loginButtonTapped)
        } onCompletion: { completion in
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .frame(height: 60)
    }
}

#Preview {
    LoginView(store: .init(initialState: .init(), reducer: {
        LoginFeature()
    }))
}
