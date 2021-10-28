// Project: jogo_snake 
// Created: 2021-02-09

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Snake" )

SetWindowSize( 900, 800, 0 )
SetVirtualResolution (720,560)
//SetDisplayAspect ( 480.0/480.0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

/* //Tentativa de rodar a cobra
LoadImage(2,"Snake.png")
CreateSprite(2,2)
SetSpritePosition(2,160,240)
SetSpriteAnimation(2,44,42,3)
PlaySprite(2,3,1,1,2)
*/


//Tela de fundo
CreateSprite(LoadImage("grass.png"))
	
//Carregando as músicas
LoadSound(001,"Comendo.wav")
LoadSound(002,"PowerUp.wav")
LoadMusic(003,"Fundo.wav")

PlayMusic(003,1)

//Testando com uma sprite genérica
CreateImageColor(1,120,55,213,255)
CreateSprite(1,1)
SetSpriteSize(1,30,30)
SetSpritePosition(1,330,270)

//Sprites de posições aleatórias
sprite1 = LoadImage("ComidaBoa.png")
sprite2 = LoadImage("ComidaRuim.png")
sprite3 = LoadImage("PowerUp1.png")
sprite4 = LoadImage("PowerUp2.png")
sprite5 = LoadImage("Wood.jpg")
sprite6 = LoadImage("Wood2.jpg")


comida_boa = CreateSprite(sprite1)
SetSpriteSize(comida_boa,30,30)
SetSpriteShape(comida_boa,3)
SetSpritePosition(comida_boa,400,270)

comida_ruim = CreateSprite(sprite2)
SetSpriteSize(comida_ruim,30,30)
SetSpriteShape(comida_ruim,3)
SetSpritePosition(comida_ruim,250,270)

power_up1 = CreateSprite(sprite3)   //velocidade
SetSpriteSize(power_up1,30,30)
SetSpriteShape(power_up1,3)
SetSpritePosition(power_up1,154,360)
SetSpriteVisible(power_up1,0) //esconde a sprite

power_up2 = CreateSprite(sprite4)
SetSpriteSize(power_up2,30,30)
SetSpriteShape(power_up2,3)
SetSpritePosition(power_up2,460,222)

bloco = CreateSprite(sprite5)
SetSpriteSize(bloco,30,560)
SetSpriteShape(bloco,2)

bloco2 = CreateSprite(sprite5)
SetSpriteSize(bloco2,30,560)
SetSpriteShape(bloco2,2)
SetSpritePosition(bloco2,690,0)

bloco3 = CreateSprite(sprite6)
SetSpriteSize(bloco3,660,30)
SetSpriteShape(bloco3,2)
SetSpritePosition(bloco3,30,530)

bloco4 = CreateSprite(sprite6)
SetSpriteSize(bloco4,660,30)
SetSpriteShape(bloco4,2)
SetSpritePosition(bloco4,30,0)


pontos as float = 0.0

do
		
	//calculando a pontuação
    
	printC("Pontuação: ")
	printC(pontos)
   
    	
		//print(Timer())
		

	//colocando em variável eu deixo o movimento ficar continuo ao clique
	x# = GetSpriteX(1)
    y# = GetSpriteY(1)
	//print(x#)
	//print(y#)
	
	
    // Esquerda
    if GetRawKeyState ( 37 )
        SetSpritePosition ( 1, GetSpriteX( 1 ) - 2, GetSpriteY( 1 ) + 0 )
    endIf

    // Cima
    if GetRawKeyState ( 38 )
        SetSpritePosition ( 1, GetSpriteX( 1 ) + 0, GetSpriteY( 1 ) - 2)
    endIf

    // Direita
    if GetRawKeyState( 39 )
        SetSpritePosition ( 1, GetSpriteX( 1 ) + 2, GetSpriteY( 1 ) + 0 )
    endIf

    // Baixo
    if GetRawKeyState ( 40 )
        SetSpritePosition ( 1, GetSpriteX( 1 ) + 0, GetSpriteY( 1 ) + 2 )
    endIf

	//Definições da comida boa em posições aleatórias e com colisões
	
		//SetSpritePosition(comida_boa,Tvariavel,WVariavel)
	if GetSpriteCollision(1,comida_boa) //= 1
		PlaySound(001)
		
		//SetSpritePosition(comida_boa,X,Y)
		X = Random(30,660)
		Y = Random(30,500)
		SetSpritePosition(comida_boa,X,Y)
		pontos = pontos + 10
		
	endif
	
	//Definições da comida ruim em posições aleatórias e com colisões
			
		//SetSpritePosition(comida_ruim,Xvariavel,ZVariavel)
	if (GetSpriteCollision(1,comida_ruim)) //or (Mod(Timer(),100) and Timer() <> 0)) //= 1
		PlaySound(001)
		
		//SetSpritePosition(comida_ruim,U,T)
		U = Random(30,660)
		T = Random(30,500)
		SetSpritePosition(comida_ruim,U,T)
		pontos = pontos - 10
		
	endif
	
	//Definição do primeiro power up
	//Definição da aleatoriedade conforme a pontuação
	if (Mod(pontos,30) = 0 and pontos <> 0)
		//SetSpritePosition(power_up1,Avariavel,BVariavel)
		SetSpriteVisible(power_up1,1)	// 1 para mostrar a sprite
		
		
			if GetSpriteCollision(1,power_up1) //= 1
				//StopMusic(003)
				
				PlaySound(002,50) // slot,volume


				//SetSpritePosition(power_up1,W,V)
				W = Random(30,660)
				V = Random(30,500)
				SetSpritePosition(power_up1,W,V)
				//pontos = pontos + 1
				
			endif
			
		else
			//Aqui coloco para não ser mostrado a sprite, quando a pontuação é zero e nem quando o valor dos pontos é divisível por x
			SetSpriteVisible(power_up1,0)
			
	endif
	
	if(Mod(pontos,110) = 0 and pontos <> 0)
		SetSpriteVisible(power_up2,1)
		
			if GetSpriteCollision(1,power_up2) //= 1
				PlayMusic(002)
				
				//SetSpritePosition(power_up2,A,B)
				
				A = Random(30,660)
				B = Random(30,500)
				SetSpritePosition(power_up2,A,B)
				//pontos = pontos + 1
				
			endif
		else
			SetSpriteVisible(power_up2,0)	
	endif
    Sync()
    
    
   
    if GetSpriteCollision(1,bloco) or GetSpriteCollision(1,bloco2) or GetSpriteCollision(1,bloco3) or GetSpriteCollision(1,bloco4)
		end
	endif
	
	


loop


// -----------Ainda a ser analisado e implementado -------------
	    //cobra
	//Colocar a cobra
	//Aumentar e diminuir o tamanho da cobra
	//Colidir com a própria cobra

//Colocar as músicas >>>>>>>>sound e music

//efeitos dos power up's


