while(true) do 
    if gg.isVisible(true) then 
        menuk = 1
        menuk2 = 2  
        gg.setVisible(false) 
    end

    START = 1 
    function START() 
        menu = gg.choice({
            'Mover habitats y edificios sin restricción 🪁',
            'Ventaja de cruces al 9999 📈 (visual)',
            'Reenviar dragon sin tener una copia 🔂',
            'Batallas (Arenas) 🏆',
            '❎ SALIR ❎'
        }, Last, 'Recopilacion de Script por LARUTAN v25.9.0')
        if menu == 1 then code2() end
        if menu == 2 then code3() end
        if menu == 3 then code4() end
        if menu == 4 then batallas() end
        if menu == 5 then os.exit() end
        if menu == nil then noselect() end 
        menuk =-1
    end 

    function code2() 
        menu2 =  gg.choice({
            '1. Mover habitats y edificios (sin restricción 1) 🪁',
            '2. Mover habitats y edificios (sin restricción 2) 🪁',
            '↩️ Atras ↩️',
        }, nil,
        'Primero seleccionar cualquier habitat y luego escoger una opcion (reiniciar juego de ser necesario): ')
        
        if menu2 == 1 then MAP1() end
        if menu2 == 2 then MAP2() end
        if menu2 == 3 then START() end
        if menu2 == nil then noselect() end 
    end

    function MAP1()
        gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
        gg.searchNumber("1117126656;1086324736::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        gg.refineNumber("1086324736", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
        gg.editAll("0", gg.TYPE_DWORD)
        gg.refineNumber("999998", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        gg.clearResults()
    end

    function MAP2()
        gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
        gg.searchNumber("1086324736", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        gg.refineNumber("1086324736", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        revert = gg.getResults(5000, nil, nil, nil, nil, nil, nil, nil, nil)
        gg.editAll("0", gg.TYPE_DWORD)
        gg.refineNumber("999998", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        gg.clearResults()
    end

    function code3()
        gg.alert("Por lo menos un dragon debe tener una ventaja de cruce minimo")
        gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
        gg.searchNumber("39;1~10;0;1::15", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("39;1~10::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1~10", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.getResults(500)
        gg.editAll("9999", gg.TYPE_DWORD)
        gg.refineNumber("999998", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.clearResults()
    end

    function code4()
        gg.alert("TENER UN DRAGON FUEGO POR LO MENOS 🔥")
        gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
        gg.searchNumber("1;1020;420", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1020", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local numero = gg.prompt({"Por favor, ingrese el ID del dragon que desea reenviar (EL ID LO PUEDE ENCONTRAR EN LA PAGINA DE DITLEP https://www.ditlep.com/code)"}, {[1] = 0}, {[1] = "number"})
        if numero == nil then
            print("No se ingresó ningún número")
            return
        end
        local resultados = gg.getResults(20)
        for i, v in ipairs(resultados) do
            v.value = numero[1]
            resultados[i] = v
        end
        gg.setValues(resultados)
        gg.refineNumber("999998", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.clearResults()
        gg.alert("¡¡Si desea introducir otro ID 🔄 REINICIE 🔄 el juego por favor!!")
    end

    fin_busc = 1
    local point = nil

    function batallas()
        if fin_busc == 0 then 
            menuk = -1 
            change_yisus()
        else
            gg.toast("Ingresar el nivel y estrellas de los 2 primeros dragones rivales\nSi funciona en otro tipo de batallas hagannos saberlo por favor")
            local input1 = gg.prompt(
                {"NIVEL DRAGON 1","NIVEL DRAGON 2","ESTRELLAS DRAGON 1","ESTRELLAS DRAGON 2"}, 
                {nil,nil,nil,nil}, 
                {'number','number','number','number'}
            )
            if input1 == nil then 
                menuk = -1 
                START()
            else
                gg.clearResults()
                gg.searchNumber("1000~5600;"..input1[1]..";"..input1[3]..";1000~5600;"..input1[2]..";"..input1[4].."::93", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
                gg.refineNumber("1000~5600;"..input1[1]..";"..input1[3]..";1000~5600;"..input1[2].."::73", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
                gg.refineNumber("1000~5600;"..input1[1]..";"..input1[3]..";1000~5600::69", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
                gg.refineNumber("1000~5600;"..input1[1]..";"..input1[3].."::25", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
                gg.refineNumber("1000~5600;"..input1[1].."::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
                point = gg.getResults(1)
                gg.clearResults()
                fin_busc = 0
                change_yisus()
            end
        end
    end

    function change_yisus()
        if point and #point > 0 then
            gg.setValues({{address=point[1].address+0 , flags=4, value=1011}})
            gg.setValues({{address=point[1].address+0x4 , flags=4, value=5}})
            gg.setValues({{address=point[1].address+0x44 , flags=4, value=1011}})
            gg.setValues({{address=point[1].address+0x48 , flags=4, value=5}})
            gg.setValues({{address=point[1].address+0x88 , flags=4, value=1011}})
            gg.setValues({{address=point[1].address+0x8C , flags=4, value=5}})
            gg.toast('¡MAS VICTORIAS aplicado!')
        else
            gg.toast('No se encontraron resultados para MAS VICTORIAS')
        end
        fin_busc = 1
    end

    function noselect() 
        gg.isVisible(true)
        gg.toast('Diviértete') 
    end

    if menuk == 1 then START() end 
end

