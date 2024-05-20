//
//  SignInView.swift
//  CreateMusicInterface
//
//  Created by 박근경 on 2024/05/20.
//

import SwiftUI
import SignInInterface
import Shared
import SharedThirdPartyLibrary
import SharedDesignSystem
import ComposableArchitecture
import AuthenticationServices

public struct SignInView: View, SignInViewInterface {
    let store: StoreOf<SignInFeature>
    
    public init(store: StoreOf<SignInFeature>) {
        self.store = store
    }
    
    public var body: some View {
        VStack {
            Spacer()
                .frame(height: 150)
            
            congrats
                .padding(.bottom, 5)
            
            title
                .padding(.bottom, 20)
            
            subtitle
                .padding(.bottom, 40)
            
            moveMusicPageButton
                .padding(.bottom, 12)
            
            nextTimeButton
            
            Spacer()
        }
        
        .background {
            LinearGradient.musyMedium
        }
        .ignoresSafeArea()
        
    }
    
    public var congrats: some View {
        VStack {
            Image("congrats")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 224, height: 90)
            Text("👏")
                .font(.musy(weight: .medium, size: 96))
                .offset(y: -25)
                
        }
    }
    
    public var title: some View {
        HStack{
            Spacer()
            VStack {
                Text("아무개님,")
                Text("가입이 완료됐습니다.")
            }
            .font(.musy(weight: .medium, size: 24))
            .foregroundColor(.white)
            Spacer()
        }
    }
    
    public var subtitle: some View {
        HStack{
            Spacer()
            VStack {
                Text("이제 MUSY와 함께")
                Text("자유로운 음악을 생성해볼까요?")
            }
            .font(.musy(weight: .light, size: 18))
            .foregroundColor(.white)
            Spacer()
        }
    }
    
    public var moveMusicPageButton: some View {
        Button(action: {
            store.send(.moveMusicPageTapped)
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 158)
                    .fill(Color.white)
                    .frame(height: 52)
                    .padding(.horizontal, 70)
                
                Text("음악 생성하기")
                    .font(.musy(weight: .medium, size: 20))
                    .foregroundStyle(.black)
            }
        })
    }
    
    public var nextTimeButton: some View {
        Button(action: {
            store.send(.HomeButtonTapped)
        }, label: {
            Text("나중에 할게요")
                .underline(true, color: Color.white.opacity(0.5))
                .font(.musy(weight: .light, size: 14))
                .foregroundStyle(Color.white)
        })
    }
}

#Preview {
    SignInView(store: .init(initialState: .init(), reducer: {
        SignInFeature()
    }))
}
