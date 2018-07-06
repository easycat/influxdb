from(db:"testdb")
  |> range(start: -5s)
  |> group(by: ["_measurement"])
  |> window(every: 1s, ignoreGlobalBounds: true)
  |> mean(timeSrc: "_start")
  |> window(every: inf, ignoreGlobalBounds: true)
  |> map(fn: (r) => {_time: r._time, mean: r._value})
  |> yield(name:"0")