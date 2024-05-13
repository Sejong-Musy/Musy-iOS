//
//  TagView.swift
//  CreateMusicFeature
//
//  Created by 김도형 on 5/12/24.
//

import SwiftUI
import SharedDesignSystem

struct TagView: View {
    private let title: String
    private let size: CGFloat
    private let isButton: Bool
    private let isHighlighted: Bool
    
    init(title: String,
         size: CGFloat,
         isButton: Bool = false,
         isHighlighted: Bool) {
        self.title = title
        self.size = size
        self.isButton = isButton
        self.isHighlighted = isHighlighted
    }
    
    var body: some View {
        let redGradient = LinearGradient(
            gradient: Gradient(
                colors: [
                    .musyRed,
                    .white
                ]),
            startPoint: isButton ? .leading : .trailing,
            endPoint: isButton ? .trailing : .leading)
        
        let grayGradient = LinearGradient(
            gradient: Gradient(
                colors: [
                    .white,
                    Color(red: 0.63, green: 0.63, blue: 0.63)
                ]),
            startPoint: .bottomLeading,
            endPoint: .topTrailing)
        
        let gradient = isHighlighted ? redGradient : grayGradient
        
        Text(title)
            .font(.musy(weight: .medium, size: size))
            .foregroundStyle(isHighlighted && isButton ? .musyRed : .white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background {
                RoundedRectangle(cornerRadius: 87, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(.white.opacity(0.58))
                    .overlay {
                        RoundedRectangle(cornerRadius: 87, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .stroke(lineWidth: 1.0)
                            .fill(gradient)
                    }
            }
    }
}

#Preview {
    ZStack {
        LinearGradient.musyBright
        
        TagView(title: "Blues", size: 20, isHighlighted: true)
    }
    .ignoresSafeArea()
}
