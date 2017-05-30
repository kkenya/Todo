User.creat(
    name: "Kawa",
    password: "k2@todo",
    password_confirmation: "k2@todo",
    administrator: true
)

limits = %w(today, week, month)

5.times do |i|
  User.create(
          name: "user#{i + 1}",
          password: "password",
          password_confimation: "password"
  )

  Event.create(
           user_id: i + 1,
           title: "titile#{i + 1}",
           memo: "memo#{ i + 1}",
           status: limits[i % 3],
           open: true
  )

  Speack.create(
            user_id: i + 1,
            event_id: i + 1,
            comment: "comment#{i + 1}"
  )
end