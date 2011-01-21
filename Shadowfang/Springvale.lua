-------------------------------------------------------------------------------
--  Module Declaration

local mod = BigWigs:NewBoss("Commander Springvale", "Shadowfang Keep")
if not mod then return end
mod.partyContent = true
mod:RegisterEnableMob(4278)
mod.toggleOptions = {
	93687, -- Desecration
	93844, -- Empowerment
	93736, -- Shield of the Perfidious
	93852, -- Word of Shame
	"bosskill",
}

-------------------------------------------------------------------------------
--  Initialization

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Desecration", 93687)
	self:Log("SPELL_CAST_START", "Empowerment", 93844)
	self:Log("SPELL_AURA_APPLIED", "Shield", 93736)
	self:Log("SPELL_AURA_APPLIED", "Word", 93852)

	self:Death("Win", 4278)
end

function mod:VerifyEnable()
	if GetInstanceDifficulty() == 2 then return true end
end

-------------------------------------------------------------------------------
--  Event Handlers

function mod:Desecration(_, spellId, _, _, spellName)
	self:Message(93687, spellName, "Attention", spellId)
end

function mod:Empowerment(_, spellId, _, _, spellName)
	self:Message(93844, spellName, "Important", spellId, "Alarm")
end

function mod:Shield(_, spellId, _, _, spellName)
	self:Message(93736, spellName, "Urgent", spellId)
end

function mod:Word(player, spellId, _, _, spellName)
	self:TargetMessage(93852, spellName, player, "Info", spellId)
end
