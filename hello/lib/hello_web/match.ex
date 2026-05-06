
IO.puts("----------------------pattern matching----------------------")

IO.puts("-------------")
conn = %{params: %{"promo" => "secret-code"}}
IO.puts(conn[:params]["promo"])

IO.puts("-------------")
ole = %{params: %{"promo" => "secret-code"}}
%{params: %{"promo" =>secret}} = ole 
IO.puts(secret)

IO.puts("-------------")
exit = %{
  params: %{
    "user" => %{"name" => "Ana", "age" => 20}
  }
}
%{params: %{"user" => %{"age" => age}}} = exit 
IO.puts(age)
IO.puts( %{params: %{"user" => %{"age" => 20}}} ==  20) 

IO.puts("-------------")
data = %{
  app: %{
    users: [
      %{profile: %{name: "Ana", role: "admin"}}
    ]
  }
}
%{app: %{users: [%{profile: %{role: role}}]}} = data
IO.puts(role)
