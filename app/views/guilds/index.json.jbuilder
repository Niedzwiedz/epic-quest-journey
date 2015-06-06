json.array!(@guilds) do |guild|
  json.extract! guild, :id, :name, :leader_id, :motto
  json.url guild_url(guild, format: :json)
end
