//
//  Rx+AVPlayerItem.swift
//  studygear
//
//  Created by Sho Emoto on 2019/03/01.
//  Copyright © 2019年 studygear - ios. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import AVFoundation

extension Reactive where Base: AVPlayerItem {
    
    // AVPlayerItemのステータスを監視する(unknown, readyToPlay, failed)
    var status: Observable<AVPlayerItem.Status> {
        return observe(AVPlayerItem.Status.self, #keyPath(AVPlayerItem.status)).map { $0 ?? .unknown }
    }
    
    // 再生に失敗したことを監視する
    var failedToPlay: Observable<Void> {
        return NotificationCenter.default.rx.notification(.AVPlayerItemFailedToPlayToEndTime,
                                                          object: base)
            .map { _ in () }
    }
    
    // 最後まで再生されたことを監視する
    var endToPlay: Observable<Void> {
        return NotificationCenter.default.rx.notification(.AVPlayerItemDidPlayToEndTime,
                                                          object: base)
            .map { _ in () }
    }
}
