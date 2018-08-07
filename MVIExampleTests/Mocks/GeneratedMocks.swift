// MARK: - Mocks generated from file: MVIExampleTests/Budapest/SpyableBudapestView.swift at 2018-08-07 16:52:40 +0000

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
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "greetStranger", "returnSignature": "", "fullyQualifiedName": "greetStranger()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func greetStranger()  {
        
            return cuckoo_manager.call("greetStranger()",
                parameters: (),
                superclassCall:
                    
                    super.greetStranger()
                    )
        
    }
    
    // ["name": "greet", "returnSignature": "", "fullyQualifiedName": "greet(_: String)", "parameterSignature": "_ message: String", "parameterSignatureWithoutNames": "message: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "message", "call": "message", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "message", type: "String", range: CountableRange(286..<303), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func greet(_ message: String)  {
        
            return cuckoo_manager.call("greet(_: String)",
                parameters: (message),
                superclassCall:
                    
                    super.greet(message)
                    )
        
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
	    func greetStranger() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("greetStranger()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func greet<M1: Cuckoo.Matchable>(_ message: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
	        return cuckoo_manager.verify("greet(_: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class SpyableBudapestViewStub: SpyableBudapestView {
    

    

    
     override func greetStranger()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func greet(_ message: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: MVIExampleTests/Counter/SpyableCounterView.swift at 2018-08-07 16:52:40 +0000

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
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "showCounterValues", "returnSignature": "", "fullyQualifiedName": "showCounterValues(_: Int64, _: Int64)", "parameterSignature": "_ count: Int64, _ clicks: Int64", "parameterSignatureWithoutNames": "count: Int64, clicks: Int64", "inputTypes": "Int64, Int64", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "count, clicks", "call": "count, clicks", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "count", type: "Int64", range: CountableRange(269..<283), nameRange: CountableRange(0..<0)), CuckooGeneratorFramework.MethodParameter(label: nil, name: "clicks", type: "Int64", range: CountableRange(285..<300), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func showCounterValues(_ count: Int64, _ clicks: Int64)  {
        
            return cuckoo_manager.call("showCounterValues(_: Int64, _: Int64)",
                parameters: (count, clicks),
                superclassCall:
                    
                    super.showCounterValues(count, clicks)
                    )
        
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
	    func showCounterValues<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ count: M1, _ clicks: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Int64, M2.MatchedType == Int64 {
	        let matchers: [Cuckoo.ParameterMatcher<(Int64, Int64)>] = [wrap(matchable: count) { $0.0 }, wrap(matchable: clicks) { $0.1 }]
	        return cuckoo_manager.verify("showCounterValues(_: Int64, _: Int64)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class SpyableCounterViewStub: SpyableCounterView {
    

    

    
     override func showCounterValues(_ count: Int64, _ clicks: Int64)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

