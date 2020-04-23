// MARK: - Mocks generated from file: MVIExampleTests/Budapest/SpyableBudapestView.swift at 2020-04-23 09:42:44 +0000

//
//  SpyableBudapestView.swift
//  MVIExampleTests
//
//  Created by Rugmangathan on 11/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import Cuckoo
@testable import MVIExample

import Foundation
import MVIExample


 class MockSpyableBudapestView: SpyableBudapestView, Cuckoo.ClassMock {
    
     typealias MocksType = SpyableBudapestView
    
     typealias Stubbing = __StubbingProxy_SpyableBudapestView
     typealias Verification = __VerificationProxy_SpyableBudapestView

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: SpyableBudapestView?

     func enableDefaultImplementation(_ stub: SpyableBudapestView) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func greetStranger()  {
        
    return cuckoo_manager.call("greetStranger()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.greetStranger()
                ,
            defaultCall: __defaultImplStub!.greetStranger())
        
    }
    
    
    
     override func greet(_ message: String)  {
        
    return cuckoo_manager.call("greet(_: String)",
            parameters: (message),
            escapingParameters: (message),
            superclassCall:
                
                super.greet(message)
                ,
            defaultCall: __defaultImplStub!.greet(message))
        
    }
    

	 struct __StubbingProxy_SpyableBudapestView: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func greetStranger() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockSpyableBudapestView.self, method: "greetStranger()", parameterMatchers: matchers))
	    }
	    
	    func greet<M1: Cuckoo.Matchable>(_ message: M1) -> Cuckoo.ClassStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpyableBudapestView.self, method: "greet(_: String)", parameterMatchers: matchers))
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
	    func greetStranger() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("greetStranger()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func greet<M1: Cuckoo.Matchable>(_ message: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
	        return cuckoo_manager.verify("greet(_: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SpyableBudapestViewStub: SpyableBudapestView {
    

    

    
     override func greetStranger()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func greet(_ message: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: MVIExampleTests/Counter/SpyableCounterView.swift at 2020-04-23 09:42:44 +0000

//
//  SpyableCounterView.swift
//  MVIExampleTests
//
//  Created by Rugmangathan on 13/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import Cuckoo
@testable import MVIExample

import Foundation
import MVIExample


 class MockSpyableCounterView: SpyableCounterView, Cuckoo.ClassMock {
    
     typealias MocksType = SpyableCounterView
    
     typealias Stubbing = __StubbingProxy_SpyableCounterView
     typealias Verification = __VerificationProxy_SpyableCounterView

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: SpyableCounterView?

     func enableDefaultImplementation(_ stub: SpyableCounterView) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func showCounterValues(_ count: Int64, _ clicks: Int64)  {
        
    return cuckoo_manager.call("showCounterValues(_: Int64, _: Int64)",
            parameters: (count, clicks),
            escapingParameters: (count, clicks),
            superclassCall:
                
                super.showCounterValues(count, clicks)
                ,
            defaultCall: __defaultImplStub!.showCounterValues(count, clicks))
        
    }
    

	 struct __StubbingProxy_SpyableCounterView: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func showCounterValues<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ count: M1, _ clicks: M2) -> Cuckoo.ClassStubNoReturnFunction<(Int64, Int64)> where M1.MatchedType == Int64, M2.MatchedType == Int64 {
	        let matchers: [Cuckoo.ParameterMatcher<(Int64, Int64)>] = [wrap(matchable: count) { $0.0 }, wrap(matchable: clicks) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpyableCounterView.self, method: "showCounterValues(_: Int64, _: Int64)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_SpyableCounterView: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func showCounterValues<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ count: M1, _ clicks: M2) -> Cuckoo.__DoNotUse<(Int64, Int64), Void> where M1.MatchedType == Int64, M2.MatchedType == Int64 {
	        let matchers: [Cuckoo.ParameterMatcher<(Int64, Int64)>] = [wrap(matchable: count) { $0.0 }, wrap(matchable: clicks) { $0.1 }]
	        return cuckoo_manager.verify("showCounterValues(_: Int64, _: Int64)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SpyableCounterViewStub: SpyableCounterView {
    

    

    
     override func showCounterValues(_ count: Int64, _ clicks: Int64)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

