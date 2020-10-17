//
//  JobCellItemViewModel.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/16/20.
//

import Foundation
import Combine
import Resolver

class JobCellItemViewModel: Identifiable, ObservableObject {
    
    @LazyInjected var repository: JobRepository
    
    @Published var job: Job
    @Published var isFavorited: Bool = false
    
    var id: Int = -1
    private var cancellables = Set<AnyCancellable>()
    
    init(job: Job){
        self.job = job
        
        $job.map { $0.isFavorited }
            .assign(to: \.isFavorited, on: self)
            .store(in: &cancellables)
        
        $job.compactMap { $0.id }
          .assign(to: \.id, on: self)
          .store(in: &cancellables)
    }
}
