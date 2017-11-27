var
i: Integer;

begin
	while true do begin
		for i := 0 to NpcList.Count - 1 do begin
			mob := npclist.items(i);
			if not (mob = nil) then begin
				if (mob.Cast.EndTime > 0) then begin
					if (mob.Cast.Name = 'Bloody Blades') then begin
						Print('Bloody Blades ID = ' + IntToStr(mob.Cast.ID)); 
					end;
				end;
			end;
		end;
		delay(500);
	end;


end.