//
//  JobListViewModel.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/16/20.
//

import Foundation
import Combine
import Resolver

class JobListViewModel: ObservableObject {
    
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([JobCellItemViewModel])
    }
    
    @LazyInjected var repository: JobRepository
    
    @Published private(set) var jobCellViewModels = [JobCellItemViewModel]()
    @Published private(set) var state = State.idle
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        performTheFuckingLoad()
    }
    
    func performTheFuckingLoad(){
        state = .loading
        
        repository.getJobs { (result) in
            switch result {
            case .success(let jobs):
                self.jobCellViewModels = jobs.map(JobCellItemViewModel.init)
                self.state = .loaded(self.jobCellViewModels)
                return
            case .failure(let error):
                self.state = .failed(error)
                break
            }
        }
    }
}
