//
//  File.swift
//  
//
//  Created by Shubham on 31/7/21.
//

import Foundation
import FetchNodeDetails
import TorusUtils
import TorusSwiftDirectSDK
import OSLog

public class MockFactory: TDSDKFactoryProtocol {
	
	public func createFetchNodeDetails(network: EthereumNetwork, sessionConfig: URLSessionConfiguration) -> FetchNodeDetails {
		let net = network == .MAINNET ? "0x638646503746d5456209e33a2ff5e3226d698bea" : "0x4023d2a0D330bF11426B12C6144Cfb96B7fa6183"
		return FetchNodeDetails(proxyAddress: net, network: network)
	}
	
	public func createTorusUtils(nodePubKeys: Array<TorusNodePub>, session: URLSession, loglevel: OSLogType) -> AbstractTorusUtils {
		MockTorusUtils()
	}
	
    init(){}
}
