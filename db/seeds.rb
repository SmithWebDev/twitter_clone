15.times do
  Post.create!(body: 'test body data',
               username: 'Test_User')
end
