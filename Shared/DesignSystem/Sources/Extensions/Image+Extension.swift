//
//  Image+Extension.swift
//  SharedDesignSystem
//
//  Created by 김도형 on 5/20/24.
//

import SwiftUI

public extension Image {
    //쓰고 싶은 이미지는 리소스안에 에셋에 추가 하고, 프로젝트 재시작 후, 아래 코드처럼 static 클로저로 등록한 후 사용
    static var congrats: Image {
        //새로운 이미지를 추가 후 프로젝트를 재시작하면 아래처럼 Tuist가 이미지를 찾아 코드로 제공해줌
        return SharedDesignSystemAsset.congrats.swiftUIImage
    }
}
