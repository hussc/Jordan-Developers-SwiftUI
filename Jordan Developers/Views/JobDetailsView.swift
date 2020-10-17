//
//  JobDetailsView.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/15/20.
//

import SwiftUI
import struct Kingfisher.KFImage

struct JobDetailsView: View {
     
    @ObservedObject var detailsViewModel: JobDetailsViewModel
    
    var onBack: (() -> Void)
    
    init(detailsViewModel: JobDetailsViewModel, onBack: @escaping (() -> Void)){
        self.detailsViewModel = detailsViewModel
        self.onBack = onBack
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    VStack(alignment: .leading, spacing: 25) {
                        Button(action: {
                            self.onBack()
                        }){
                            Label("Recent Jobs", systemImage: "arrow.backward")
                                .font(.system(size: 14, weight: .bold, design: .monospaced))
                                .accentColor(.black)
                        }
                        
                        KFImage(detailsViewModel.job.company.logo_url)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .clipped()
                        VStack(alignment: .leading, spacing: 5) {
                            Text(detailsViewModel.job.title)
                                .font(.system(size: 24, weight: .heavy, design: .monospaced))
                            Text(detailsViewModel.job.company.name)
                                .font(.system(size: 24, weight: .light, design: .monospaced))
                                .foregroundColor(.secondary)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Job Description")
                                .font(.system(size: 16, weight: .heavy, design: .monospaced))
                            Text(detailsViewModel.description)
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .lineLimit(nil)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 0)
            }
            .padding(.top, 25)
            .padding(.bottom, 0)
            .layoutPriority(1)
            Spacer()
            
            ApplyJobView(isFavorited: $detailsViewModel.job.isFavorited){
                guard let applyDetails = self.detailsViewModel.link else {
                    return
                }
                
                // apply to this job
                switch applyDetails.type {
                case .email:
                    if let mailURL = URL(string: "mailto:\(applyDetails.url)"){
                        UIApplication.shared.open(mailURL)
                    }
                    break
                case .redirect:
                    if let url = URL(string: applyDetails.url) {
                        UIApplication.shared.open(url)
                    }
                    break
                }
            }
        }
    }
}

struct JobDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        JobDetailsView(detailsViewModel: .init(job: .sample())){}
    }
}
