  Stripe.api_key = "sk_test_kz64MkgNcPJDexmhAKamc9QU"
  STRIPE_PUBLIC_KEY = "pk_test_Mv2uNp3KoCjeNI2kAuT2nx07"
#Stripe.api_key = ENV["STRIPE_API_KEY"]
#STRIPE_PUBLIC_KEY = ENV["STRIPE_PUBLIC_KEY"]

StripeEvent.setup do
  subscribe 'customer.subscription.deleted' do |event|
    user = User.find_by_customer_id(event.data.object.customer)
    user.expire
  end
end
