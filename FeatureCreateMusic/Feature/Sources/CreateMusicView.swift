//
//  CreateMusicView.swift
//  CreateMusicFeature
//
//  Created by 김도형 on 5/12/24.
//

import SwiftUI
import CreateMusicInterface
import Domain
import Shared
import SharedDesignSystem
import SharedThirdPartyLibrary
import ComposableArchitecture

public struct CreateMusicView: View, CreateMusciViewInterface {
    private let store: StoreOf<CreateMusicFeature>
    
    public init(store: StoreOf<CreateMusicFeature>) {
        self.store = store
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 36) {
            title
                .padding(.top, 120)
            
            genre
            
            Spacer()
        }
        .padding(.horizontal, 32)
        .background {
            LinearGradient.musyBright
        }
        .ignoresSafeArea()
    }
    
    private var title: some View {
        HStack {
            VStack (alignment: .leading, spacing: 10) {
                Text("태그 선정하기")
                    .font(.musy(weight: .medium, size: 24))
                    .foregroundStyle(.white)
                
                Group {
                    Text("태그만 선정해주시면 MUSY가 제작해드려요\n하고 싶은 장르와 악기를 최소")
                        .font(.musy(weight: .light, size: 14)) +
                    Text(" 한 개 ")
                        .font(.musy(weight: .medium, size: 14)) +
                    Text("선정해주세요")
                        .font(.musy(weight: .light, size: 14))
                }
                .lineSpacing(8)
                .foregroundStyle(.white)
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private func tagButton(
        title: String,
        isSelected: Bool,
        action: @escaping () -> Void) -> some View {
            Button(action: action) {
                TagView(
                    title: title,
                    size: 13,
                    isButton: true,
                    isHighlighted: isSelected)
            }
        }
    
    private var genre: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("장르")
                .font(.musy(weight: .medium, size: 16))
                .foregroundStyle(.white)
            
            LazyVGrid(columns: [
                .init(.flexible(minimum: 20, maximum: 100)),
                .init(.flexible(minimum: 20, maximum: 100)),
                .init(.flexible(minimum: 20, maximum: 100))
            ],
            alignment: .leading,
            spacing: 10) {
                ForEach(Music.Genre.allCases, id: \.rawValue) { genre in
                    let isSelected = store.music.genre == genre
                    
                    tagButton(title: genre.rawValue, isSelected: isSelected) {
                        store.send(.tagButtonTapped(genre), animation: .smooth)
                    }
                    .fixedSize(horizontal: true, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

#Preview {
    CreateMusicView(store: .init(initialState: .init(), reducer: {
        CreateMusicFeature()
    }))
}
