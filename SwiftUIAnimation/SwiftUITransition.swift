//
//  SwiftUITransition.swift
//  SwiftUIAnimation
//
//  Created by Hidayat Abisena on 09/12/22.
//

import SwiftUI

struct SwiftUITransition: View {
    // MARK: - PROPERTIES
    @State private var isShowing: Bool = false
    
    // MARK: - BODY
    var body: some View {
        VStack {
            if isShowing {
                Image("yoasobi-detail")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .cornerRadius(10)
//                    .transition(.scale(scale: 0, anchor: .center))
                    .transition(.offsetScaleOpacity)
            } else {
                Image("yoasobi-view")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .cornerRadius(10)
//                    .transition(.scale(scale: 0, anchor: .bottomTrailing))
//                    .transition(.offset(x: -500, y: 0))
                    .transition(.scaleAndOffset)
            }
            
        } //: VSTACK
        .onTapGesture {
            withAnimation(Animation.spring()) {
                isShowing.toggle()
            }
        }
    }
}

// MARK: - PREVIEW
struct SwiftUITransition_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITransition()
    }
}

// MARK: - EXTENSION
extension AnyTransition {
     static var offsetScaleOpacity: AnyTransition {
        AnyTransition.offset(x: -500, y: 0).combined(with: .scale).combined(with: .opacity)
    }
    
    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .center), removal: .offset(x: -500, y: 0).combined(with: .scale).combined(with: .opacity))
    }
}
