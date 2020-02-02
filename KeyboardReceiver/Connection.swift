//
//  ConnectionManager.swift
//  KeyboardSender
//
//  Created by KEISUKE MASUDA on 2020/02/02.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
import MultipeerConnectivity

enum ControllType {
    case mouse
    case keyboard
}

class Connection: NSObject {
    private let selfID = MCPeerID(displayName: "Receiver")
    private let session: MCSession
    private let advertiser: MCNearbyServiceAdvertiser
    override init() {
        session = MCSession(peer: selfID,
                            securityIdentity: nil,
                            encryptionPreference: .none)
       advertiser = MCNearbyServiceAdvertiser(peer: selfID,
                                              discoveryInfo: nil,
                                              serviceType: "isReceiver")
        super.init()
        session.delegate = self
        advertiser.delegate = self
        advertiser.startAdvertisingPeer()
    }
    
//
//    open func sendData(data: Data, type: ControllType) {
//        if !session.connectedPeers.isEmpty {
//            switch type {
//            case .keyboard:
//                try? self.session.send(data, toPeers: self.session.connectedPeers, with: .reliable)
//
//            case .mouse:
//                try? session.send(data, toPeers: session.connectedPeers, with: .unreliable)
//                break
//            default:
//                break
//            }
//        } else {
//            print("どこにも接続していません")
//        }
//    }
    
    
}

extension Connection: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            advertiser.stopAdvertisingPeer()
            break
        case .connecting:
            break
        case .notConnected:
            advertiser.startAdvertisingPeer()
            break
        default:
            break
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print(data.base64EncodedString())
        return
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
        return
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        return
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        return
    }
    
}
extension Connection: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true,session)
    }
    
    
    
}
