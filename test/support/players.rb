module Players
  def players
    filename = File.join("test", "fixtures", "files", "players.json")
    response = IO.read(filename)
    JSON.parse(response)
  end
end
