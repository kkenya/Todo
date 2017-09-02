limits = %w(today, week, month)

5.times do |i|
  Task.create(
      user_id: i + 1,
      title: "titile#{i + 1}",
      memo: "memo#{ i + 1}",
      status: limits[i % 3],
      open: true
  )
end
