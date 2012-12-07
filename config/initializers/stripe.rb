if Rails.env == 'production'
  Stripe.api_key = "sk_live_SD2s9mapKKQloB9xla9KK9WQ"
  STRIPE_PUBLIC_KEY = "pk_live_ACmaxu909tidF3MkR2LTUaJ3"
else
  Stripe.api_key = "sk_test_kz64MkgNcPJDexmhAKamc9QU"
  STRIPE_PUBLIC_KEY = "pk_test_Mv2uNp3KoCjeNI2kAuT2nx07"
#Stripe.api_key = ENV["STRIPE_API_KEY"]
#STRIPE_PUBLIC_KEY = ENV["STRIPE_PUBLIC_KEY"]
end
StripeEvent.setup do
  subscribe 'customer.subscription.deleted' do |event|
    user = User.find_by_customer_id(event.data.object.customer)
    user.expire
  end
end
