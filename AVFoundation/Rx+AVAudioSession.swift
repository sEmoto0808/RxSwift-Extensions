//
//  Rx+AVAudioSession.swift
//  studygear
//
//  Created by Sho Emoto on 2019/03/13.
//  Copyright © 2019年 studygear - ios. All rights reserved.
//

import Foundation
import RxSwift
import AVFoundation

extension Reactive {
    
    // イヤホン(Bluetooth含む)の抜き差しをチェック
    var isConnectedHeadPhone: Observable<Bool> {
        AVAudioSession.sharedInstance()
        return NotificationCenter.default.rx.notification(.AVAudioSessionRouteChange,
                                                          object: nil)
            .map { didChage in
                
                guard let desc = didChage.userInfo?[AVAudioSessionRouteChangePreviousRouteKey] as? AVAudioSessionRouteDescription
                    else { return false }
                let outputs = desc.outputs
                for component in outputs {
                    if component.portType == AVAudioSessionPortHeadphones ||
                        component.portType == AVAudioSessionPortBluetoothA2DP ||
                        component.portType == AVAudioSessionPortBluetoothLE ||
                        component.portType == AVAudioSessionPortBluetoothHFP {
                        // イヤホン(Bluetooth含む)が抜かれた
                        return false
                    }
                }
                // イヤホン(Bluetooth含む)が差された
                return true
        }
    }
}
