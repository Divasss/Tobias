(*
  Auto Noblesse Quest




*)

uses
SysUtils, Classes, fp_ap, fp_inc;
var
EndQuestStage, Quest1Id, Quest2Id, Quest3Id, Quest4Id: Integer;


function DoStage0: void;
begin
  Print('Stage 0/39 - Go to aden, find Talien, and start the quest.');
  if IsUnderAttack then GetOutOfCombat();
  PortToAden();
  
  MoveToTalienFromAdenSpawn;
  
  LeadDlg(31739, 1, 1);
end;

function DoStage1: void;
begin
  Print('Stage 1/39 - Go to Giran, and speak with Gabrielle.');
  if IsUnderAttack then GetOutOfCombat();
  PortToGiran();
  
  MoveToGabrielleFromGiranSpawn;
  
  qLeadDlg(30753, 1, 'Precious Soul - 1', 1);
end;


function DoStage2: void;
begin
  Print('Stage 2/39 - Go to Dragon Valley, and speak with Gilmore.');
  if IsUnderAttack then GetOutOfCombat();
  PortToDragonValley();
  
  //movement	
	if qLeadDlg(30754, 2, 'Precious Soul - 1', 1) then
		WriteToDB('qStage3');
end;

function DoStage3: void;
var
MapName: string;
oTarget: Tl2Live;
CurrentQuestStage, DesiredQuestItemCount, QuestItemId: Integer;
begin
  Print('Stage 3/39 - Go to BeeHive, and kill Baram - Quest npc.');
  if IsUnderAttack then GetOutOfCombat();
  PortToBeehive();
  
  MoveToBarahamFromBeehiveSpawn();  
  
  while (GetQuestStage <= 3) do begin
    if (NpcList.ById(27113, oTarget)) then begin
	  KillMob(oTarget);
	end;
    if not (User.InRange(20968, 184600, -3336, 100))
	and (User.InRange(20968, 184600, -3336, 700)) then CMoveTo(20968, 184600, -3336);
	
	Delay(500);
  end;

end;

function DoStage4: void;
begin
  Print('Stage 4/39 - Go back to Aden, Deliver to Talien.');
  if IsUnderAttack then GetOutOfCombat();
  PortToAden();
  
  MoveToTalienFromAdenSpawn;
  LeadDlg(31739, 1, 1);
end;

function DoStage5: void;
begin
	Print('Stage 5/39 - Go to Heine - Grocery Shop, and speak with the melody maestro.');
	if IsUnderAttack then GetOutOfCombat();
	if not (GetArea = 15)  then begin
		PortToHeine();
		MoveToMelodyMaestroFromHeineSpawn(); 
	end;
	if (GetName_Server = 'Idle') then begin
		//8 instead of 2 on Idle
		if (qLeadDlg(31042, 8, 'Precious Soul - 1', 1)) then begin
			Delay(1000);
			WriteToDB('Melody1');
		end;
	end else begin
		if (qLeadDlg(31042, 2, 'Precious Soul - 1', 1)) then begin
			Delay(1000);
			WriteToDB('Melody1');
		end;
	end;
end;

function DoStage6: void;
var
MapName: string;
CurrentQuestStage, DesiredQuestItemCount, QuestItemId: Integer;
begin
  Print('Stage 6/39 - Go to Watchers Tomb, near Dragon Valley, and farm Malruk Succubus');
  if not (GetArea = 11) then begin
    PortToDragonValley();
	MoveToWatchTombFromDV();
  end;
  
  MapName := 'NQ_WatchersTomb.zmap';
  QuestItemId := 7597;
  DesiredQuestItemCount := 10;
  CurrentQuestStage := 6;
  StartFarmQuestItems(MapName, QuestItemId, DesiredQuestItemCount, CurrentQuestStage);
end;

function DoStage7: void;
begin
	Print('Stage 7/39 - Go to Heine and speak with the Melody Maestro');
	if IsUnderAttack then GetOutOfCombat;
	if not (GetArea = 15)  then begin
		PortToHeine();
		MoveToMelodyMaestroFromHeineSpawn(); 
	end;
	if (GetName_Server = 'Idle') then begin
		//8 instead of 2 on Idle
		if (qLeadDlg(31042, 8, 'Precious Soul - 1', 1)) then begin
			Delay(1000);
		end;
	end else begin
		if (qLeadDlg(31042, 2, 'Precious Soul - 1', 1)) then begin
			Delay(1000);
		end;
	end;
end;

function DoStage8: Void;
begin
  Print('Stage 8/39 - Go to Aden, and speak with Talien');
  if IsUnderAttack then GetOutOfCombat;
  PortToAden();
  
  MoveToTalienFromAdenSpawn();
  
  if LeadDlg(31739, 1, 1) then begin
	WriteToDB('Talien1');
  end;
end;

function DoStage9: Void;
begin
  Print('Stage 9/39 - Go to Hunter''s Vilage, and speak with Stedmiel');
  if IsUnderAttack then GetOutOfCombat;
  PortToHunters();
  
  MoveToStedmielFromHunterSpawn();
  
  LeadDlg(30692, 3, 1);
end;

function DoStage10: Void;
begin
  Print('Stage 10/39 - Go to Aden, and speak with Talien');
  if IsUnderAttack then GetOutOfCombat;
  PortToAden();
  
  MoveToTalienFromAdenSpawn();
  
  if LeadDlg(31739, 1, 1) then
	WriteToDB('Talien2');
end;

function DoStage11: Void;
begin
  Print('Stage 11/39 - Go to Rune Balcony, and speak with Virgil');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 10) then begin
    PortToRune();
    MoveToRuneBalconyFromRuneGk();
  end;
  
  if qLeadDlg(31742, 1, 'Precious Soul - 1', 1) then
	WriteToDB('Virgil1');
end;

function DoStage12: Void;
begin
  Print('Stage 12/39 - Go to Rune Balcony, and speak with Ogmar');
  if IsUnderAttack then GetOutOfCombat;
  
  if not (GetArea = 10) then begin
    PortToRune();
    MoveToRuneBalconyFromRuneGk();
  end;
  
  if LeadDlg(31744, 1, 1) then
	WriteToDB('Ogmar1');
end;

function DoStage13: Void;
begin
  Print('Stage 13/39 - Go to Rune Mystic Guild, and speak with Rahorakti.');
  if IsUnderAttack then GetOutOfCombat;
  PortToRune();
  MoveToRuneMagicGuildFromRuneGk();
  
  if qLeadDlg(31336, 6, 'Precious Soul - 1', 1) then
	WriteToDB('Rahorakti1');
end;




function DoStage14: Void;
var
MapName: string;
CurrentQuestStage, DesiredQuestItemCount, QuestItemId: Integer;
begin
  Print('Stage 14/39 - Go to Cemetary, and farm Taik Orc Supply Leader, to get Crimson Moss x5');
  if IsUnderAttack then GetOutOfCombat;
  PortToCemetary();
  
  MoveToTaikOrcsFromCemetarySpawn();
  
  MapName := 'NQ_Cemetary_TaikOrcs.zmap';
  QuestItemId := 7598;
  DesiredQuestItemCount := 5;
  CurrentQuestStage := 14;
  StartFarmQuestItems(MapName, QuestItemId, DesiredQuestItemCount, CurrentQuestStage);
end;

function DoStage15: Void;
begin
  Print('Stage 15/39 - Go to Rune Mystic Guild, and deliver to Rahorakti.');
  if IsUnderAttack then GetOutOfCombat;
  PortToRune();
  MoveToRuneMagicGuildFromRuneGk();
  
  qLeadDlg(31336, 6, 'Precious Soul - 1', 1);
end;

function DoStage16: Void;
begin
  Print('Stage 16/39 - Go to Rune Balcony, and speak with Kassandra');
  if IsUnderAttack then GetOutOfCombat;
  
  if not (GetArea = 10) then begin
    PortToRune();
    MoveToRuneBalconyFromRuneGk();
  end;
  
  if LeadDlg(31743, 1, 1) then
	WriteToDB('Kassandra1');
end;

function DoStage17: Void;
begin
  Print('Stage 17/39 - Go to Rune Balcony, and speak with Virgil');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 10) then begin
    PortToRune();
    MoveToRuneBalconyFromRuneGk();
  end;
  
  if qLeadDlg(31742, 1, 'Precious Soul - 1', 1) then
	WriteToDB('Virgil2');
end;

function DoStage18: Void;
begin
  Print('Stage 18/39 - Go to Goddard, and speak with Caradine');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 12) then begin
    PortToGoddard();
    MoveToCaradineFromGoddardGk;
  end;
  
  if qLeadDlg(31740, 1, 'Precious Soul - 1', 1, 1) then
	WriteToDB('Caradine1');
end;

function DoStage19: Void;
begin
  Print('Stage 19/39 - Go to Goddard, and speak with Caradine');
  print('Stage 19 NOT NEEDED!?!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 12) then begin
    PortToGoddard();
    MoveToCaradineFromGoddardGk;
  end;
  
  qLeadDlg(31740, 1, 'Precious Soul - 1', 1, 1);
end;

function DoStage20: Void;
begin
  Print('Stage 20/39 - Go to Rune Balcony, and take 2nd quest from Virgil');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 10) then begin
    PortToRune();
    MoveToRuneBalconyFromRuneGk;
  end;
  
  qLeadDlg(31742, 1, 'Precious Soul - 2', 1);
end;
function DoStage21: Void;
begin
  Print('Stage 21/39 - Go to Rune Balcony, and speak with Kassandra');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 10) then begin
    PortToRune();
    MoveToRuneBalconyFromRuneGk;
  end;
  
  qLeadDlg(31743, 1, 'Precious Soul - 2', 1, 1, 1, 1);
end;
function DoStage22: Void;
begin
  Print('Stage 22/39 - Go to Rune Balcony, and speak with Ogmar');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 10) then begin
    PortToRune();
    MoveToRuneBalconyFromRuneGk;
  end;
  
  if qLeadDlg(31744, 1, 'Precious Soul - 2', 1) then 
  //if LeadDlg(31744, 1, 1) then non idle
	WriteToDB('Ogmar2');
end;
function DoStage23: Void;
begin
  Print('Stage 23/39 - Go to Devil''s Pass');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 13) then begin
    PortToSwampOfScreams();
    MoveToDevilPassFromSwampOfScreamSpawn;
  end;
  
  if LeadDlg(31751, 1, 1) then
	WriteToDB('DarkKnight1');
end;
function DoStage24: Void;
var
i: Integer;
oTarget: Tl2Live;
oItem: Tl2Item;
begin
  Print('Stage 24/39 - Go to Devil''s Pass');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 13) then begin
    PortToSwampOfScreams();
    MoveToDevilPassFromSwampOfScreamSpawn;
  end;

  for i := 0 to NpcList.Count - 1 do begin
    oTarget := NpcList.Items(i);
	if not(oTarget.ID = 31752) then Continue;
	Delay(500);
	LeadDlgByObj(oTarget, 1);
	Delay(1000);
    if (Inventory.Quest.ByID(7590, oItem)) then Break;
  end;

end;

function DoStage25: Void;
begin
  Print('Stage 25/39 - Go to Devil''s Pass');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 13) then begin
    PortToSwampOfScreams();
    MoveToDevilPassFromSwampOfScreamSpawn;
  end;
  
  if LeadDlg(31751, 1) then
	WriteToDB('DarkKnight2');
end;

function DoStage26: Void;
begin
  Print('Stage 26/39 - Go to Witch Kalis');
  if IsUnderAttack then GetOutOfCombat;
  PortToIvoryTower();
  MoveToWitchKalisFromIvory;
  
  if LeadDlg(30759, 1, 1) then
	WriteToDB('Kalis1');
end;

function DoStage27: Void;
begin
  Print('Stage 27/39 - Go to Matild, Witch Kalis''s disciple');
  if IsUnderAttack then GetOutOfCombat;
  PortToIvoryTower();
  MoveToMatildFromIvory;
  
  qLeadDlg(30738, 1, 'Precious Soul - 2', 1);
end;

function DoStage28: Void;
begin
  Print('Stage 28/39 - Go to Witch Kalis');
  if IsUnderAttack then GetOutOfCombat;
  PortToIvoryTower();
  MoveToWitchKalisFromIvory;
  
  if LeadDlg(30759, 1, 1) then
	WriteToDB('Kalis2');
end;

function DoStage29: Void;
var
MapName: string;
CurrentQuestStage, DesiredQuestItemCount, QuestItemId: Integer;
begin
  Print('Stage 29/39 - Go to Valley of Saints Cave');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 14) then begin
    PortToValleyOfSaints();
    MoveToValleyOfSaintsCaveFromVoSSpwn;
  end;
  MapName := 'NQ_VoS_Cave.zmap';
  QuestItemId := 7595;
  DesiredQuestItemCount := 4;
  CurrentQuestStage := 29;
  StartFarmQuestItems(MapName, QuestItemId, DesiredQuestItemCount, CurrentQuestStage);
end;


function DoStage30: Void;
var
i, counter: Integer;
oTarget: Tl2Live;
oItem: Tl2Item;
Succes: Boolean;
QuestMobList: Array of Tl2Live;
begin
  Print('Stage 30: Put in the orbs');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 14) then begin
    PortToValleyOfSaints();
    MoveToValleyOfSaintsCaveFromVoSSpwn;
  end;
  Engine.MoveTo(86113, -76262, -3456);
  Engine.MoveTo(85880, -76568, -3456);
    
  while (GetNumberOfNpcsAroundWithID(31748) < 4) do Delay(500);
  
  QuestMobList := GetListOfNpcsByIdOfCount(31748, 4);
  if not (DoesArrayContainNil(QuestMobList)) then begin
	Print('Array contained nil, pass');
    Delay(10000);
	Exit;
  end;  
  
  for i := 0 to Length(QuestMobList)-1 do begin
    oTarget := QuestMobList[i];
	if not (oTarget.ID = 31748) or (oTarget.Dead) then Continue;
	LeadDlgByObj(oTarget, 1, 1);
	Delay(2000);
  end;
  Delay(1000);
  LeadDlg(31746, 1);
  Delay(4000);
  counter := 0;
  while not NpcList.ById(31747, oTarget) do begin
	counter := counter + 1;
	if (counter > 60) then break;
	Delay(1000);
  end;
  Succes := LeadDlg(31747, 1);
  
  if Succes then
    WriteToDB('Unicorn');
end;

function DoStage31: Void;
begin
  Print('Stage 31/39 - Go to Rune Balcony, and speak with Kassandra');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 10) then begin
    PortToRune();
    MoveToRuneBalconyFromRuneGk;
  end;
  
  qLeadDlg(31743, 1, 'Precious Soul - 2');
  Delay(3000);
  qLeadDlg(31742, 1, 'Precious Soul - 2', 1);
end;


function DoStage32: Void;
begin
  Print('Stage 32/39 - Go to Goddard, and speak with Caradine');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 12) then begin
    PortToGoddard();
    MoveToCaradineFromGoddardGk;
  end;
  
  qLeadDlg(31740, 1, 'Precious Soul - 3', 1);
end;


function DoStage33: Void;
begin
  Print('Stage 33/39 - Go to Goddard, and speak with Ossian');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 12) then begin
    PortToGoddard();
    MoveToCaradineFromGoddardGk;
  end;
  
  LeadDlg(31741, 1, 1);
end;



function DoStage34: Void;
begin
  Print('Stage 34/39 - Go to Valley of Saints, and kill Judge, Pilgrim of Splendor');
  if IsUnderAttack then GetOutOfCombat;
  PortToValleyOfSaints();
  SearchForSplendors;
end;

function DoStage35: Void;
begin
  Print('Stage 35/39 - Go to Goddard, and speak with Ossian');
  if IsUnderAttack then GetOutOfCombat;
  PortToGoddard();
  MoveToCaradineFromGoddardGk;
  (*if*) LeadDlg(31741, 1, 1, 2); (*then*)
	WriteToDB('Ossian1');
end;

function DoStage36: Void;
var
MapName: string;
CurrentQuestStage, DesiredQuestItemCount, QuestItemId: Integer;
begin
  Print('Stage 36/39 - Go to Valley of Saints 100 Quest Items Spot');
  if IsUnderAttack then GetOutOfCombat;
  PortToValleyOfSaints();
  MoveToValleyOfSaints100QiFromVoSSpwn;
  MapName := 'NQ_VoS_100QI.zmap';
  QuestItemId := 21725;
  DesiredQuestItemCount := 100;
  CurrentQuestStage := 36;
  StartFarmQuestItems(MapName, QuestItemId, DesiredQuestItemCount, CurrentQuestStage);
end;

function DoStage37: Void;
begin
  Print('Stage 37/39 - Go to Goddard, and speak with Ossian');
  if IsUnderAttack then GetOutOfCombat;
  PortToGoddard();
  MoveToCaradineFromGoddardGk;
  LeadDlg(31741, 1, 1);
end;

function DoStage38: Void;
begin
  Print('Stage 38/39 - Go to Ivory Tower, and speak with Ladd');
  if IsUnderAttack then GetOutOfCombat;
  PortToIvoryTower();
  MoveToLaddFromIvoryGk;
  qLeadDlg(30721, 4, 'Precious Soul - 3', 1);
end;

function DoStage39: Void;
begin
  Print('Stage 39/39 - Go to Goddard, and hand in Caradine''s Final Letter');
  if IsUnderAttack then GetOutOfCombat;
  if not (GetArea = 12) then begin
    PortToGoddard();
    MoveToCaradineFromGoddardGk;
  end;
  
  qLeadDlg(31740, 1, 'Precious Soul - 4', 1, 1, 1);
  Delay(5000);
  LeadDlg(31745, 1, 1, 1, 1, 1);
  Delay(1000);
  if (User.Noble) then
    Print('Quest Done! Noblesse Achieved!');
end;


function StartFarmQuestItems(MapName: string; QuestItemId: Integer; DesiredQuestItemCount: Integer; StartQuestStage: Integer): void;
var
oItem, AlternateItem: Tl2Item;
Cur_QuestStage: Integer;
begin
  cLoadZone(MapName);
  while true do begin
    //if (Inventory.Quest.ById(QuestItemId, oItem)) then begin
		//print('We have ' + IntToStr(oItem.Count) + ' ' + oItem.Name + 's.  We miss ' + IntToStr(DesiredQuestItemCount - oItem.Count));
	//end else
		//print('No quest items yet');
	Inventory.Quest.ById(QuestItemId, oItem);
	Cur_QuestStage := GetQuestStage();
	if (oItem.Count >= DesiredQuestItemCount) 
	or (Cur_QuestStage > StartQuestStage)
    or (oItem.ID = 21725) and (Inventory.Quest.ByID(7593, AlternateItem)) 
	or (User.Dead)
	or (User.Buffs.Count < 15) then begin
	  print('Farming Done.');
	  GetOutOfCombat();
	  break;
	end;
	if not (Engine.GetFaceState(0)) then
	  Engine.FaceControl(0, True);
	Delay(1000);
  end;
  Engine.ClearZone;
end;


function GetQuestStage: Integer;
var
i: Integer;
oItem: Tl2Item;
BarahamMessage, Melody1Message, Talien1Message, Talien2Message: string;
begin
  result := 0;
  BarahamMessage := 'Baraham';
  Melody1Message := 'Melody1';
  Talien1Message := 'Talien1';
  Talien2Message := 'Talien2';
  
  if (User.Noble) then begin
    result := EndQuestStage;
	Exit;
  end;
  
  if (Inventory.Quest.ById(7679, oItem)) or (Inventory.User.ById(7679, oItem))  then begin //Caradine's Letter, 2, Final.
	result := 39;
	Exit;
  end;
  if (* Engine.QuestStatus(Quest3Id, 32) *) true 
  and (Inventory.Quest.ById(7594, oItem))  then begin 
	result := 38;
	Exit;
  end;
  if (* Engine.QuestStatus(Quest3Id, 32) *) true 
  and (Inventory.Quest.ById(7593, oItem) or (Inventory.Quest.ById(21725, oItem) and (oItem.Count >= 100)))
	then begin 
	result := 37;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest3Id, 32) *) true 
  //and (Inventory.Quest.ById(7592, oItem)) 
  //and (Inventory.Quest.ById(7591, oItem))
  and IsInDB('Ossian1')  then begin 
	result := 36;
	Exit;
  end; 
  
  if (Inventory.Quest.ById(7592, oItem)) 
  and (Inventory.Quest.ById(7591, oItem)) then begin 
	result := 35;
	Exit;
  end; 
   
  
  if Engine.QuestStatus(Quest3Id, 2)then begin 
	result := 34;
	Exit;
  end;
  
  if Engine.QuestStatus(Quest3Id, 1)then begin 
	result := 33;
	Exit;
  end;
 
  if (Inventory.Quest.ById(7678, oItem)) or (Inventory.User.ById(7678, oItem)) then begin //Caradine's Letter, 1
	result := 32;
	Exit;
  end; 
  
  if (* Engine.QuestStatus(Quest2Id, 32) *) true 
  and IsInDB('Unicorn') then begin 
	result := 31;
	Exit;
  end;
 
  if (* Engine.QuestStatus(Quest2Id, 32) *) true  
  and (Inventory.Quest.ById(7595, oItem)) 
  and (oItem.Count >= 4) then begin 
	result := 30;
	Exit;
  end; 
  
  if (* Engine.QuestStatus(Quest2Id, 32) *) true 
  and IsInDB('Kalis2') then begin 
	result := 29;
	Exit;
  end;
 
  if (* Engine.QuestStatus(Quest2Id, 32) *) true 
  and (Inventory.Quest.ById(7596, oItem)) then begin 
	result := 28;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest2Id, 32) *) true 
  and IsInDB('Kalis1') then begin 
	result := 27;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest2Id, 32) *) true 
  and (Inventory.Quest.ById(7590, oItem))
  and IsInDB('DarkKnight2') then begin 
	result := 26;
	Exit;
  end;
 
  if (* Engine.QuestStatus(Quest2Id, 32) *) true 
  and (Inventory.Quest.ById(7590, oItem)) then begin 
	result := 25;
	Exit;
  end;
 
  if (* Engine.QuestStatus(Quest2Id, 32) *) true 
  and IsInDB('DarkKnight1') then begin 
	result := 24;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest2Id, 32) *) true 
  and IsInDB('Ogmar2') then begin 
	result := 23;
	Exit;
  end;
  
  if Engine.QuestStatus(Quest2Id, 2)then begin 
	result := 22;
	Exit;
  end; 

  if Engine.QuestStatus(Quest2Id, 1)then begin 
	result := 21;
	Exit;
  end;  
  
  if (Inventory.Quest.ById(7677, oItem))
  or (Inventory.User.ById(7677, oItem)) then begin 
	result := 20;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true    
  and IsInDB('Caradine1') then begin 
	result := 19;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true     
  and IsInDB('Virgil2') then begin 
	result := 18;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true    
  and IsInDB('Kassandra1') then begin 
	result := 17;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true    
  and (Inventory.Quest.ById(7599, oItem)) then begin 
	result := 16;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true    
  and (Inventory.Quest.ById(7598, oItem))
  and (oItem.Count >= 5) then begin 
	result := 15;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true    
  and IsInDB('Rahorakti1') then begin 
	result := 14;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true     
  and IsInDB('Ogmar1') then begin 
	result := 13;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true     
  and IsInDB('Virgil1') then begin 
	result := 12;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true     
  and IsInDB(Talien2Message) then begin 
	result := 11;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true     
  and (Inventory.Quest.ById(7588, oItem)) then begin 
	result := 10;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true    
  and IsInDB(Talien1Message) then begin 
	result := 9;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true    
  and (Inventory.Quest.ById(7589, oItem)) then begin 
	result := 8;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true    
  and (Inventory.Quest.ById(7597, oItem))
  and (oItem.Count >= 10) then begin 
	result := 7;
	Exit;
  end;
  
  if (* Engine.QuestStatus(Quest1Id, 32) *) true 
  and IsInDB(Melody1Message) then begin 
	result := 6;
	Exit;
  end;
  
  if Engine.QuestStatus(Quest1Id, 1) then result := 1;
  if Engine.QuestStatus(Quest1Id, 2) and not (IsInDB('qStage3')) then result := 2;
  //if Engine.QuestStatus(Quest1Id, 32) and not (Inventory.Quest.ById(7587, oItem)) and not IsInDB(BarahamMessage) then result := 3;
  
  if IsInDB('qStage3')
  and not (Inventory.Quest.ById(7587, oItem)) 
  and not IsInDB(BarahamMessage) then result := 3;
  
  if (* Engine.QuestStatus(Quest1Id, 3) and *) (Inventory.Quest.ById(7587, oItem)) then begin
	if not (IsInDB(BarahamMessage)) then WriteToDB(BarahamMessage);
	result := 4;
  end;
  if (* Engine.QuestStatus(Quest1Id, 32) and *) not (Inventory.Quest.ById(7587, oItem)) and IsInDB(BarahamMessage) then result := 5;
  
  
  (*
  for i := 0 to 300 do begin
    if (Engine.QuestStatus(QuestId, i)) then begin
	  result := i;
	  exit;
	end;
  end;
  *)
end;

function GetServerName: string;
begin
  result := 'Lionna';
end;

function GetNumberOfNpcsAroundWithID(NpcID: Integer): Integer;
var
i, nCounter: Integer;
oTarget: Tl2Live;
begin
  nCounter := 0;
  for i := 0 to NpcList.Count - 1 do begin
    oTarget := NpcList.Items(i);
	if not (oTarget.ID = NpcID) then Continue;
	Inc(nCounter);
  end;
  result := nCounter;
end;

function MoveToRuneBalconyFromRuneGk(): void;
begin
  MoveToRuneTempleGkFromRuneGk;
  LeadDlg(31699, 1, 1);
  Delay(500);
  Engine.ConfirmDialog(True);
Engine.MoveTo(38253, -48120, 912);
Engine.MoveTo(37978, -48216, 912);
Engine.MoveTo(37565, -48216, 912);
Engine.MoveTo(37020, -48196, 912);
Engine.MoveTo(36568, -48168, 912);
Engine.MoveTo(36188, -47909, 912);
Engine.MoveTo(35912, -47672, 912);
Engine.MoveTo(35912, -47202, 1021);
Engine.MoveTo(35864, -46920, 1088);
Engine.MoveTo(35080, -46920, 1376);
Engine.MoveTo(34920, -46952, 1408);
Engine.MoveTo(34907, -47197, 1464);
Engine.MoveTo(34894, -47741, 1623);
Engine.MoveTo(34904, -48072, 1720);
Engine.MoveTo(34808, -48216, 1728);
Engine.MoveTo(34630, -48223, 1752);
Engine.MoveTo(34408, -48232, 1784);
Engine.MoveTo(33883, -48202, 1792);
Engine.MoveTo(33267, -48205, 1792);
Engine.MoveTo(33000, -48216, 1792);
end;

function MoveToLaddFromIvoryGk: void;
begin
  LeadDlg(30727, 3, 4);
  Engine.ConfirmDialog(True);
  Delay(2000);
  Engine.MoveTo(85208, 16104, -1760);
  Engine.MoveTo(85016, 16008, -1760);
end;

function MoveToRuneMagicGuildFromRuneGk(): void;
begin
  MoveToRuneTempleGkFromRuneGk;
 Engine.MoveTo(38216, -48216, -1136);
 Engine.MoveTo(37768, -48392, -1136);
 Engine.MoveTo(37384, -48632, -1112);
 Engine.MoveTo(37336, -48792, -1112);
 Engine.MoveTo(37336, -48952, -1112);
 Engine.MoveTo(37336, -49255, -1112);
 Engine.MoveTo(37512, -49416, -1112);
 Engine.MoveTo(37759, -49399, -1112);
 Engine.MoveTo(38099, -49323, -1112);
 Engine.MoveTo(38344, -49272, -1112);
end;

function MoveToRuneTempleGkFromRuneGk(): Void;
begin
Engine.MoveTo(43896, -49160, -776);
Engine.MoveTo(43679, -48533, -784);
Engine.MoveTo(43409, -48267, -784);
Engine.MoveTo(42983, -48248, -781);
Engine.MoveTo(41728, -48246, -780);
Engine.MoveTo(40978, -48248, -773);
Engine.MoveTo(40444, -48243, -752);
Engine.MoveTo(39826, -48232, -784);
Engine.MoveTo(39489, -48235, -782);
Engine.MoveTo(39167, -48238, -882);
Engine.MoveTo(38405, -48163, -1122);
Engine.MoveTo(38328, -48088, -1136);
end;

function MoveToTalienFromAdenSpawn: void;
begin
Engine.MoveTo(147480, 26776, -2192);
Engine.MoveTo(147560, 26424, -2144);
Engine.MoveTo(147736, 26344, -2112);
end;

function MoveToGabrielleFromGiranSpawn: void;
begin
Engine.MoveTo(82984, 148760, -3456);
Engine.MoveTo(82264, 149368, -3456);
Engine.MoveTo(81752, 149464, -3456);
Engine.MoveTo(81288, 149656, -3448);
Engine.MoveTo(81288, 149688, -3448);
end;

function MoveToBarahamFromBeehiveSpawn: void;
begin
CMoveTo(33896, 187384, -3248);
CMoveTo(33455, 187248, -3249);
CMoveTo(33019, 187196, -3213);
CMoveTo(32483, 187171, -3202);
CMoveTo(32114, 187157, -3205);
CMoveTo(31733, 187160, -3210);
CMoveTo(31245, 187152, -3284);
CMoveTo(30753, 187112, -3377);
CMoveTo(30163, 187052, -3559);
CMoveTo(29259, 187109, -3655);
CMoveTo(28802, 187437, -3631);
CMoveTo(28350, 187589, -3599);
CMoveTo(27825, 187552, -3561);
CMoveTo(27303, 187337, -3521);
CMoveTo(26808, 187054, -3520);
CMoveTo(26347, 186815, -3510);
CMoveTo(25905, 186684, -3481);
CMoveTo(24984, 186534, -3447);
CMoveTo(24425, 186565, -3418);
CMoveTo(23758, 186546, -3500);
CMoveTo(23215, 186456, -3481);
CMoveTo(22643, 186477, -3392);
CMoveTo(22200, 186560, -3443);
CMoveTo(21711, 186658, -3359);
CMoveTo(20878, 186706, -3336);
CMoveTo(20334, 186580, -3344);
CMoveTo(20025, 186111, -3344);
CMoveTo(19901, 185833, -3356);
CMoveTo(19752, 185560, -3352);
CMoveTo(19880, 185384, -3336);
CMoveTo(20098, 185219, -3336);
CMoveTo(20449, 184989, -3336);
CMoveTo(20856, 184728, -3336);
end;

function MoveToMelodyMaestroFromHeineSpawn: void;
begin
CMoveTo(110816, 219092, -3520);
CMoveTo(110513, 219079, -3497);
CMoveTo(110120, 218984, -3456);
CMoveTo(110086, 218627, -3506);
CMoveTo(110077, 218318, -3530);
CMoveTo(110076, 217944, -3565);
CMoveTo(110060, 217635, -3614);
CMoveTo(110056, 217368, -3728);
CMoveTo(109992, 217272, -3728);
CMoveTo(109671, 217371, -3723);
CMoveTo(109372, 217476, -3723);
CMoveTo(109050, 217531, -3711);
CMoveTo(108615, 217541, -3683);
CMoveTo(108020, 217557, -3665);
CMoveTo(107766, 217569, -3659);
CMoveTo(107525, 217804, -3656);
CMoveTo(107272, 218040, -3656);
CMoveTo(107144, 218008, -3656);
CMoveTo(107112, 217736, -3576);
CMoveTo(107112, 217343, -3576);
CMoveTo(106984, 217000, -3576);
end;

function MoveToWatchTombFromDV: void;
begin
CMoveTo(72888, 118104, -3688);
CMoveTo(72646, 117605, -3674);
CMoveTo(72409, 117107, -3664);
CMoveTo(72321, 116767, -3667);
CMoveTo(72229, 116286, -3683);
CMoveTo(72043, 115706, -3698);
CMoveTo(71661, 114697, -3712);
CMoveTo(71443, 113624, -3712);
CMoveTo(71395, 113031, -3696);
CMoveTo(71366, 112152, -3699);
CMoveTo(71409, 111572, -3712);
CMoveTo(71391, 110687, -3712);
CMoveTo(71306, 109883, -3710);
CMoveTo(71236, 108959, -3700);
CMoveTo(71206, 107946, -3701);
CMoveTo(71243, 107018, -3691);
CMoveTo(71271, 106297, -3690);
CMoveTo(71295, 105524, -3688);
CMoveTo(71369, 104638, -3644);
CMoveTo(71532, 103697, -3667);
CMoveTo(71496, 103012, -3690);
CMoveTo(71496, 102680, -3704);
CMoveTo(71940, 101835, -3702);
CMoveTo(72046, 101394, -3693);
CMoveTo(72145, 100905, -3675);
CMoveTo(72388, 100657, -3620);
CMoveTo(72740, 100466, -3570);
CMoveTo(73221, 100280, -3334);
CMoveTo(73564, 100330, -3170);
CMoveTo(73980, 100361, -3099);
CMoveTo(74484, 100605, -3095);
CMoveTo(74756, 101113, -3058);
CMoveTo(74887, 101728, -3018);
CMoveTo(75053, 102174, -2947);
CMoveTo(75240, 102552, -2896);
CMoveTo(75413, 103234, -2896);
CMoveTo(75547, 104203, -2874);
CMoveTo(75566, 105084, -2827);
CMoveTo(75608, 105608, -2800);
end;

function MoveToStedmielFromHunterSpawn: void;
begin
Engine.MoveTo(116876, 76288, -2720);
Engine.MoveTo(117301, 76252, -2706);
Engine.MoveTo(117689, 76192, -2683);
Engine.MoveTo(118091, 76174, -2666);
Engine.MoveTo(118449, 76247, -2637);
Engine.MoveTo(118947, 76414, -2502);
Engine.MoveTo(119335, 76515, -2355);
Engine.MoveTo(119640, 76664, -2256);
Engine.MoveTo(119619, 76805, -2256);
Engine.MoveTo(119394, 76900, -2256);
Engine.MoveTo(119276, 77185, -2248);
Engine.MoveTo(119480, 77368, -2224);
Engine.MoveTo(119864, 77304, -2224);
end;

function MoveToTaikOrcsFromCemetarySpawn: void;
begin
CMoveTo(172206, 20180, -3312);
CMoveTo(172419, 20100, -3312);
CMoveTo(172686, 20197, -3295);
CMoveTo(173064, 20328, -3232);
CMoveTo(173486, 20331, -3232);
CMoveTo(174032, 20331, -3232);
CMoveTo(174518, 20336, -3232);
CMoveTo(175170, 20282, -3228);
CMoveTo(175552, 20203, -3231);
CMoveTo(175809, 20310, -3232);
CMoveTo(176199, 20344, -3232);
CMoveTo(176939, 20344, -3232);
CMoveTo(177593, 20344, -3232);
CMoveTo(178226, 20344, -3232);
CMoveTo(178488, 20216, -3224);
CMoveTo(178496, 19768, -3232);
CMoveTo(178532, 19296, -3220);
CMoveTo(178556, 18748, -3232);
CMoveTo(178565, 18116, -3232);
CMoveTo(178968, 17832, -3152);
CMoveTo(179112, 17736, -3152);
end;

function MoveToCaradineFromGoddardGk: void;
begin
Engine.MoveTo(147745, -56796, -2768);
Engine.MoveTo(147726, -57246, -2806);
Engine.MoveTo(147723, -57530, -2827);
Engine.MoveTo(147814, -58127, -2941);
Engine.MoveTo(148139, -58278, -2960);
Engine.MoveTo(148541, -58216, -2960);
Engine.MoveTo(149001, -58098, -2960);
Engine.MoveTo(149361, -58015, -2960);
Engine.MoveTo(149699, -57941, -2960);
Engine.MoveTo(150084, -57880, -2960);
Engine.MoveTo(150184, -57896, -2960);
end;

function MoveToDevilPassFromSwampOfScreamSpawn: void;
begin
Engine.MoveTo(93288, -58472, -2801);
Engine.MoveTo(94348, -59197, -2603);
Engine.MoveTo(94709, -59561, -2481);
Engine.MoveTo(94907, -60048, -2447);
Engine.MoveTo(94968, -60632, -2464);
Engine.MoveTo(94984, -60728, -2480);
if not (GetName_Server = 'Idle') then
	exit;
// more points for alternate location
Engine.MoveTo(94984, -60728, -2488);
Engine.MoveTo(96169, -60698, -2528);
Engine.MoveTo(96837, -60505, -2536);
Engine.MoveTo(97097, -60216, -2472);
end;

function MoveToWitchKalisFromIvory: void;
begin
CMoveTo(85400, 16392, -3648);
CMoveTo(85352, 16520, -3616);
CMoveTo(85334, 16739, -3588);
CMoveTo(85309, 17503, -3556);
CMoveTo(85320, 18053, -3517);
CMoveTo(85347, 19594, -3586);
CMoveTo(85380, 20929, -3676);
CMoveTo(85400, 21911, -3542);
CMoveTo(85406, 22956, -3520);
CMoveTo(85480, 24104, -3616);
CMoveTo(86168, 24440, -3576);
CMoveTo(87213, 24142, -3518);
CMoveTo(87670, 24055, -3503);
CMoveTo(88048, 23989, -3504);
CMoveTo(88841, 23828, -3546);
CMoveTo(89773, 23642, -3584);
CMoveTo(90232, 23528, -3584);
CMoveTo(90690, 23547, -3603);
CMoveTo(91312, 23422, -3548);
CMoveTo(92406, 23181, -3358);
CMoveTo(93089, 23022, -3246);
CMoveTo(93737, 23040, -3172);
CMoveTo(94284, 23020, -3064);
CMoveTo(94618, 22963, -3011);
CMoveTo(94825, 22833, -2966);
CMoveTo(95191, 22558, -2921);
CMoveTo(95464, 22312, -2880);
CMoveTo(95384, 22184, -2864);
end;

function MoveToMatildFromIvory: void;
begin
CMoveTo(85256, 16392, -3648);
CMoveTo(85317, 16709, -3605);
CMoveTo(85329, 17228, -3553);
CMoveTo(85318, 17922, -3507);
CMoveTo(85331, 19205, -3570);
CMoveTo(85310, 20204, -3746);
CMoveTo(85286, 21005, -3715);
CMoveTo(85282, 21912, -3556);
CMoveTo(85245, 22833, -3512);
CMoveTo(85210, 23565, -3551);
CMoveTo(85176, 24104, -3616);
CMoveTo(84696, 24008, -3568);
CMoveTo(84488, 24232, -3544);
CMoveTo(83769, 24248, -3542);
CMoveTo(83272, 24200, -3512);
CMoveTo(82522, 24054, -3514);
CMoveTo(81774, 23894, -3509);
CMoveTo(80592, 23552, -3547);
CMoveTo(79505, 22961, -3557);
CMoveTo(78954, 22823, -3539);
CMoveTo(78209, 22564, -3488);
CMoveTo(77239, 22006, -3522);
CMoveTo(76212, 21410, -3609);
CMoveTo(75506, 21191, -3690);
CMoveTo(74936, 21224, -3680);
CMoveTo(73048, 21080, -3712);
CMoveTo(72568, 20595, -3688);
CMoveTo(71915, 20006, -3671);
CMoveTo(71237, 19279, -3610);
CMoveTo(70569, 18702, -3609);
CMoveTo(70201, 18369, -3616);
CMoveTo(69864, 18120, -3648);
end;

function MoveToValleyOfSaintsCaveFromVoSSpwn: void;
begin
CMoveTo(67656, -71768, -3792);
CMoveTo(68063, -71053, -3780);
CMoveTo(68893, -70423, -3699);
CMoveTo(69374, -69817, -3654);
CMoveTo(69948, -69422, -3637);
CMoveTo(70559, -69254, -3644);
CMoveTo(70994, -69327, -3632);
CMoveTo(71403, -69371, -3632);
CMoveTo(72047, -69533, -3629);
CMoveTo(73139, -69666, -3648);
CMoveTo(73616, -69594, -3721);
CMoveTo(74267, -69638, -3804);
CMoveTo(75112, -69811, -3727);
CMoveTo(75956, -70009, -3608);
CMoveTo(76954, -70259, -3476);
CMoveTo(77612, -70482, -3411);
CMoveTo(78088, -70626, -3399);
CMoveTo(78807, -70832, -3399);
CMoveTo(79441, -71032, -3457);
CMoveTo(80009, -71174, -3472);
CMoveTo(80584, -71343, -3423);
CMoveTo(81191, -71544, -3422);
CMoveTo(82036, -71859, -3488);
CMoveTo(82533, -72038, -3488);
CMoveTo(83173, -72306, -3488);
CMoveTo(83723, -72600, -3512);
CMoveTo(84332, -73049, -3505);
CMoveTo(84821, -73340, -3560);
CMoveTo(85289, -73533, -3598);
CMoveTo(85764, -73615, -3571);
CMoveTo(86317, -73781, -3588);
CMoveTo(87018, -74096, -3543);
CMoveTo(87499, -74302, -3510);
CMoveTo(87816, -74424, -3488);
CMoveTo(87678, -74605, -3485);
CMoveTo(87381, -74936, -3480);
CMoveTo(86886, -75449, -3480);
CMoveTo(86504, -75752, -3464);

end;

function MoveToValleyOfSaints100QiFromVoSSpwn: void;
begin
CMoveTo(67128, -71928, -3840);
CMoveTo(67640, -73608, -3680);
CMoveTo(67844, -74009, -3685);
CMoveTo(68116, -74600, -3704);
CMoveTo(68366, -75111, -3708);
CMoveTo(68633, -75679, -3727);
CMoveTo(68907, -76220, -3744);
CMoveTo(69163, -76684, -3800);
CMoveTo(69396, -77078, -3844);
CMoveTo(69678, -77447, -3951);
CMoveTo(69954, -77854, -3955);
CMoveTo(70120, -78193, -3943);
CMoveTo(70321, -78520, -3826);
CMoveTo(70611, -78921, -3621);
CMoveTo(70893, -79402, -3398);
CMoveTo(71116, -79866, -3262);
CMoveTo(71348, -80330, -3209);
CMoveTo(71558, -80636, -3204);
CMoveTo(71758, -80943, -3216);
CMoveTo(72192, -81251, -3236);
CMoveTo(72565, -81458, -3216);
CMoveTo(72987, -81801, -3279);
CMoveTo(73514, -82409, -3449);
CMoveTo(73919, -82831, -3512);
CMoveTo(74146, -83125, -3528);
CMoveTo(74336, -83572, -3554);
CMoveTo(74420, -83968, -3560);
CMoveTo(74431, -84539, -3511);
CMoveTo(74481, -85065, -3459);
CMoveTo(74644, -85555, -3381);
CMoveTo(74816, -85997, -3299);
CMoveTo(74976, -86525, -3240);
CMoveTo(75088, -86912, -3199);
CMoveTo(75230, -87373, -3145);
CMoveTo(75389, -87828, -3139);
CMoveTo(75495, -88421, -3167);
CMoveTo(75479, -88725, -3182);
CMoveTo(75486, -88985, -3165);
CMoveTo(75539, -89407, -3120);
CMoveTo(75689, -89695, -3118);
CMoveTo(76032, -89904, -3120);
CMoveTo(76546, -90133, -3120);
CMoveTo(77361, -90480, -3120);
CMoveTo(77925, -91138, -3217);
CMoveTo(78485, -91920, -3261);
CMoveTo(78889, -91946, -3202);
CMoveTo(79295, -91912, -3156);
CMoveTo(79716, -91796, -3102);
CMoveTo(80220, -91671, -3117);
CMoveTo(80716, -91498, -3091);
CMoveTo(81140, -91352, -3071);
CMoveTo(81631, -91200, -3072);
CMoveTo(82113, -90998, -3047);
CMoveTo(82679, -90855, -3008);
CMoveTo(83188, -90813, -2889);
CMoveTo(83626, -90782, -2818);
CMoveTo(84016, -90645, -2761);
CMoveTo(84401, -90415, -2741);
CMoveTo(84830, -90103, -2706);
CMoveTo(85064, -90008, -2704);
end;



function GetArea(): Integer;
begin
  if (User.InRange(33000, -48216, 1792, 700)) then result := 10;
  if (User.InRange(75608, 105608, -2800, 20000)) then result := 11;
  if (User.InRange(150184, -57896, -2960, 500)) then result := 12;
  if (User.InRange(94984, -60728, -2480, 500)) or (User.DistTo(97097, -60216, -2472) < 500) then result := 13;
  if (User.InRange(86504, -75752, -3464, 2000)) then result := 14;
  if (User.InRange(106984, 217000, -3592, 300)) then result := 15; //Heine - grocery - melody maestro
end;


function IsUnderAttack: Boolean; overload;
var
i:Integer;
oTarget: Tl2Npc;
begin
  result := false;
  
  if (User.Dead) then Engine.GoHome;
  
  for i := 0 to NpcList.Count -1 do begin
    oTarget := NpcList.Items(i);
	if (User.DistTo(oTarget) < 800) 
	and (oTarget.InCombat)
	and IsNpcValid(oTarget) then begin
	  //print(User.DistTo(NpcList.Items(i)));
	  //Print('Mob Attacking us: ' + NpcList.Items(i).Name);
	  result := true;
	  Exit;
	end;
  end;
end;



function IsNpcValid(oTarget: Tl2Live): Boolean;
begin  
  result := false;

  if not (oTarget = nil)
  and not (oTarget.Dead)
  and (oTarget.Attackable)
  and (User.DistTo(oTarget) < 1500) then begin	
    result := true;
	Exit;
  end;  
end;




function SplendorSearchMoveTo(x, y, z:Integer): Boolean;
var
i, z1, z2: Integer;
oTarget: Tl2Live;
oItem: Tl2Item;
HasItem1, HasItem2: boolean;
begin
	result := false;
  HasItem1 := Inventory.Quest.ByID(7592, oItem);
  HasItem2 := Inventory.Quest.ByID(7591, oItem);
  
  if (User.Dead) then begin
    result := false;
	exit;
  end;
  
  if HasItem1 and HasItem2 then begin
    result := true;
	Exit;
  end;
  
  for i := 0 to NpcList.Count - 1 do begin
    oTarget := NpcList.Items(i);
	if (oTarget = nil) then continue;
	if (User.DistTo(oTarget) > 2000) then break;
	z1 := User.Z;
	z2 := oTarget.Z;
	if (abs(z2 - z1) > 200) then continue;
	if ((oTarget.ID = 21544) and not HasItem1)
	or ((oTarget.ID = 21541) and not HasItem2) then begin
	  KillMob(oTarget);
	  break;
	end;
  end;
  
  CMoveTo(x, y, z);
  result := (Inventory.Quest.ByID(7592, oItem) and Inventory.Quest.ByID(7591, oItem));
end;

function SearchForSplendors: Void;
begin
  SplendorSearchMoveTo(67128, -71928, -3840);
SplendorSearchMoveTo(67640, -73608, -3680);
SplendorSearchMoveTo(67844, -74009, -3685);
SplendorSearchMoveTo(68116, -74600, -3704);
SplendorSearchMoveTo(68366, -75111, -3708);
SplendorSearchMoveTo(68633, -75679, -3727);
SplendorSearchMoveTo(68907, -76220, -3744);
SplendorSearchMoveTo(69163, -76684, -3800);
SplendorSearchMoveTo(69396, -77078, -3844);
SplendorSearchMoveTo(69678, -77447, -3951);
SplendorSearchMoveTo(69954, -77854, -3955);
SplendorSearchMoveTo(70120, -78193, -3943);
SplendorSearchMoveTo(70321, -78520, -3826);
SplendorSearchMoveTo(70611, -78921, -3621);
SplendorSearchMoveTo(70893, -79402, -3398);
SplendorSearchMoveTo(71116, -79866, -3262);
SplendorSearchMoveTo(71348, -80330, -3209);
SplendorSearchMoveTo(71558, -80636, -3204);
SplendorSearchMoveTo(71758, -80943, -3216);
SplendorSearchMoveTo(72192, -81251, -3236);
SplendorSearchMoveTo(72565, -81458, -3216);
SplendorSearchMoveTo(72987, -81801, -3279);
SplendorSearchMoveTo(73514, -82409, -3449);
SplendorSearchMoveTo(73919, -82831, -3512);
SplendorSearchMoveTo(74146, -83125, -3528);
SplendorSearchMoveTo(74336, -83572, -3554);
SplendorSearchMoveTo(74420, -83968, -3560);
SplendorSearchMoveTo(74431, -84539, -3511);
SplendorSearchMoveTo(74481, -85065, -3459);
SplendorSearchMoveTo(74644, -85555, -3381);
SplendorSearchMoveTo(74816, -85997, -3299);
SplendorSearchMoveTo(74976, -86525, -3240);
SplendorSearchMoveTo(75088, -86912, -3199);
SplendorSearchMoveTo(75230, -87373, -3145);
SplendorSearchMoveTo(75389, -87828, -3139);
SplendorSearchMoveTo(75495, -88421, -3167);
SplendorSearchMoveTo(75479, -88725, -3182);
SplendorSearchMoveTo(75486, -88985, -3165);
SplendorSearchMoveTo(75539, -89407, -3120);
SplendorSearchMoveTo(75689, -89695, -3118);
SplendorSearchMoveTo(76032, -89904, -3120);
SplendorSearchMoveTo(76546, -90133, -3120);
SplendorSearchMoveTo(77361, -90480, -3120);
SplendorSearchMoveTo(77925, -91138, -3217);
SplendorSearchMoveTo(78485, -91920, -3261);
SplendorSearchMoveTo(78889, -91946, -3202);
SplendorSearchMoveTo(79295, -91912, -3156);
SplendorSearchMoveTo(79716, -91796, -3102);
SplendorSearchMoveTo(80220, -91671, -3117);
SplendorSearchMoveTo(80716, -91498, -3091);
SplendorSearchMoveTo(81140, -91352, -3071);
SplendorSearchMoveTo(81631, -91200, -3072);
SplendorSearchMoveTo(82113, -90998, -3047);
SplendorSearchMoveTo(82679, -90855, -3008);
SplendorSearchMoveTo(83188, -90813, -2889);
SplendorSearchMoveTo(83626, -90782, -2818);
SplendorSearchMoveTo(84016, -90645, -2761);
SplendorSearchMoveTo(84401, -90415, -2741);
SplendorSearchMoveTo(84830, -90103, -2706);
SplendorSearchMoveTo(85064, -90008, -2704);
//At farm spot 100QI
SplendorSearchMoveTo(85717, -89827, -2742);
SplendorSearchMoveTo(86760, -89288, -2720);
SplendorSearchMoveTo(87269, -89182, -2724);
SplendorSearchMoveTo(87939, -89019, -2721);
SplendorSearchMoveTo(88184, -88792, -2720);
SplendorSearchMoveTo(88108, -88606, -2736);
SplendorSearchMoveTo(88097, -87971, -2752);
SplendorSearchMoveTo(88478, -87610, -2753);
SplendorSearchMoveTo(88976, -87051, -2752);
SplendorSearchMoveTo(89111, -86476, -2742);
SplendorSearchMoveTo(88741, -86174, -2766);
SplendorSearchMoveTo(88221, -86312, -2836);
SplendorSearchMoveTo(87727, -86405, -2915);
SplendorSearchMoveTo(86932, -86418, -3089);
SplendorSearchMoveTo(86256, -86021, -3314);
SplendorSearchMoveTo(85912, -85656, -3504);
   SplendorSearchMoveTo(85378, -85330, -3520);
   SplendorSearchMoveTo(84753, -85066, -3543);
   SplendorSearchMoveTo(83903, -84884, -3543);
   SplendorSearchMoveTo(83183, -85112, -3513);
   SplendorSearchMoveTo(82652, -85595, -3527);
   SplendorSearchMoveTo(82035, -86395, -3574);
   SplendorSearchMoveTo(81471, -86943, -3556);
  SplendorSearchMoveTo(80528, -87710, -3538);
  SplendorSearchMoveTo(80015, -88246, -3501);
  SplendorSearchMoveTo(79517, -88284, -3531);
  SplendorSearchMoveTo(79153, -87957, -3558);
  SplendorSearchMoveTo(78851, -87518, -3586);
  SplendorSearchMoveTo(78627, -87167, -3614);
  SplendorSearchMoveTo(78328, -86664, -3552);
  
end;

function WriteToDB(sMessage : string): void;
var
ErrorStringList: TStringList;
StandardText, fileName : string;
begin
	fileName := 'AutoNobless_DB_' + User.Name + '.txt';
	ErrorStringList := TStringList.Create;
	
    if (fileexists(fileName)) then
		ErrorStringList.LoadFromFile(fileName);  
  
  
  
  StandardText := User.Name;
  
  ErrorStringList.Add(StandardText + ' ' + sMessage);
  ErrorStringList.SaveToFile(fileName);
  
  ErrorStringList.Free();
end;

function IsInDB(word: string): Boolean;
var
DbWordList: TStringList;
SearchWord, fileName: string;
begin
	result := false;
  
	DbWordList := TStringList.Create();
	fileName := 'AutoNobless_DB_' + User.Name + '.txt';
	if (fileexists(fileName)) then
		DbWordList.LoadFromFile(fileName);

	SearchWord := User.Name + ' ' + word;
  
	if not (DbWordList.IndexOf(SearchWord) = -1) then result := true;
  
	DbWordList.Free;
end;


function ComTalk(Word: string): Void;
begin
  Engine.BypassToServer(Word);
  Delay(800+Random(200));
end;

function LeadDlg( TargetID: Integer;
                  Ans1: Integer = 1;
                  Ans2: Integer = -1;
                  Ans3: Integer = -1;
                  Ans4: Integer = -1;
                  Ans5: Integer = -1;
                  Ans6: Integer = -1): Boolean;
//checked
var
obj : Tl2Spawn;
b1, b2, b3, b4, b5, b6: Boolean;
begin
	b1 := true;
	b2 := true;
	b3 := true;
	b4 := true;
	b5 := true;
	b6 := true;
	result := false;


	b1 := npclist.byid(TargetID, obj);
	if (User.Distto(obj) <= 600) then begin
		Engine.CancelTarget;
		Engine.SetTarget(TargetID);
		if (User.DistTo(obj) > 100) then
			Engine.MoveToTarget(-100);  
		Delay(500);
		Engine.DlgOpen;
		Delay(1000);
		if not(Ans1 = -1)then begin
			b1 := Engine.DlgSel(Ans1); 
			Delay(1000);
		end;
		if not(Ans2 = -1)then begin
			b2 := Engine.DlgSel(Ans2); 
			Delay(1000);
		end;
		if not(Ans3 = -1)then begin
			b3 := Engine.DlgSel(Ans3); 
			Delay(1000);
		end;
		if not(Ans4 = -1)then begin
			b4 := Engine.DlgSel(Ans4); 
			Delay(1000);
		end;
		if not(Ans5 = -1)then begin
			b5 := Engine.DlgSel(Ans5); 
			Delay(1000);
		end;
		if not(Ans6 = -1)then begin
			b6 := Engine.DlgSel(Ans6); 
			Delay(1000);
		end; 
		result := b1 and b2 and b3 and b4 and b5 and b6;
	end else begin
		Print('Conversation: Target npc not in range');
	end;
end;

function LeadDlgByObj( oTarget: Tl2Live;
                  Ans1: Integer = 1;
                  Ans2: Integer = -1;
                  Ans3: Integer = -1;
                  Ans4: Integer = -1;
                  Ans5: Integer = -1;
                  Ans6: Integer = -1): void;
//checked
var
obj : Tl2Spawn;
begin
if (User.Distto(oTarget) <= 600) then begin
  Engine.CancelTarget;
  Engine.SetTarget(oTarget);
  if (User.DistTo(obj) > 100) then
    Engine.MoveToTarget(-100); 
  Delay(500);
  Engine.DlgOpen;
  Delay(1000);
  if not(Ans1 = -1)then begin
    Engine.DlgSel(Ans1); 
    Delay(1000);
  end;
  if not(Ans2 = -1)then begin
    Engine.DlgSel(Ans2); 
    Delay(1000);
  end;
  if not(Ans3 = -1)then begin
    Engine.DlgSel(Ans3); 
    Delay(1000);
  end;
  if not(Ans4 = -1)then begin
    Engine.DlgSel(Ans4); 
    Delay(1000);
  end;
  if not(Ans5 = -1)then begin
    Engine.DlgSel(Ans5); 
    Delay(1000);
  end;
  if not(Ans6 = -1)then begin
    Engine.DlgSel(Ans6); 
    Delay(1000);
  end; 
end else begin
  Print('Conversation: Target npc not in range');
end;
end;


function qLeadDlg( TargetID: Integer;
                  Ans1: Integer;
                  Ans2: string;
                  Ans3: Integer = -1;
                  Ans4: Integer = -1;
                  Ans5: Integer = -1;
                  Ans6: Integer = -1): Boolean;
//checked
var
obj : Tl2Spawn;
b1, b2, b3, b4, b5, b6: Boolean;
begin
	b1 := true;
	b2 := true;
	b3 := true;
	b4 := true;
	b5 := true;
	b6 := true;
	result := false;


	b1 := npclist.byid(TargetID, obj);
	if (User.Distto(obj) <= 600) then begin
		Engine.CancelTarget;
		Engine.SetTarget(TargetID);
		if (User.DistTo(obj) > 100) then
			Engine.MoveToTarget(-100);  
		Delay(500);
		Engine.DlgOpen;
		Delay(1000);
		
		b1 := Engine.DlgSel(Ans1); 
		Delay(1000);
		if not b1 then print('qLeadDlg: for npc id = ' + IntToStr(TargetID) + '. Ans1 failed.');
			
		b2 := Engine.DlgSel(Ans2); 
		Delay(1000);
		if not b2 then print('qLeadDlg: for npc id = ' + IntToStr(TargetID) + '. Ans2 failed.');
			
		if not(Ans3 = -1)then begin
			b3 := Engine.DlgSel(Ans3); 
			Delay(1000);
			if not b3 then print('qLeadDlg: for npc id = ' + IntToStr(TargetID) + '. Ans3 failed.');
		end;
		if not(Ans4 = -1)then begin
			b4 := Engine.DlgSel(Ans4); 
			Delay(1000);
			if not b4 then print('qLeadDlg: for npc id = ' + IntToStr(TargetID) + '. Ans4 failed.');
		end;
		if not(Ans5 = -1)then begin
			b5 := Engine.DlgSel(Ans5); 
			Delay(1000);
			if not b5 then print('qLeadDlg: for npc id = ' + IntToStr(TargetID) + '. Ans5 failed.');
		end;
		if not(Ans6 = -1)then begin
			b6 := Engine.DlgSel(Ans6); 
			Delay(1000);
			if not b6 then print('qLeadDlg: for npc id = ' + IntToStr(TargetID) + '. Ans6 failed.');
		end; 
		result := b1 and b2 and b3 and b4 and b5 and b6;
	end else begin
		Print('Conversation: Target npc not in range');
	end;
end;

function GetListOfNpcsByIdOfCount(NpcId, nCount: Integer): array of Tl2Live;
var
ResultList: Array of Tl2Live;
i, nCounter: Integer;
oTarget: Tl2Live;
begin
  SetLength(ResultList, nCount);
  nCounter := 0;
  for i := 0 to NpcList.Count - 1 do begin
    oTarget := NpcList.Items(i);
	if (oTarget = nil)
    or not (oTarget.Id = NpcId)
    or (oTarget.Dead) then Continue;
	ResultList[nCounter] := oTarget;
	Inc(nCounter);
	if (nCounter = nCount) then break;
  end;
  
  if not (nCounter = 4) then begin
    for i := nCounter to 3 do begin
      ResultList[nCounter] := nil;
    end;	
  end;
 
  result := ResultList;
end;

function DoesArrayContainNil(List: Array of Tl2Live): boolean;
var
i: Integer;
begin
  for i := 0 to Length(List)-1 do begin
    if (List[i] = nil) then begin
	  result := false;
	  Exit;
	end;
  end;
  result := true;
end;


function KillMob(oTarget: Tl2Live): Boolean;
var
nCounter: Integer;
begin
	result := false;
	nCounter := 0;
	while not oTarget.Dead do begin 
		Engine.CancelTarget;
		Engine.SetTarget(oTarget);
		if (User.DistTo(oTarget) > 400) then
			Engine.MoveToTarget(-200);
	  
		if (User.DistTo(oTarget) < 900)  then
			UseAttackSkill;
	  
		Delay(500);
		Inc(nCounter);
	  
		if (nCounter > 70) or (User.Dead) then begin
			result := false;
			Engine.FaceControl(0, False);
			Exit;
		end;
  
	end; 
	Engine.FaceControl(0, False);
	result := true;
end;

function UseAttackSkill: Void;
//checked
var
nCounter: Integer;
oSkill: Tl2Skill;
begin
  nCounter := 0;

 while not User.InCombat do begin  
  
  if (SkillList.ByID(1230, oSkill)) then 
    Engine.UseSkill(1230)
  else if (SkillList.ByID(1235, oSkill)) then 
    Engine.UseSkill(1235)
  else if (SkillList.ByID(1239, oSkill)) then 
    Engine.UseSkill(1239)
  else if (SkillList.ByID(1148, oSkill)) then 
    Engine.UseSkill(1148)
  else if (SkillList.ByID(1530, oSkill)) then 
    Engine.UseSkill(1530)
  else if (SkillList.ByID(1436, oSkill)) then 
    Engine.UseSkill(1436)
  else if (SkillList.ByID(1245, oSkill)) then 
    Engine.UseSkill(1245)
  else 
    Engine.Attack;
  Delay(200);
  Inc(nCounter);
  if (nCounter > 40) then begin
	Exit;
  end; 
 end;  
 
 Engine.FaceControl(0, True);
 
end;

function DoQuest: Void;
var
QuestStage: Integer;
begin 
  QuestStage := GetQuestStage;
  
  if (QuestStage = 40) then Exit; 
  
  
  
  case QuestStage of 
    0: DoStage0;
    1: DoStage1;
    2: DoStage2;
    3: DoStage3;
    4: DoStage4;
    5: DoStage5;
    6: DoStage6;
    7: DoStage7;
    8: DoStage8;
    9: DoStage9;
    10: DoStage10;
    11: DoStage11;
    12: DoStage12;
    13: DoStage13;
    14: DoStage14;
    15: DoStage15;
    16: DoStage16;
    17: DoStage17;
    18: DoStage18;
    19: DoStage19;
    20: DoStage20;
    21: DoStage21;
    22: DoStage22;
    23: DoStage23;
    24: DoStage24;
    25: DoStage25;
    26: DoStage26;
    27: DoStage27;
    28: DoStage28;
    29: DoStage29;
    30: DoStage30;
    31: DoStage31;
    32: DoStage32;
    33: DoStage33;
    34: DoStage34;
    35: DoStage35;
    36: DoStage36;
    37: DoStage37;
    38: DoStage38;
    39: DoStage39;
  end;
end;


function IsTimeToRebuff: Boolean;
var
i, countOfLowTimeBuffs: Integer;
oBuff : Tl2Buff;
begin
	result := false;
	
	if (User.Buffs.Count < 15) then begin
		result := true;
		exit;
	end;

	countOfLowTimeBuffs := 0;
	
	for i := 0 to User.Buffs.Count - 1 do begin
		oBuff := User.Buffs.Items(i);
		if (oBuff = nil) then continue;
			
		if (oBuff.EndTime < 1200) then begin
			Inc(countOfLowTimeBuffs);
		end;
	end;

	if (countOfLowTimeBuffs > 15) then result := true;
end;


procedure CheckPlayersAround;
var
i: Integer;
oTarget: Tl2Char;
begin
	Print('Check for players started');
	while not User.Noble do begin
		for i := 0 to Charlist.Count - 1 do begin
			oTarget := Charlist.Items(i);
			if (oTarget = nil) or (User.DistTo(oTarget) > 50000) then continue;
			if (oTarget.Target = User) then begin
				Print('Warning, we are being targetted by: ' + oTarget.Name);
				Engine.BlinkWindow();
				Delay(10000);
			end;
		
		end;
		Delay(1000);
	end;
end;

begin
  EndQuestStage := 40;
  Quest1Id := 241;
  Quest2Id := 242;
  Quest3Id := 246;
  Quest4Id := 247;
  InitializeVariables;
  
  cLoadConfig('auto_noble.xml');
  Script.NewThread(@CheckPlayersAround);
  while not (User.Noble) do begin
  
	if (User.Dead) then begin
		Engine.GoHome();
		Delay(10000);
	end;
	if (IsTimeToRebuff) then wrap_DoRebuff;
  
    DoQuest;
	Delay(1000);  
  end;
end.







