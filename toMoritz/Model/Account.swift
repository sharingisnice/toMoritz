//
//  Account.swift
//  toMoritz
//
//  Created by Mert Ejder on 22.05.2022.
//

import Foundation

// MARK: - Account
struct Account: Codable {
    let accountName: String
    let headBlockNum: Int
    let headBlockTime, lastCodeUpdate, created: String
    let refundRequest: RefundRequest
    let ramQuota: String
    let netLimit, cpuLimit: Limit
    let totalResources: TotalResources
    let coreLiquidBalance: String
    let selfDelegatedBandwidth: SelfDelegatedBandwidth
    let netWeight, cpuWeight, ramUsage: String
    let privileged: Bool
    let permissions: [PermissionElement]
    let voterInfo: VoterInfo

    enum CodingKeys: String, CodingKey {
        case accountName = "account_name"
        case headBlockNum = "head_block_num"
        case headBlockTime = "head_block_time"
        case lastCodeUpdate = "last_code_update"
        case created
        case refundRequest = "refund_request"
        case ramQuota = "ram_quota"
        case netLimit = "net_limit"
        case cpuLimit = "cpu_limit"
        case totalResources = "total_resources"
        case coreLiquidBalance = "core_liquid_balance"
        case selfDelegatedBandwidth = "self_delegated_bandwidth"
        case netWeight = "net_weight"
        case cpuWeight = "cpu_weight"
        case ramUsage = "ram_usage"
        case privileged, permissions
        case voterInfo = "voter_info"
    }
}

// MARK: - Limit
struct Limit: Codable {
    let max, available, used: String
}

// MARK: - PermissionElement
struct PermissionElement: Codable {
    let parent, permName: String
    let requiredAuth: RequiredAuth

    enum CodingKeys: String, CodingKey {
        case parent
        case permName = "perm_name"
        case requiredAuth = "required_auth"
    }
}

// MARK: - RequiredAuth
struct RequiredAuth: Codable {
    let waits: [Wait]
    let keys: [Key]
    let threshold: Int
    let accounts: [AccountElement]
}

// MARK: - AccountElement
struct AccountElement: Codable {
    let weight: Int
    let permission: AccountPermission
}

// MARK: - AccountPermission
struct AccountPermission: Codable {
    let actor, permission: String
}

// MARK: - Key
struct Key: Codable {
    let key: String
    let weight: Int
}

// MARK: - Wait
struct Wait: Codable {
    let waitSEC, weight: Int

    enum CodingKeys: String, CodingKey {
        case waitSEC = "wait_sec"
        case weight
    }
}

// MARK: - RefundRequest
struct RefundRequest: Codable {
    let owner, requestTime, netAmount, cpuAmount: String

    enum CodingKeys: String, CodingKey {
        case owner
        case requestTime = "request_time"
        case netAmount = "net_amount"
        case cpuAmount = "cpu_amount"
    }
}

// MARK: - SelfDelegatedBandwidth
struct SelfDelegatedBandwidth: Codable {
    let from, to, netWeight, cpuWeight: String

    enum CodingKeys: String, CodingKey {
        case from, to
        case netWeight = "net_weight"
        case cpuWeight = "cpu_weight"
    }
}

// MARK: - TotalResources
struct TotalResources: Codable {
    let owner, ramBytes, netWeight, cpuWeight: String

    enum CodingKeys: String, CodingKey {
        case owner
        case ramBytes = "ram_bytes"
        case netWeight = "net_weight"
        case cpuWeight = "cpu_weight"
    }
}

// MARK: - VoterInfo
struct VoterInfo: Codable {
    let owner, proxy: String
    let producers: [String]
    let staked, lastVoteWeight, proxiedVoteWeight: String
    let isProxy, flags1, reserved2: Int
    let reserved3: String

    enum CodingKeys: String, CodingKey {
        case owner, proxy, producers, staked
        case lastVoteWeight = "last_vote_weight"
        case proxiedVoteWeight = "proxied_vote_weight"
        case isProxy = "is_proxy"
        case flags1, reserved2, reserved3
    }
}
