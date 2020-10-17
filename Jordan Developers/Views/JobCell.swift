//
//  JobCell.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/15/20.
//

import SwiftUI
import struct Kingfisher.KFImage

struct JobCell: View {
    
    @ObservedObject var jobCellVM: JobCellItemViewModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.white
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0.0, y: 0.0)
            HStack(spacing: 15) {
                
                KFImage(jobCellVM.job.company.logo_url)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .scaledToFit()
                    .clipped()
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(jobCellVM.job.title)
                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                        .foregroundColor(.black)
                    Text(jobCellVM.job.company.name)
                        .font(.system(size: 12, weight: .light, design: .monospaced))
                        .foregroundColor(.secondary)
                    TagsView(tags: jobCellVM.job.tags)
                }
            }
            .padding()
        }
        .padding()
    }
}

struct JobCell_Previews: PreviewProvider {
    static var previews: some View {
        JobCell(jobCellVM: .init(job: .sample()))
    }
}
