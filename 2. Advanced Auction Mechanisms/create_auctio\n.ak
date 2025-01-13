fn create_auction(item_id: Int, start_price: Int, auction_type: AuctionType) -> Auction {
    Auction {
        id: generate_id(),
        item_id,
        start_price,
        auction_type,
        bids: []
    }
}

fn place_bid(auction: Auction, bidder: Address, bid_amount: Int) -> Auction {
    if bid_amount > auction.start_price {
        auction.bids.append({ bidder, bid_amount })
    } else {
        error("Bid is below start price")
    }
}

fn finalize_auction(auction: Auction) -> AuctionResult {
    let highest_bid = auction.bids |> List.max_by(\b -> b.amount)
    transfer_ownership(auction.item_id, highest_bid.bidder)
    AuctionResult { winner: highest_bid.bidder, amount: highest_bid.amount }
}
