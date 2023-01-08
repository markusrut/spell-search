local _, SpellSearch = ...
SpellSearch = LibStub("AceAddon-3.0"):NewAddon("SpellSearch", "AceConsole-3.0")



function SpellSearch:OnInitialize()
  SpellSearch:Print("Hello world form SpellSearch")
  SpellSearch:RegisterChatCommand("search", "SearchForSpell")
  SpellSearch:RegisterChatCommand("spellsearch", "SearchForSpell")
  SpellSearch:Print("Commands registered")
end

function SpellSearch:OnEnable()
  SpellSearch:Print("SpellSearch Enabled")
end

function SpellSearch:OnDisable()
  SpellSearch:Print("SpellSearch Disabled")
end

function SpellSearch:SearchForSpell(input)
  self:Print("Searching for: " .. input)
  self:Print("\124cffffd000\124Hspell:260402\124h[Double Tap]\124h\124r")
end
