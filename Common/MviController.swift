//
//  MviController.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 07/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift
import RxCocoa

protocol MviState: Equatable { }

class MviController<T: MviState>: UIViewController {
  public var disposables: CompositeDisposable!

  private lazy var stateRelay: BehaviorRelay<T?> = {
    return BehaviorRelay<T?>(value: nil)
  }()

  private var lifecycleEvent: MviLifecycle!
  public lazy var lifecycle: PublishRelay<MviLifecycle> = {
    return PublishRelay<MviLifecycle>()
  }()

  func setup() { }
  func preBind() { }
  func bind(states: Observable<T>) -> Observable<T> {
    fatalError("Bind method should be overridden")
  }
  func postBind() { }
  func unbind() { }
  func effects(state: T) { }

  override final func viewDidLoad() {
    super.viewDidLoad()
    setup()
    lifecycleEvent = MviLifecycle.created
  }

  override final func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    disposables = CompositeDisposable()
    preBind()
    let statesObservable = stateRelay
      .filter { $0 != nil }
      .map { $0! }
      .distinctUntilChanged { $0 == $1 }
      .asObservable()

    _ = disposables.insert(bind(states: statesObservable)
      .observeOn(MainScheduler.instance)
      .subscribe { event in
        self.stateRelay.accept(event.element)
        self.effects(state: event.element!)
    })

    postBind()

    // Lifecycle event
    lifecycle.accept(lifecycleEvent)
  }

  override final func viewWillDisappear(_ animated: Bool) {
    lifecycle.accept(MviLifecycle.stopped)
    unbind()
    disposables.dispose()
    super.viewWillDisappear(animated)
  }

  override final func viewDidDisappear(_ animated: Bool) {
    lifecycleEvent = MviLifecycle.restored
    super.viewDidDisappear(animated)
  }
}
