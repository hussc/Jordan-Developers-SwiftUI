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
    
    /**
     aka. data source
     */
    @LazyInjected var repository: JobRepository
    
    /**
     We store the data in the state object
     */
    @Published private(set) var state = ViewModelState.idle
    
    /**
     Cancel all operations upon deallocation
     */
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        performTheFuckingLoad()
    }
    
    /**
     Sorry for such words :)
     */
    func performTheFuckingLoad(){
        state = .loading
        
        repository.getJobs().map { jobs in
            jobs.map(JobCellItemViewModel.init)
        }.sink { (result) in
            if case .failure(let error) = result {
                self.state = .failed(error)
            }
        } receiveValue: { (jobs) in
            self.state = .loaded(jobs)
        }.store(in: &cancellables)
    }
}

