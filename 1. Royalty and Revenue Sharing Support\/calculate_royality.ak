fn calculate_royalty(amount: Int, royalty_percentage: Int) -> Int {
    amount * royalty_percentage / 100
}

fn distribute_revenue(amount: Int, recipients: List<Recipient>) -> Bool {
    let total_shares = recipients |> List.map(\r -> r.share) |> List.sum
    recipients
    |> List.map(\recipient -> {
        let payout = amount * recipient.share / total_shares
        transfer_funds(recipient.address, payout)
    })
    |> List.all(\res -> res == true)
}
