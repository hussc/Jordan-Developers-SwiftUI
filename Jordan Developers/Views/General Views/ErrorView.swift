//
//  ErrorView.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/17/20.
//

import SwiftUI


struct ErrorView: View {
    
    let error: Error
    let errorTitle = "Oops!"
    let retryAction: (() -> Void)?
    
    init(error: Error, retryAction: (() -> Void)?){
        self.error = error
        self.retryAction = retryAction
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            Image(systemName: "bolt.horizontal.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
                .background(Color(white: 0.96))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .center, spacing: 5) {
                Text(errorTitle)
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .multilineTextAlignment(.center)
                Text(error.localizedDescription)
                    .font(.system(size: 12, weight: .regular, design: .monospaced))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 35)
            }
            
            if let retryAction = self.retryAction {
                Button(action: retryAction){
                    Text("RETRY")
                        .font(.system(size: 15, weight: .bold, design: .monospaced))
                        .padding(.horizontal, 25)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .background(Color.black)
                }
                .padding()
            }
        }
    }
}



struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: URLError(.appTransportSecurityRequiresSecureConnection), retryAction: nil)
    }
}
