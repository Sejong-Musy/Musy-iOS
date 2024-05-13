//
//  CreateMusicView.swift
//  CreateMusicFeature
//
//  Created by 김도형 on 5/12/24.
//

import SwiftUI
import CreateMusicInterface
import CreateMusicTesting
import Domain
import Shared
import SharedDesignSystem
import SharedThirdPartyLibrary
import ComposableArchitecture
import SwiftUIFlowLayout

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
            
            intstrument
            
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
            
            FlowLayout(mode: .vstack, items: Music.Genre.allCases, itemSpacing: 4) { genre in
                let isSelected = store.music.genre == genre
                
                tagButton(title: genre.rawValue, isSelected: isSelected) {
                    store.send(.genreTagButtonTapped(genre), animation: .smooth)
                }
                .padding(.bottom, 4)
            }
            .padding(-4)
            .padding(.bottom, -4)
        }
    }
    
    private var intstrument: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("악기")
                .font(.musy(weight: .medium, size: 16))
                .foregroundStyle(.white)
            
            FlowLayout(mode: .vstack, items: Music.Instrument.allCases, itemSpacing: 4) { intstrument in
                let isSelected = store.music.instruments.contains(intstrument)
                
                tagButton(title: intstrument.rawValue, isSelected: isSelected) {
                    store.send(.instrumentTagButtonTapped(intstrument), animation: .smooth)
                }
                .padding(.bottom, 4)
            }
            .padding(-4)
            .padding(.bottom, -4)
        }
    }
}

#Preview {
    CreateMusicView(store: .init(initialState: .init(), reducer: {
        CreateMusicFeature.preview
    }))
}
