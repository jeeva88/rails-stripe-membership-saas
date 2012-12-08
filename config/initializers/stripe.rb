if Rails.env == 'production'
	Stripe.api_key = "sk_live_SD2s9mapKKQloB9xla9KK9WQ"
    STRIPE_PUBLIC_KEY = "pk_live_ACmaxu909tidF3MkR2LTUaJ3"
else
	Stripe.api_key = "sk_test_kz64MkgNcPJDexmhAKamc9QU"
    STRIPE_PUBLIC_KEY = "pk_test_Mv2uNp3KoCjeNI2kAuT2nx07"
end

StripeEvent.setup do
  subscribe 'customer.subscription.deleted' do |event|
    user = User.find_by_customer_id(event.data.object.customer)
    user.expire
  end
end
