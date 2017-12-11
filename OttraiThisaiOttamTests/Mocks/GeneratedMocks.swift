// MARK: - Mocks generated from file: OttraiThisaiOttamTests/Budapest/SpyableBudapestView.swift at 2017-12-11 09:16:15 +0000

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

    

    

    
     override func greetStranger()  {
        
            return cuckoo_manager.call("greetStranger()",
                parameters: (),
                original: observed.map { o in
                    return { (args) in
                        let () = args
                         o.greetStranger()
                    }
                })
        
    }
    

    struct __StubbingProxy_SpyableBudapestView: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func greetStranger() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("greetStranger()", parameterMatchers: matchers))
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

        

        
        @discardableResult
        func greetStranger() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("greetStranger()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class SpyableBudapestViewStub: SpyableBudapestView {
    

    

    
     override func greetStranger()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



