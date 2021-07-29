import Foundation
import BestLogger
import PromiseKit
import FetchNodeDetails
import TorusSwiftDirectSDK

class MockTorusUtils: AbstractTorusUtils {
    var label: String?
    var loglevel: BestLogger.Level?
    var nodePubKeys: Array<TorusNodePub>?
    
    init() {
    }
    
    func initialize(label: String, loglevel: BestLogger.Level) {
        self.label = label
        self.loglevel = loglevel
    }
    
    func initialize(label: String, loglevel: BestLogger.Level, nodePubKeys: Array<TorusNodePub>) {
        self.label = label
        self.loglevel = loglevel
        self.nodePubKeys = nodePubKeys
    }
    
    var retrieveShares_input: [String:Any] = [:];
    var retrieveShares_output = [
        "privateKey": "<private key>",
        "publicAddress": "<public address>"
    ]
    func retrieveShares(endpoints: Array<String>, verifierIdentifier: String, verifierId: String, idToken: String, extraParams: Data) -> Promise<[String : String]> {
        self.retrieveShares_input = [
            "endpoints": endpoints,
            "verifierIdentifier": verifierIdentifier,
            "verifierId": verifierId,
            "idToken": idToken,
            "extraParams": extraParams
        ]
        return Promise { seal in
            seal.fulfill(retrieveShares_output)
        }
    }
}