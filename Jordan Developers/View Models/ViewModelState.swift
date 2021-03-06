//
//  ViewModelState.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/18/20.
//

import Foundation

enum ViewModelState {
    case idle
    case loading
    case failed(Error)
    case loaded([JobCellItemViewModel])
    
    var isLoading: Bool {
        if case .idle = self {
            return true
        }
        
        if case .loading = self {
            return true
        }
        
        return false
    }
}
