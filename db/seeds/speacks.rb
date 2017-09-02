for i in 0..4
  for j in 0..4
    Speack.create(
        user_id: i + 1,
        task_id: i * 5 + j + 1,
        comment: "comment#{i * 5 + j + 1}"
    )
  end
end
