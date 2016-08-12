Rails.application.routes.draw do
  	resources :global_miles
    	root "global_miles#index"
  	namespace :api do
    	namespace :v1 do
   			get 'skyscanner/claim_lists'
      		post 'skyscanner/claim_lists_results'
    	end
  	end
end
