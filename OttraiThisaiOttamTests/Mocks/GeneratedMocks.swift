// MARK: - Mocks generated from file: OttraiThisaiOttamTests/Budapest/SpyableBudapestView.swift at 2017-12-11 09:00:15 +0000

//
//  SpyableBudapestView.swift
//  OttraiThisaiOttamTests
//
//  Created by Rugmangathan on 11/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import Cuckoo
@testable import OttraiThisaiOttam

import Foundation
import OttraiThisaiOttam

class MockSpyableBudapestView: SpyableBudapestView, Cuckoo.Mock {
    typealias MocksType = SpyableBudapestView
    typealias Stubbing = __StubbingProxy_SpyableBudapestView
    typealias Verification = __VerificationProxy_SpyableBudapestView
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: SpyableBudapestView?

    func spy(on victim: SpyableBudapestView) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_SpyableBudapestView: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_SpyableBudapestView: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class SpyableBudapestViewStub: SpyableBudapestView {
    

    

    
}



