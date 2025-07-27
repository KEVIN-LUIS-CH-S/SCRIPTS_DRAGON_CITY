gg.clearResults()
while(true) do 
  if gg.isVisible(true) then 
    menuk = 1
    gg.setVisible(false) 
  end 
  START = 1 

  function START() 
  menu =  gg.choice({

      '1. NIVELES DE LAS PRUEBAS',
      '2. CAMBIAR HABILIDADES DE MI DRAGON',
      --'3. FIJAR POSICION',
      '3. ACELERAR BATALLA',
      '❌ Exit ❌',
      }
      ,nil,
     'Script para farmear orbes --RDOSK 2024')
      if menu == 1 then hab_lvl() end
      if menu == 2 then changehabs()end
      --if menu == 3 then Fijar()end
      if menu == 3 then acelerar()end
      if menu == 4 then gg.clearResults() gg.clearResults(getall) os.exit() end
      if menu == nil then noselect() end 
      menuk =-1
   end
  function changehabs()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)

    local respuesta = gg.choice({"Sí, ya lo tengo", "No, quiero detectarlo"}, nil, "¿Ya obtuviste el id secundario del dragón tierra?\n(Si no, puedes detectarlo automáticamente)")

    local id_dragon = "1011"
    local id_second = nil

    if respuesta == 1 then
        -- Usuario ya tiene el id_second, lo ingresa manualmente
        local input = gg.prompt({"Ingresa el id secundario (id_second) de tu dragón tierra:"}, nil, {"number"})
        if not input or not input[1] then
            gg.toast("Cancelado")
            return
        end
        id_second = tostring(input[1])
    elseif respuesta == 2 then
        -- Proceso automatizado para detectar id_second
        gg.searchNumber(id_dragon..";0;-1::70", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber(id_dragon..";0::10", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber(id_dragon, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local results = gg.getResults(20)
        if #results == 0 then
            gg.alert("No se encontraron resultados. Intenta de nuevo.")
            return
        end

        for i, res in ipairs(results) do
            local original = res.value
            gg.setValues({{address = res.address, flags = gg.TYPE_DWORD, value = 1015}})
            gg.toast("¿Cambió tu dragón de apariencia? (Resultado "..i..")")
            gg.sleep(2000)
            local respuesta2 = gg.choice({"Sí, es mi dragón", "No, siguiente"}, nil, "¿Cambió tu dragón de apariencia?")
            gg.setValues({{address = res.address, flags = gg.TYPE_DWORD, value = original}})
            if respuesta2 == 1 then
                local id_second_val = gg.getValues({{address = res.address + 4, flags = gg.TYPE_DWORD}})
                id_second = tostring(id_second_val[1].value)
                gg.alert("¡Listo! El id secundario (id_second) detectado es: "..id_second.."\n\nAnótalo en un bloc de notas para futuras ocasiones.")
                break
            end
        end
        if not id_second then
            gg.alert("No se pudo detectar el id secundario automáticamente.")
            return
        end
    else
        gg.toast("Cancelado")
        return
    end

    -- Continúa el proceso original usando id_dragon y id_second
    gg.searchNumber(id_dragon..";"..id_second..";0;-1::70", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    gg.refineNumber(id_dragon..";"..id_second..";0::10", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    gg.refineNumber(id_dragon..";"..id_second.."::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    gg.refineNumber(id_dragon, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

    point=gg.getResults(99)
    punto=gg.getResultsCount(point)
    select_a=0
    i_point = 1
     --________________________________________________________________________________para verificar si es
    while (select_a<=0) do
      gg.setVisible(false)
      menukito = gg.choice({'CAMBIO TU DRAGON?  -SI-',
                            'CAMBIASTE TU DRAGON? -NO-'},Last,
                            'SELECCIONA SI YA ACTUALIZASTE TU DRAGON\n' .."DRAGON "..i_point.." =TOTAL= "..punto)
      if menukito == 1 then select_a=1
        valor_hab=(gg.getValues({{address=point[i_point].address+0x24 , flags=4}}))[1].value
        gg.setValues({{address=point[i_point].address+0 , flags=4, value=id_dragon}})
        gg.addListItems(point)
      end
      if menukito == 2 then
        if (select_a==-1) then
          gg.toast('🟢Algun error ocurrio🟢') 
        else
          gg.setValues({{address=point[i_point].address+0 , flags=4, value=2522}})
          gg.sleep(3000) 
        end
        if i_point>=punto then select_a=-1  
        else
          i_point=i_point+1
        end
      end
      if menukito == nil then gg.sleep(2000) end 
   end

    gg.clearResults()
      local numerop=tonumber(id_second);
      local parteGrande = 1
      while numerop >= 10 do
          numerop = numerop / 10
          parteGrande = parteGrande * 10
      end
      print (parteGrande)
      if (parteGrande<=10000) then 
        gg.searchNumber("1000~5600;400~7000Q;0;-1::70", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1000~5600;400~7000Q;0::10", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1000~5600;400~7000Q::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1000~5600", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        getall=gg.getResults(999999)
        gg.clearResults()
      end

      if (parteGrande>=1000000000) then 
        gg.searchNumber("1000~5600;2000000000~2100000000;0;-1::70", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1000~5600;2000000000~2100000000;0::10", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1000~5600;2000000000~2100000000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1000~5600", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        getall=gg.getResults(999999)
        gg.clearResults()
      end
      --[[if (parteGrande<10000) then val_med= (numerop - (parteGrande*5)).."~"..(numerop + (parteGrande*5))  
      else val_med= (numerop - (parteGrande/10)).."~"..(numerop + (parteGrande/10)) end
      gg.searchNumber("1000~5600;"..val_med..";0;-1::70", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
      gg.refineNumber("1000~5600;"..val_med..";0::10", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
      gg.refineNumber("1000~5600;"..val_med.."::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
      gg.refineNumber("1000~5600", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
      getall=gg.getResults(999999)
      gg.clearResults()]]--
      for i,v in ipairs(getall) do
                   gg.setValues({{address=getall[i].address+0x20 , flags=4, value=valor_hab}})
                   gg.setValues({{address=getall[i].address+0x24 , flags=4, value=valor_hab}})
      end
  end

  function hab_lvl()
  	nivelito={}
    estrellitas={}
    idsito={}
    nivelito[1]="57" ------------------------------AQUI -3-
    nivelito[2]="57" ------------------------------AQUI -4-
    nivelito[3]="57" ------------------------------AQUI -5-
    estrellitas[1]="4"  ------------------------------AQUI -6-
    estrellitas[2]="4"  ------------------------------AQUI -7-
    estrellitas[3]="4"  ------------------------------AQUI -8-
    idsito[1]="2018" ------------------------------AQUI -9-
    idsito[2]="1218" ------------------------------AQUI -10-
    idsito[3]="1190" ------------------------------AQUI -11-

    gg.searchNumber(idsito[1]..";"..nivelito[1]..";"..estrellitas[1]..";1F;"..idsito[2]..";"..
      nivelito[2]..";"..estrellitas[2]..";1F;"..idsito[3]..";"..nivelito[3]..";"..estrellitas[3]..";1F::221", 
      gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

    gg.refineNumber(idsito[1]..";"..nivelito[1]..";"..estrellitas[1]..";1F;"..idsito[2]..";"..nivelito[2]..
      ";"..estrellitas[2]..";1F;"..idsito[3].."::161", 
      gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

    gg.refineNumber(idsito[1]..";"..nivelito[1]..";"..estrellitas[1]..";1F;"..idsito[2].."::81", 
      gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

    gg.refineNumber(idsito[1]..";"..nivelito[1]..";"..estrellitas[1].."::17", 
      gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

    gg.refineNumber(idsito[1]..";"..nivelito[1].."::9", 
      gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

    gg.refineNumber(idsito[1],gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    gat=gg.getResults(1000)
    --gg.clearResults()
    if gg.getResultsCount(gat)==0 then 
      print("ERROR")
      os.exit()
    end
    ia=1
    valuepoint = {}
    for i,v in ipairs(gat) do
               gg.setValues({{address=gat[i].address+0 , flags=4, value=1011}})
               gg.setValues({{address=gat[i].address+0x8 , flags=4, value=1}})
               gg.setValues({{address=gat[i].address+0x10 , flags=4, value=0}})
               gg.setValues({{address=gat[i].address+0x50 , flags=4, value=1011}})
               gg.setValues({{address=gat[i].address+0x58 , flags=4, value=1}})
               gg.setValues({{address=gat[i].address+0x60 , flags=4, value=0}})
               gg.setValues({{address=gat[i].address+0xA0 , flags=4, value=3011}}) --<<--cambiar ultimo dragon
               gg.setValues({{address=gat[i].address+0xA8 , flags=4, value=500}})
               gg.setValues({{address=gat[i].address+0xB0 , flags=4, value=0}})
               valuepoint[ia] = {}
               valuepoint[ia].address = gat[i].address + 160
               valuepoint[ia].flags = gg.TYPE_DWORD
               ia=ia+1
    end
    valuepoint = gg.getValues(valuepoint)
    gg.addListItems(valuepoint)
    gg.clearResults()
  end

  function Fijar()
	menukito = gg.choice({
		'POSICION FINAL ESTABLECIDA -🟢SI-',
	    'POSICION FINAL ESTABLECIDA -NO🟢-',
	    '❌ Exit ❌',
		}
	    ,nil,
	    'Script para FIJAR posicion')
		if menukito == 1 then 
			gg.searchNumber("1 065 353 216;1 065 353 216;1 065 353 216;1 065 353 216;-1 000 000 000~-900 000 000;1 132 920 832::73", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
			gg.refineNumber("1 065 353 216;1 065 353 216;1 065 353 216;1 065 353 216;-1 000 000 000~-900 000 000::17", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
			gg.refineNumber("-1 000 000 000~-900 000 000", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
			gat=gg.getResults(10)
			gate=gg.getResultsCount(gat)
			for i = 1,gate do
				gat[i].freeze = true
				gg.addListItems(gat)
			end
			gg.clearResults()	
			end
			
			if menukito == 2 then noselect() end
		    if menukito == 3 then START() end
		    if menukito == nil then noselect() end 
	end

	function acelerar()
	gg.clearResults()
	--gg.setRanges(4)
	gg.searchNumber("7956016061199969903", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	valuepoint = gg.getResults(1)
	valuepoint[1].address = valuepoint[1].address + 128
	valuepoint[1].flags = 16
	gg.addListItems(valuepoint)
	gg.clearResults()
	end



  function noselect() 
  gg.isVisible(true) 
  end

  if menuk == 1 then START() end 
end


