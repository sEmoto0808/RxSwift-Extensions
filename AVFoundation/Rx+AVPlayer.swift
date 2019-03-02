//
//  Rx+AVPlayer.swift
//  studygear
//
//  Created by Sho Emoto on 2019/03/01.
//  Copyright © 2019年 studygear - ios. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import AVFoundation

extension Reactive where Base: AVPlayer {
    
    // AVPlayerの状態を監視する(paused, playing, waitingToPlayAtSpecifiedRate)
    var timeControlStatus: Observable<AVPlayer.TimeControlStatus> {
        return base.rx.observe(AVPlayer.TimeControlStatus.self,
                               #keyPath(AVPlayer.timeControlStatus)).map { $0 ?? .paused }
    }
}
