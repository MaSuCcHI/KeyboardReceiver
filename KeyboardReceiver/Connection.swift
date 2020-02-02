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
                            encryptionPreference: .optional)
       advertiser = MCNearbyServiceAdvertiser(peer: selfID,
                                              discoveryInfo: nil,
                                              serviceType: "isReceiver")
        super.init()
        session.delegate = self
        advertiser.delegate = self
        advertiser.startAdvertisingPeer()
    }
    
}

extension Connection: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            advertiser.stopAdvertisingPeer()
            print(session.connectedPeers.count)
            break
        case .connecting:
            print(session.connectedPeers.count)
            break
        case .notConnected:
            print(session.connectedPeers.count)
            advertiser.startAdvertisingPeer()
            break
        default:
            break
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print(String(data: data, encoding: .utf8))
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
    func session(_ session: MCSession, didReceiveCertificate certificate: [Any]?, fromPeer peerID: MCPeerID, certificateHandler: @escaping (Bool) -> Void) {
         certificateHandler(true)
    }
    
}
extension Connection: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        print("InvitationFrom: \(peerID)")
        invitationHandler(true,session)
    }
    
    
    
}
