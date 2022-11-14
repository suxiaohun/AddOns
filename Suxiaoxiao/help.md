|宏功能描述|宏命令
|:---:|:---:
修复变身后不能使用技能  |/console autounshift 1
修复技能不显示详细信息  |/console UberTooltips 1
修复聊天框不能滚轮翻页  |/console cvar_default
修复当前目标敌人血条不显示  |/run SetCVar("nameplateShowOnlyNames", 0) ReloadUI()
将血条从脚下恢复到头顶  |/run SetCVar("nameplateOtherAtBase",0)
修复伤害数字不显示  |/console floatingCombatTextCombatDamage 1(伤害数字,1为显示,0为关闭)
修复治疗数字不显示  |/console floatingCombatTextCombatHealing 1(治疗数字,1为显示,0为关闭)
伤害/治疗数字大小调整  |/console WorldTextScale 1 (改变数字1调整大小，可精确到0.1)
删除所有通用宏  |/script for i=1,120 do DeleteMacro(i) end
删除所有角色专用宏  |/script for i=121,138 do DeleteMacro(i) end
删除所有宏(通用+角色专用)  |/script for i=1,138 do DeleteMacro(i) end
显示头衔1/隐藏改为0  |/console UnitNamePlayerPVPTitle 1
显示公会名称1/隐藏改为0  |/console UnitNamePlayerGuild 1
反和谐宏  |/console SET portal "TW" 换行/console SET profanityFilter "0"
显示友方NPC血条  |/console nameplateShowFriendlyNPCs 1
保持血条在屏幕内(0.08默认数值可修改)  |/run SetCVar(“nameplateOtherToplnset”,0.08)
如需取消输入  |/run SetCVar(“nameplateOtherToplnset”,-1)
显示目标施法条  |/console showtargetcastbar 1
显示任务目标脚下圆环  |/console ShowQuestUnitCircles 1
伤害数字跳出方式 (0血条上方 1随机方向)   |/console floatingCombatTextCombatDamageDirectionalScale 0
视角拉远命令  |/console cameraDistanceMaxFactor 2.6
最大化视距命令  |/console cameraDistanceMaxZoomFactor4
保持血条在屏幕内  |/run SetCVar(“nameplateOtherToplnset”,0.08)
开启鼠标提示信息的任务提示计数  |/console showQuestTrackingTooltips 1
背包整理方向调整   |/run SetSortBagsRightToLeft(true)
如需换方向输入  |/run SetSortBagsRightToLeft(false)
拾取进入背包位置调整  |/run SetlnsertltemsLeftToRight(true)
如需换方向输入  |/run SetlnsertltemsLeftToRight(false)
开启任务自动追踪  |/console autoQuestWatch 1
开启目标脚下光圈  |/console objectselectioncircle 1
开启装备对比  |/console alwaysCompareltems 1
显示敌方姓名板职业颜色  |/console ShowClassColorlnNameplate 1
显示友方姓名板职业颜色  |/console ShowClassColorlnFriendlyNameplate 1
姓名板显示施法条  |/console showVKeyCastbar 1
只显示当前的目标的姓名板显示施法条  |/console showVKeyCastbarOnlyOnTarget 1
显示目标身上的所有的减益效果   |/console noBuffDebuffFilterOnTarget 1
开启仇恨百分比  |/console threatShowNumeric 1
移动时大地图透明  |/console mapFade 1
显示lua报错  |/console scriptErrors 0
显示技能平均数值  |/console SpellTooltip DisplayAvgValues 1
摄像机镜头中心点  |/console cameraPivot 0
对目标的伤害  |/console floatingCombatTextCombatDamage 1
治疗  |/console floatingCombatHealing 1
宠物伤害 宠物的平砍  |/console floatingCombatTextPetMeleeDamage 1
宠物的技能   |/console floatingCombatTextPetSpellDamage 1
目标护盾提示   |/console floatingCombatTextCombatHealingAbsorbTarget 1
自身护盾提示  |/console floatingCombatTextCombatHealingAbsorbSelf 1
闪避   |/console floatingCombatTextDodgeParryMiss 1
吸收  |/console floatingCombatTextDamageReduction 1
周期性伤害   |/console floatingCombatTextCombatLogPeriodicSpells 1
法术警告   |/console floatingCombatTextReactives 1
恢复插件设置  |/console cvar_default
防掉线宏:首先插件全部禁用，使用后生效标识：小队频道会显示“开”字，无小队会提示你不在队伍中。  |/script T,F=0,CreateFrame("frame")if Y then Y=nil else SendChatMessage("开","party") Y=function()StaticPopup1Button1:Click() AcceptGroup()if UnitLevel("player")== 61 then LeaveParty()end end end F:SetScript("OnUpdate",Y)
|
|
不上传不下载宏命令  |/console synchronizeSettings 0
延迟容限修改命令  |/console SpellQueueWindow 100(默认是400，近战和法师 建议值250)
伤害数字去逗号(1，有逗号 0 没有)  |/console SET breakUpLargeNumbers "1"
点击移动框体  |ESC-界面-易用性-显示移动框
点击移动  |ESC-界面-鼠标-点击移动
语音播报  |ESC-界面-易用性-大声朗读语音文字
金银铜文字显示  |ESC-界面-色盲模式-开启色盲模式界面

