5.times do |i|
  User.create(
      name: "user#{i + 1}",
      password: "password",
      password_confirmation: "password"
  )
end