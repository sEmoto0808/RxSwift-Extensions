//
//  Rx+AVAsset.swift
//  studygear
//
//  Created by Sho Emoto on 2019/03/01.
//  Copyright © 2019年 studygear - ios. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import AVFoundation

extension Reactive where Base: AVAsset {
    
    var isPlayable: Observable<Bool> {
        return Observable.create { [weak base] observer in
            base?.loadValuesAsynchronously(forKeys: [#keyPath(AVAsset.isPlayable)], completionHandler: {
                if let me = base {
                    observer.onNext(me.isPlayable)
                }
            })
            return Disposables.create()
        }
    }
}
