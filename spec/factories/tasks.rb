limits = %w(today, week, month)

for i in 0..4
  for j in 0..4
    Task.create(
        user_id: i + 1,
        title: "titile#{i * 5 + j + 1}",
        memo: "memo#{i * 5 + j + 1}",
        status: limits[i * 5 + j + 1 % 3],
        open: (i * 5 + j + 1) % 2 ? true : false
    )
  end
end
