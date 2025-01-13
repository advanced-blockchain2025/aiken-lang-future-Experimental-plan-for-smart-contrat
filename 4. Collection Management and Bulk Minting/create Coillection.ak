fn create_collection(owner: Address, collection_name: String) -> Collection {
    Collection {
        id: generate_id(),
        owner,
        name: collection_name,
        items: []
    }
}

fn mint_batch(collection: Collection, nfts: List<NFT>) -> Collection {
    nfts
    |> List.map(\nft -> mint_nft(nft))
    |> List.foldl(\nft, col -> col.items.append(nft), collection)
}
