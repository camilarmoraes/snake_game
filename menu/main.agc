//Opções de tela
SetWindowTitle( "Menu" )
SetWindowSize( 840, 720, 0 )
SetWindowAllowResize( 1 )


//CreateSprite(100,LoadImage("back.png"))

//Carregando músicas
LoadMusic(0001,"Comendo.wav")
LoadMusic(0002,"PowerUp.wav")
LoadMusic(0003,"Fundo.wav")
	
//Criando um título 
CreateText(1,"Bem Vindo ao Menu de jogo!")
SetTextSize(1,6)
SetTextPosition(1,18,10)

CreateText(2,".Clique nas opções para acessar o conteúdo")
SetTextSize(2,4)
SetTextPosition(2,10,25)

//Criando texto para as opções
CreateText(3,"Músicas")
SetTextSize(3,5)
SetTextPosition(3,12,41)

CreateText(4,"Sprites")
SetTextSize(4,5)
SetTextPosition(4,12,56)
	
	//sprites de seleção
	imag1 = LoadImage("EnBallBlue.png")
	imag2 = LoadImage("EnBallPurp.png")
	
	
	CreateSprite(11,imag1)
	CreateSprite(12,imag2)
	

	SetSpriteSize(11,5,6)
	SetSpriteSize(12,5,6)
	

	SetSpritePosition(11,5,40)
	SetSpritePosition(12,5,55)
	
do
	
	//Se houver clique do mouse, o programa vai capturar em qual sprite 
	//foi o clique, e retornar o seu valor memória
	if ( GetPointerPressed ( ) = 1 )
        sprite= GetSpriteHit ( GetPointerX ( ), GetPointerY ( ) )
        
       
        //Quando o clique do mouse retornar o valor 11, carrega outras 3 sprites de seleção,
        //e clicando em cada uma delas, ativa a música correspondente.
        
        if(sprite = 11)
			
			imag3 = LoadImage("EggBlue.png")
			imag4 = LoadImage("EggGreen.png")
			imag5 = LoadImage("EggPurp.png")
			
			CreateSprite(40,imag3)
			CreateSprite(50,imag4)
			CreateSprite(60,imag5)
			
			SetSpriteSize(40,5,6)
			SetSpriteSize(50,5,6)
			SetSpriteSize(60,5,6)
			
			SetSpritePosition(40,50,40)
			SetSpritePosition(50,50,50)
			SetSpritePosition(60,50,60)
			
				CreateText(5,"Som de comer")
				SetTextSize(5,5)
				SetTextPosition(5,56,41)
				SetTextColor(5,156,120,53,255)
				
				CreateText(6,"Música de Power Up")
				SetTextSize(6,5)
				SetTextPosition(6,56,51)
				SetTextColor(6,135,12,164,255)
				
				CreateText(7,"Música de Fundo")
				SetTextSize(7,5)
				SetTextPosition(7,56,61)
				SetTextColor(7,23,220,50,255)
				
		endif
				if ( GetPointerPressed ( ) = 1 )
					som= GetSpriteHit ( GetPointerX ( ), GetPointerY ( ) )
						if(som = 40)
							PlayMusic(0001)
						endif
						if(som = 50)
							PlayMusic(0002)
						endif
						if(som = 60)
							PlayMusic(0003)
						endif
				endif
			
			
		endif
		//Quando retornar o valor 12, entrará na função para mostrar a segunda tela, com as sprites.
		//Enquanto dsliga alguma música que ainda esteja tocando.
		 if (sprite = 12)
			 StopMusic()
			trocaTela1()   
        endif

	
	sync()
loop

function trocaTela1()
	DeleteSprite(11)
	DeleteSprite(12)
	DeleteSprite(13)
	DeleteSprite(40)
	DeleteSprite(50)
	DeleteSprite(60)
	
	
	DeleteText(1)
	DeleteText(2)
	DeleteText(3)
	DeleteText(4)
	DeleteText(5)
	DeleteText(6)
	DeleteText(7)
	
	CreateText(010,"-----Sprites-----")
	SetTextSize(010,6)
	
	
	CreateText(011,"Cobra")
	SetTextSize(011,5)
	SetTextPosition(011,35,30)
	
	CreateText(012,"Alimentos")
	SetTextSize(012,5)
	SetTextPosition(012,30,51)

	CreateText(013,"Power Up's")
	SetTextSize(013,5)
	SetTextPosition(013,30,66)
	
	CreateText(014,"Plano de Fundo")
	SetTextSize(014,5)
	SetTextPosition(014,30,82)
	
	cobra = LoadImage("Snake.png")
	comida1 = LoadImage("ComidaBoa.png")
	comida2 = LoadImage("ComidaRuim.png")
	powerup1 = LoadImage("PowerUp1.png")
	powerup2 = LoadImage("PowerUp2.png")
	planodefundo = LoadImage("Cenario.png")
	
	CreateSprite(001,cobra)
	CreateSprite(002,comida1)
	CreateSprite(003,comida2)
	CreateSprite(004,powerup1)
	CreateSprite(005,powerup2)
	CreateSprite(006,planodefundo)
	
	SetSpriteSize(001,20,20)
	SetSpriteSize(002,5,6)
	SetSpriteSize(003,5,6)
	SetSpriteSize(004,5,6)
	SetSpriteSize(005,5,6)
	SetSpriteSize(006,10,12)
    
	
	SetSpritePosition(001,10,20)
	SetSpriteposition(002,10,50)
	SetSpritePosition(003,20,50)
	SetSpritePosition(004,10,65)
	SetSpritePosition(005,20,65)
	SetSpritePosition(006,12,80)
	
	
	
		
endfunction 


