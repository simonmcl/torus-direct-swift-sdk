//
//  File.swift
//  
//
//  Created by Shubham on 30/7/21.
//

import Foundation
import TorusUtils
import FetchNodeDetails
import OSLog


/// A protocol should be implmented by users of `TorusSwiftDirectSDK`. It provides a way
/// to stub or mock the TorusDirectSwiftSDk for testing.
public protocol TDSDKFactoryProtocol {
	func createFetchNodeDetails(network: EthereumNetwork, sessionConfig: URLSessionConfiguration) -> FetchNodeDetails
    func createTorusUtils(nodePubKeys: Array<TorusNodePub>, session: URLSession, loglevel: OSLogType) -> AbstractTorusUtils
}


public class TDSDKFactory: TDSDKFactoryProtocol {
	public func createFetchNodeDetails(network: EthereumNetwork, sessionConfig: URLSessionConfiguration) -> FetchNodeDetails {
        let net = network == .MAINNET ? "0x638646503746d5456209e33a2ff5e3226d698bea" : "0x4023d2a0D330bF11426B12C6144Cfb96B7fa6183"
        return FetchNodeDetails(proxyAddress: net, network: network, sessionConfig: sessionConfig)
    }
    
	public func createTorusUtils(nodePubKeys: Array<TorusNodePub> = [], session: URLSession, loglevel: OSLogType) -> AbstractTorusUtils {
        return TorusUtils(nodePubKeys: nodePubKeys, session: session, loglevel: loglevel)
    }
    
    public init() {
        
    }
}
