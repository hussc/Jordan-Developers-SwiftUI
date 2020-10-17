//
//  TagsView.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/15/20.
//

import SwiftUI



struct TagsView: View {
    
    let tags: [String]
    
    var body: some View {
        HStack {
            ForEach(tags, id: \.self){
                TagItemView(tag: $0)
            }
        }
        .padding(.top, 5)
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(tags: ["Ruby", "Swift", "Backend", "Developer"])
    }
}


struct TagItemView: View {
    
    let tag: String
    
    var body: some View {
        Text(tag)
            .font(.system(size: 10, weight: .bold, design: .monospaced))
            .padding(.vertical, 3)
            .padding(.horizontal, 10)
            .background(Color(white: 0.96))
    }
}
