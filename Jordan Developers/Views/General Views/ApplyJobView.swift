//
//  ApplyJobView.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/15/20.
//

import SwiftUI

struct ApplyJobView: View {
    
    @Binding var isFavorited: Bool
    
    var completion: (() -> Void)
    
    var body: some View {
        ZStack {
            Color.white
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: -2)
            HStack {
                Spacer()
                HStack {
                    Image(systemName: isFavorited ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 25, height: 25).onTapGesture {
                            self.isFavorited.toggle()
                        }.hidden()
                        
                    Button(action: completion){
                        Text("APPLY")
                            .font(.system(size: 17, weight: .bold, design: .monospaced))
                            .padding(.horizontal, 35)
                            .padding(.vertical, 10)
                            .foregroundColor(.white)
                            .background(Color.black)
                    }
                    .padding()
                }
            }
        }
        .padding(.vertical, 0)
    }
}

struct ApplyJobView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyJobView(isFavorited: .constant(true), completion: { })
    }
}
