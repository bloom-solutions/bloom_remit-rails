class OnTxnResponse

  def self.call(txn, params)
    txn.id
  end

end
