fn stake_nft(owner: Address, nft_id: Int) -> Bool {
    let staked_nft = StakedNFT { owner, nft_id, staked_at: current_timestamp() }
    stake_storage.save(staked_nft)
}

fn calculate_rewards(staked_nft: StakedNFT) -> Int {
    let duration = current_timestamp() - staked_nft.staked_at
    duration * REWARD_RATE_PER_SECOND
}

fn claim_rewards(owner: Address, nft_id: Int) -> Int {
    let staked_nft = stake_storage.get(owner, nft_id)
    let reward = calculate_rewards(staked_nft)
    distribute_funds(owner, reward)
}
