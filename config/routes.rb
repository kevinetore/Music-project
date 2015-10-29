Rails.application.routes.draw do
  devise_for :podcasts

    resources :podcasts do
    resources :episodes
      post '/episodes/youtube_upload' => 'episodes#youtube_upload'
      post '/episodes/file_upload' => 'episodes#file_upload'
   end

   authenticated :podcast do
    root 'podcasts#dashboard', as: "authenticated_root"
   end

   root 'welcome#index'
end
