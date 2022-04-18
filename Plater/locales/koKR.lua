local L = LibStub("AceLocale-3.0"):NewLocale("PlaterNameplates", "koKR") 
if not L then return end 

L["OPTIONS_ALPHA"] = "투명도"
L["OPTIONS_ANCHOR"] = "위치"
L["OPTIONS_ANCHOR_BOTTOM"] = "아래"
L["OPTIONS_ANCHOR_BOTTOMLEFT"] = "왼쪽 아래"
L["OPTIONS_ANCHOR_BOTTOMRIGHT"] = "오른쪽 아래"
L["OPTIONS_ANCHOR_CENTER"] = "가운데"
L["OPTIONS_ANCHOR_INNERBOTTOM"] = "내부 아래"
L["OPTIONS_ANCHOR_INNERLEFT"] = "내부 왼쪽"
L["OPTIONS_ANCHOR_INNERRIGHT"] = "내부 오른쪽"
L["OPTIONS_ANCHOR_INNERTOP"] = "내부 위"
L["OPTIONS_ANCHOR_LEFT"] = "왼쪽"
L["OPTIONS_ANCHOR_RIGHT"] = "오른쪽"
L["OPTIONS_ANCHOR_TOP"] = "위"
L["OPTIONS_ANCHOR_TOPLEFT"] = "왼쪽 위"
L["OPTIONS_ANCHOR_TOPRIGHT"] = "오른쪽 위"
L["OPTIONS_CANCEL"] = "취소"
L["OPTIONS_COLOR"] = "색상"
L["OPTIONS_ENABLED"] = "활성화"
L["OPTIONS_ERROR_CVARMODIFY"] = "CVAR 수정"
L["OPTIONS_ERROR_EXPORTSTRINGERROR"] = "내보내기 실패"
L["OPTIONS_FONT"] = "글꼴"
L["OPTIONS_FRIENDLY"] = "아군"
L["OPTIONS_GENERALSETTINGS_HEALTHBAR_ANCHOR_TITLE"] = "생명력바 모양"
L["OPTIONS_GENERALSETTINGS_HEALTHBAR_BGCOLOR"] = "생명력바 배경 색상/투명도"
L["OPTIONS_GENERALSETTINGS_HEALTHBAR_BGTEXTURE"] = "생명력바 배경 텍스쳐"
L["OPTIONS_GENERALSETTINGS_HEALTHBAR_TEXTURE"] = "생명력바 텍스쳐"
L["OPTIONS_GENERALSETTINGS_TRANSPARENCY_ANCHOR_TITLE"] = "투명도 설정"
L["OPTIONS_GENERALSETTINGS_TRANSPARENCY_RANGECHECK"] = "거리 확인 주문"
L["OPTIONS_GENERALSETTINGS_TRANSPARENCY_RANGECHECK_ALPHA"] = "거리에 따른 투명도"
L["OPTIONS_GENERALSETTINGS_TRANSPARENCY_RANGECHECK_SPEC_DESC"] = "해당 전문화에서 거리를 확인하는 기준이 되는 주문"
L["OPTIONS_HOSTILE"] = "적"
L["OPTIONS_NEUTRAL"] = "중립"
L["OPTIONS_OKAY"] = "확인"
L["OPTIONS_OUTLINE"] = "외곽선"
L["OPTIONS_PLEASEWAIT"] = "잠시 기다려주세요"
L["OPTIONS_PROFILE_CONFIG_EXPORTINGTASK"] = "현재 프로필을 내보내는 중입니다."
L["OPTIONS_PROFILE_CONFIG_EXPORTPROFILE"] = "프로필 내보내기"
L["OPTIONS_PROFILE_CONFIG_IMPORTPROFILE"] = "프로필 가져오기"
L["OPTIONS_PROFILE_CONFIG_MOREPROFILES"] = "Wago.io에서 더 많은 프로필들을 만나보세요."
L["OPTIONS_PROFILE_CONFIG_OPENSETTINGS"] = "프로필 설정 열기"
L["OPTIONS_PROFILE_CONFIG_PROFILENAME"] = "새 프로필명"
L["OPTIONS_PROFILE_CONFIG_PROFILENAME_DESC"] = "새로운 프로필을 문자열로부터 가져옵니다.기존 프로필 이름을 입력하시면, 기존 프로필을 덮어씁니다."
L["OPTIONS_PROFILE_ERROR_PROFILENAME"] = "부적합한 프로필명입니다."
L["OPTIONS_PROFILE_ERROR_STRINGINVALID"] = "부적합한 프로필 문자열입니다."
L["OPTIONS_PROFILE_ERROR_WRONGTAB"] = "잘못된 프로필입니다. 스크립트나 모드에서 가져오기 해보세요."
L["OPTIONS_PROFILE_IMPORT_OVERWRITE"] = "'%s' 프로필은 이미 존재합니다. 덮어쓰시겠습니까?"
L["OPTIONS_SETTINGS_COPIED"] = "설정이 복사되었습니다."
L["OPTIONS_SETTINGS_FAIL_COPIED"] = "현재 선택된 탭의 설정을 가져오지 못했습니다."
L["OPTIONS_SHADOWCOLOR"] = "그림자 색상"
L["OPTIONS_SIZE"] = "크기"
L["OPTIONS_STATUSBAR_TEXT"] = "이제 |cFFFFAA00http://wago.io|r에서 프로필, 모드, 스크립트, 애니메이션 및 색상표를 가져올 수 있습니다."
L["OPTIONS_TABNAME_ADVANCED"] = "상세"
L["OPTIONS_TABNAME_ANIMATIONS"] = "애니메이션"
L["OPTIONS_TABNAME_AUTO"] = "자동"
L["OPTIONS_TABNAME_BUFF_LIST"] = "효과 목록"
L["OPTIONS_TABNAME_BUFF_SETTINGS"] = "효과 설정"
L["OPTIONS_TABNAME_BUFF_SPECIAL"] = "효과 특수"
L["OPTIONS_TABNAME_BUFF_TRACKING"] = "효과 추적"
--[[Translation missing --]]
L["OPTIONS_TABNAME_CASTBAR"] = "Cast Bar"
--[[Translation missing --]]
L["OPTIONS_TABNAME_CASTCOLORS"] = "\"Cast Colors and Names\""
--[[Translation missing --]]
L["OPTIONS_TABNAME_COMBOPOINTS"] = "Combo Points"
L["OPTIONS_TABNAME_GENERALSETTINGS"] = "일반"
L["OPTIONS_TABNAME_MODDING"] = "모드"
--[[Translation missing --]]
L["OPTIONS_TABNAME_NPC_COLORNAME"] = "Npc Colors and Names"
L["OPTIONS_TABNAME_NPCENEMY"] = "적 NPC"
L["OPTIONS_TABNAME_NPCFRIENDLY"] = "아군 NPC"
L["OPTIONS_TABNAME_PERSONAL"] = "개인 자원 바"
L["OPTIONS_TABNAME_PLAYERENEMY"] = "적 플레이어"
L["OPTIONS_TABNAME_PLAYERFRIENDLY"] = "아군 플레이어 "
L["OPTIONS_TABNAME_PROFILES"] = "프로필"
L["OPTIONS_TABNAME_SCRIPTING"] = "스크립트"
--[[Translation missing --]]
L["OPTIONS_TABNAME_SEARCH"] = "Search"
L["OPTIONS_TABNAME_STRATA"] = "프레임 우선순위"
L["OPTIONS_TABNAME_TARGET"] = "대상"
L["OPTIONS_TABNAME_THREAT"] = "위협 수준 / 어그로"
L["OPTIONS_TEXTURE"] = "텍스쳐"
L["OPTIONS_THREAT_AGGROSTATE_ANOTHERTANK"] = "다른 탱커에 어그로"
L["OPTIONS_THREAT_AGGROSTATE_HIGHTHREAT"] = "위협 수준 높음"
L["OPTIONS_THREAT_AGGROSTATE_NOAGGRO"] = "위협 수준 없음"
L["OPTIONS_THREAT_AGGROSTATE_NOTANK"] = "탱커 어그로 없음"
L["OPTIONS_THREAT_AGGROSTATE_NOTINCOMBAT"] = "전투 중이지 않은 유닛"
L["OPTIONS_THREAT_AGGROSTATE_ONYOU_LOWAGGRO"] = "낮은 위협 수준"
L["OPTIONS_THREAT_AGGROSTATE_ONYOU_LOWAGGRO_DESC"] = "당신이 어그로를 갖고 있지만, 다른 대상에게 위협 수준이 전이 중인 유닛"
L["OPTIONS_THREAT_AGGROSTATE_ONYOU_SOLID"] = "당신에게 어그로"
L["OPTIONS_THREAT_AGGROSTATE_TAPPED"] = "선점된 유닛"
L["OPTIONS_THREAT_COLOR_DPS_ANCHOR_TITLE"] = "딜러나 힐러를 플레이할 시의 위협 수준 색상"
L["OPTIONS_THREAT_COLOR_DPS_HIGHTHREAT_DESC"] = "곧 당신을 공격하게 될 유닛 "
L["OPTIONS_THREAT_COLOR_DPS_NOAGGRO_DESC"] = "당신을 공격하지 않고 있는 유닛"
L["OPTIONS_THREAT_COLOR_DPS_NOTANK_DESC"] = "당신이나 탱커를 공격하고 있지 않지만, 다른 파티원을 공격중인 유닛"
L["OPTIONS_THREAT_COLOR_DPS_ONYOU_SOLID_DESC"] = "당신을 공격하고 있는 유닛"
L["OPTIONS_THREAT_COLOR_OVERRIDE_ANCHOR_TITLE"] = "기존 색상 덮어씀"
L["OPTIONS_THREAT_COLOR_OVERRIDE_DESC"] = "게임 내의 중립, 적대적 그리고 우호적 유닛의 색상을 설정합니다. 전투 중에는, 위협 수준 색상으로 덮어씌워집니다."
L["OPTIONS_THREAT_COLOR_TANK_ANCHOR_TITLE"] = "탱커로 플레이할 시의 위협 수준 색상"
L["OPTIONS_THREAT_COLOR_TANK_ANOTHERTANK_DESC"] = "다른 탱커에 의해서 탱킹되고 있는 유닛"
L["OPTIONS_THREAT_COLOR_TANK_NOAGGRO_DESC"] = "당신에게 어그로가 없는 유닛"
L["OPTIONS_THREAT_COLOR_TANK_NOTINCOMBAT_DESC"] = "전투 중이지 않은 유닛"
L["OPTIONS_THREAT_COLOR_TANK_ONYOU_SOLID_DESC"] = "당신이 탱킹하고 있으며 당신을 공격하고 있는 유닛"
L["OPTIONS_THREAT_COLOR_TAPPED_DESC"] = "다른 사람에 의해 선점된 유닛(유닛으로부터 루팅이나 경험치를 얻지 못함)"
L["OPTIONS_THREAT_DPS_CANCHECKNOTANK"] = "탱커에 위협 수준 없을 시 색상"
L["OPTIONS_THREAT_DPS_CANCHECKNOTANK_DESC"] = "당신이 딜러/힐러를 플레이할 때, 탱커에 어그로가 있지만 탱커가 아닌 다른 대상을 공격하는 유닛"
L["OPTIONS_THREAT_MODIFIERS_ANCHOR_TITLE"] = "위협 수준이 다음을 변경"
L["OPTIONS_THREAT_MODIFIERS_BORDERCOLOR"] = "테두리 색상"
L["OPTIONS_THREAT_MODIFIERS_HEALTHBARCOLOR"] = "생명력바 색상"
L["OPTIONS_THREAT_MODIFIERS_NAMECOLOR"] = "이름 색상"
L["OPTIONS_XOFFSET"] = "X 좌표"
L["OPTIONS_YOFFSET"] = "Y 좌표"
