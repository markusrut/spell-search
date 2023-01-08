SpellSearch = LibStub("AceAddon-3.0"):NewAddon("SpellSearch", "AceConsole-3.0")



function SpellSearch:OnInitialize()
  SpellSearch:RegisterChatCommand("search", "SearchForSpell")
  SpellSearch:RegisterChatCommand("spellsearch", "SearchForSpell")
  SpellSearch:RegisterClassSpells()
end

function SpellSearch:SearchForSpell(input)
  SpellSearch:Print("Searching for: " .. input)

  SearchClassSpells(input, SpellSearch.Classes.DeathKnight)
  SearchClassSpells(input, SpellSearch.Classes.DemonHunter)
  SearchClassSpells(input, SpellSearch.Classes.Druid)
  SearchClassSpells(input, SpellSearch.Classes.Evoker)
  SearchClassSpells(input, SpellSearch.Classes.Hunter)
  SearchClassSpells(input, SpellSearch.Classes.Mage)
  SearchClassSpells(input, SpellSearch.Classes.Monk)
  SearchClassSpells(input, SpellSearch.Classes.Paladin)
  SearchClassSpells(input, SpellSearch.Classes.Priest)
  SearchClassSpells(input, SpellSearch.Classes.Rogue)
  SearchClassSpells(input, SpellSearch.Classes.Shaman)
  SearchClassSpells(input, SpellSearch.Classes.Warlock)
  SearchClassSpells(input, SpellSearch.Classes.Warrior)
end

function SearchClassSpells(searchString, classSpells)

  local priestSpells = SearchForSpellNameInList(searchString, classSpells)

  if priestSpells then
    for k, v in pairs(priestSpells) do
      PrintSpellById(k)
    end
  end
end

function SearchForSpellNameInList(searchString, spells)
  local out = {}

  for k, v in pairs(spells) do
    if string.find(v, CaseInsensitivePattern(searchString)) then
      out[k] = v
    end
  end

  return out
end

function PrintSpellById(spellId)
  local name, rank, icon, castTime, minRange, maxRange, spellID, originalIcon = GetSpellInfo(spellId)
  if name then
    SpellSearch:Print("\124cffffd000\124Hspell:" .. spellID .. "\124h[" .. name .. "]\124h\124r")
  else
    SpellSearch:Print("No match for: " .. spellId)
  end
end

function SpellSearch:RegisterClassSpells()
  SpellSearch.Classes = {}
  SpellSearch.Classes.DeathKnight = GetDeathKnightSpells()
  SpellSearch.Classes.DemonHunter = GetDemonHunterSpells()
  SpellSearch.Classes.Druid = GetDruidSpells()
  SpellSearch.Classes.Evoker = GetEvokerSpells()
  SpellSearch.Classes.Hunter = GetHunterSpells()
  SpellSearch.Classes.Mage = GetMageSpells()
  SpellSearch.Classes.Monk = GetMonkSpells()
  SpellSearch.Classes.Paladin = GetPaladinSpells()
  SpellSearch.Classes.Priest = GetPriestSpells()
  SpellSearch.Classes.Rogue = GetRogueSpells()
  SpellSearch.Classes.Shaman = GetShamanSpells()
  SpellSearch.Classes.Warlock = GetWarlockSpells()
  SpellSearch.Classes.Warrior = GetWarriorSpells()

end

function CaseInsensitivePattern(pattern)
  local p = pattern:gsub("(%%?)(.)", function(percent, letter)
    return string.format("[%s%s]", letter:lower(), letter:upper())
  end)

  return p
end
