import controlP5.*;
PImage mariposa;
//Tabla --------------------------------------
Table tabla; //guarda los datos del mapa
Table tablaDos; 
Table tablaTres; 
Table tablaCuatro; 
Table tablaCinco; 
int rowCount; //cuenta el numero de filas
int filasDos;

float sizeCube = 200;
String [] tiempo;
int cubies2G;
int [] movil2G;
//dinamico --------------------------------------
ControlP5 cp5;
int valSlider; //el valor en donde se encuentra el slider
int [] anio; //variable que guarda toda la información de la columna del año

//variables que guardan toda la información de las localidades
int [] usaquen;
int [] chapinero;
int [] santaFe;
int [] sanCristobal;
int [] usme;
int [] tunjuelito;
int [] bosa;
int [] kennedy;
int [] fontibon;
int [] engativa;
int [] suba;
int [] teusaquillo;
int [] barriosUnidos;
int [] martires;
int [] antoniNarino;
int [] puenteAranda;
int [] candelaria;
int [] rafaelUribe;
int [] ciudadBolivar;
int [] sumapaz;

//octavo
Slider2D sliderPunto;

//mariposa -----------------------------------------
PImage mapaImage; // mariposa imagen
// ubicacion de los circulos
float x = 0;
float y = 0;
float diametro = 100; //diametro de los circulos
float dataMinColumna2 = 0; //minimo
float dataMaxColumna2 = 0; //maximo



String [] localidades;
// partes 3D


//posición de los cubos pequeños
float[]x2G;
float[]y2G;
float[]z2G;

//velocidad de movimiento de los cubos pequeños
float[]xSpeed2G;
float[]ySpeed2G;
float[]zSpeed2G;

//rotación de los cubos pequeños
float[]xRot2G;
float[]yRot2G;
float[]zRot2G;

//segundo
//variable que guarda el numero de suscriptores 2G, respecto a la fecha elegida con el slider
int dato2G;
//variable para que salgan del centro los cubos pequeños, cada que se mueve el slider
boolean unaVez2G = false;
int numFrames = 24;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup() {
  size(1920, 1080,P3D);  
   frameRate(300);
  
    mariposa = loadImage("img.png");
  tabla = loadTable("localidades.csv");
  tablaDos = loadTable("localidadesDos.csv", "header");
  tablaTres = loadTable("suicidioHoM.csv", "header");
  
  images[0]  = loadImage("mariposa_00000.png");
  images[1]  = loadImage("mariposa_00001.png"); 
  images[2]  = loadImage("mariposa_00002.png");
  images[3]  = loadImage("mariposa_00003.png"); 
  images[4]  = loadImage("mariposa_00004.png");
  images[5]  = loadImage("mariposa_00005.png"); 
  images[6]  = loadImage("mariposa_00006.png");
  images[7]  = loadImage("mariposa_00007.png"); 
  images[8]  = loadImage("mariposa_00008.png");
  images[9]  = loadImage("mariposa_00009.png"); 
  images[10] = loadImage("mariposa_00010.png");
  images[11] = loadImage("mariposa_00011.png");  
  images[12] = loadImage("mariposa_00012.png"); 
  images[13] = loadImage("mariposa_00013.png"); 
  images[14] = loadImage("mariposa_00014.png"); 
  images[15] = loadImage("mariposa_00015.png"); 
  images[16] = loadImage("mariposa_00016.png"); 
  images[17] = loadImage("mariposa_00017.png"); 
  images[18] = loadImage("mariposa_00018.png"); 
   images[19] = loadImage("mariposa_00019.png"); 
   images[20] = loadImage("mariposa_00020.png"); 
   images[21] = loadImage("mariposa_00021.png"); 
   images[22] = loadImage("mariposa_00022.png"); 
   images[23] = loadImage("mariposa_00023.png"); 
  


  // da el numero de filas del archivo
  rowCount = tabla.getRowCount();
  filasDos = tablaDos.getRowCount();
 
  

  cp5 = new ControlP5(this); 
 gui();

  anio = new int [filasDos];

  usaquen = new int [filasDos]; 
  chapinero = new int [filasDos];
  santaFe= new int [filasDos];
  sanCristobal= new int [filasDos];
  usme= new int [filasDos];
  tunjuelito = new int [filasDos];
  bosa= new int [filasDos];
  kennedy = new int [filasDos];
  fontibon= new int [filasDos];
  engativa= new int [filasDos];
  suba= new int [filasDos];
  teusaquillo= new int [filasDos];
  barriosUnidos = new int [filasDos];
  martires= new int [filasDos];
  antoniNarino= new int [filasDos];
  puenteAranda= new int [filasDos];
  candelaria= new int [filasDos];
  rafaelUribe= new int [filasDos];
  ciudadBolivar= new int [filasDos];
  sumapaz= new int [filasDos];

  //recorre el archivo Localidades DOS
  for (int i = 0; i < filasDos; i++) 
  {
    TableRow row = tablaDos.getRow(i);

    anio[i] = row.getInt("año");
    usaquen[i] = row.getInt("Usaquén");
    chapinero[i] = row.getInt("Chapinero");
    santaFe[i] = row.getInt("Santa Fe");
    sanCristobal[i] = row.getInt("San Cristobal");
    usme[i] = row.getInt("Usme");
    tunjuelito[i] = row.getInt("Tunjuelito");
    bosa[i] = row.getInt("Bosa");
    kennedy[i] = row.getInt("Kennedy");
    fontibon[i] = row.getInt("Fontibón");
    engativa[i] = row.getInt("Engativá");
    suba[i] = row.getInt("Suba");
    teusaquillo[i] = row.getInt("Teusaquillo");
    barriosUnidos[i] = row.getInt("Barrios Unidos");
    martires[i] = row.getInt("Los Mártires");
    antoniNarino[i] = row.getInt("Antonio Nariño");
    puenteAranda[i] = row.getInt("Puente Aranda");
    candelaria[i] = row.getInt("Candelaria");
    rafaelUribe[i] = row.getInt("Rafael Uribe Uribe");
    ciudadBolivar[i] = row.getInt("Ciudad Bolívar");
    sumapaz[i] = row.getInt("Sumapaz");
  }

 
}

void draw() {

  background(255); 
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
 // image(images[frame], 0, 0);
 
  //cuarto
  
  for (int i = 0; i < cubies2G; i++)
  {
    pushMatrix();
      //ubica los cubos pequeños en el centro
      translate(x2G[i], y2G[i], z2G[i]);
      
      //genera la rotación a cada cubo pequeño
      rotateX(frameCount*PI/xRot2G[i]);
      rotateY(frameCount*PI/yRot2G[i]);
      rotateX(frameCount*PI/zRot2G[i]);
      
      //dibuja los cubos de color rojo y de tamaño de 10
      fill(255,0,0);
      noStroke();
      box(10);
        
      //genera el movimiento de loscubos con su respectiva velocidad  
      x2G[i] += xSpeed2G[i];
      y2G[i] += ySpeed2G[i];
      z2G[i] += zSpeed2G[i];
    popMatrix();


}

 
 porcentaje();
  }




  image(mariposa,0,0,1920,1080);
  fill(#214BEA);
   textSize(35);
  text("SUICIDIO EN BOGOTÁ", 780, 60);
   textSize(23);
      //Condición USAQUEN
   if (sliderPunto.getArrayValue()[0] <=47) // X
  {
    if (sliderPunto.getArrayValue()[1] <=26 )// Y
    {
      fill(#FFFEFC); //azul
      text("Nº de Casos en usaquen : " + usaquen[valSlider], 1585, 978);
       fill(#2D11ED);
    ellipse(355,365, usaquen[valSlider], usaquen[valSlider]);//,width/4,height/4,4,s,s);
    ellipse(345,293, usaquen[valSlider], usaquen[valSlider]);
    ellipse(400,298, usaquen[valSlider], usaquen[valSlider]);
    ellipse(440,350, usaquen[valSlider], usaquen[valSlider]);
    ellipse(395,350, usaquen[valSlider], usaquen[valSlider]);
    ellipse(530,417, usaquen[valSlider], usaquen[valSlider]);
    ellipse(460,430, usaquen[valSlider], usaquen[valSlider]);
    ellipse(410,440, usaquen[valSlider], usaquen[valSlider]);
    ellipse(480,499, usaquen[valSlider], usaquen[valSlider]);
    ellipse(530,499, usaquen[valSlider], usaquen[valSlider]);
    }
  } else {
   // fill(#F73434);
 // ellipse(220, 220, usaquen[valSlider], usaquen[valSlider]);
  }

  //Condición CHAPINERO
 if (sliderPunto.getArrayValue()[0] <=70 && sliderPunto.getArrayValue()[0] >=47) // X
  {
    if (sliderPunto.getArrayValue()[1] <=36 && sliderPunto.getArrayValue()[1] >= 26 )// Y
    {
      fill(#FFFEFC);
      text("Nº de Casos en Chapinero : " + chapinero[valSlider],  1573, 950);
      fill(#4A65F5);
      ellipse(610,610, chapinero[valSlider], chapinero[valSlider]);
      ellipse(650,620, chapinero[valSlider], chapinero[valSlider]);
      ellipse(605,660, chapinero[valSlider], chapinero[valSlider]);
      ellipse(630,670, chapinero[valSlider], chapinero[valSlider]);
      ellipse(690,620, chapinero[valSlider], chapinero[valSlider]);
      ellipse(700,700, chapinero[valSlider], chapinero[valSlider]);
      ellipse(740,620, chapinero[valSlider], chapinero[valSlider]);
      ellipse(760,655, chapinero[valSlider], chapinero[valSlider]);
      ellipse(660,710, chapinero[valSlider], chapinero[valSlider]);
      ellipse(740,680, chapinero[valSlider], chapinero[valSlider]);
    }
  } else {
    //fill(#E57BA2);
   // ellipse(320, 249, chapinero[valSlider], chapinero[valSlider]);
  }

  //Condición SANTAFE
  if (sliderPunto.getArrayValue()[0] <=91 && sliderPunto.getArrayValue()[0] >=70) // X
  {
    if (sliderPunto.getArrayValue()[1] <=47 && sliderPunto.getArrayValue()[1] >= 36)// Y
    {
      fill(#FFFEFC);
      text("Nº de Casos en Santa fé : " + santaFe[valSlider],  1573, 930);
      fill(#6177F0);
      ellipse(580,725, santaFe[valSlider], santaFe[valSlider]);
      ellipse(560,740, santaFe[valSlider], santaFe[valSlider]);
      ellipse(540,755, santaFe[valSlider], santaFe[valSlider]);
      ellipse(576,770, santaFe[valSlider], santaFe[valSlider]);
      ellipse(550,800, santaFe[valSlider], santaFe[valSlider]);
      ellipse(520,820, santaFe[valSlider], santaFe[valSlider]);
      ellipse(565,855, santaFe[valSlider], santaFe[valSlider]);
      ellipse(580,830, santaFe[valSlider], santaFe[valSlider]);
      ellipse(610,800, santaFe[valSlider], santaFe[valSlider]);
      ellipse(610,820, santaFe[valSlider], santaFe[valSlider]);
    }
  } else {
    //fill(#E57BA2);
  //  ellipse(408, 260, santaFe[valSlider], santaFe[valSlider]);
  }

  //Condición CANDELARIA
//  if (sliderPunto.getArrayValue()[0] <=79 && sliderPunto.getArrayValue()[0] >=91) // X
///// {
  //  if (sliderPunto.getArrayValue()[1] <=23 && sliderPunto.getArrayValue()[1] >= 47)// Y
    {
 //fill(#FFFEFC);
      //text("Nº de Casos en Candelaria : " + candelaria[valSlider], 1573, 760);
     //fill(#0AAEF7);
  //  ellipse(1000, 272, candelaria[valSlider], candelaria[valSlider]);
  //  } } else {
   //fill(#ffcba6);
   // ellipse(422, 272, candelaria[valSlider], candelaria[valSlider]);
  }

  //Condición SUBA
 if (sliderPunto.getArrayValue()[0] <=39 && sliderPunto.getArrayValue()[0] >=20) // X
  {
  if (sliderPunto.getArrayValue()[1] <=53 && sliderPunto.getArrayValue()[1] >= 20)// Y
    {
     fill(#FFFEFC);
      text("Nº de Casos en Suba : " + suba[valSlider], 1573, 875);
      fill(#3A9CF0);
      ellipse(1455, 360, suba[valSlider], suba[valSlider]);
      ellipse(1333, 360, suba[valSlider], suba[valSlider]);
      ellipse(1555, 354, suba[valSlider], suba[valSlider]);
      ellipse(1222, 400, suba[valSlider], suba[valSlider]);
      ellipse(1410, 425, suba[valSlider], suba[valSlider]);
      ellipse(1500, 425, suba[valSlider], suba[valSlider]);
      ellipse(1455, 425, suba[valSlider], suba[valSlider]);
      ellipse(1333, 475, suba[valSlider], suba[valSlider]);
      ellipse(1380, 485, suba[valSlider], suba[valSlider]);
      ellipse(1440, 495, suba[valSlider], suba[valSlider]);
          
   }
  } else {
   // fill(#ffcba6);
   // ellipse(203, 272, suba[valSlider], suba[valSlider]);
  }

  //Condición ENGATIVA
  if (sliderPunto.getArrayValue()[0] <=52 && sliderPunto.getArrayValue()[0] >=40) // X
  {
    if (sliderPunto.getArrayValue()[1] <=73 && sliderPunto.getArrayValue()[1] >= 60)// Y
    {
     fill(#FFFEFC);
      text("Nº de Casos en Engativá : " + engativa[valSlider],  1573, 900);
      fill(#124774);
      ellipse(1160, 610, engativa[valSlider], engativa[valSlider]);
      ellipse(1260, 610, engativa[valSlider], engativa[valSlider]);
      ellipse(1230, 610, engativa[valSlider], engativa[valSlider]);
      ellipse(1270, 660, engativa[valSlider], engativa[valSlider]);
      ellipse(1310, 680, engativa[valSlider], engativa[valSlider]);
      ellipse(1160, 665, engativa[valSlider], engativa[valSlider]);
      ellipse(1190, 680, engativa[valSlider], engativa[valSlider]);
      ellipse(1230, 690, engativa[valSlider], engativa[valSlider]);
      ellipse(1190, 710, engativa[valSlider], engativa[valSlider]);
      ellipse(1250, 730, engativa[valSlider], engativa[valSlider]);
       
    }
  } else {
  //  fill(#ffcba6);
   // ellipse(252, 324, engativa[valSlider], engativa[valSlider]);
  }

  //Condición FONTIBON
  if (sliderPunto.getArrayValue()[0] <=55 && sliderPunto.getArrayValue()[0] >=45) // X
  {
    if (sliderPunto.getArrayValue()[1] <=83 && sliderPunto.getArrayValue()[1] >= 73)// Y
    {
   fill(#FFFEFC);
      text("Nº de Casos en  Fontibón : " + fontibon[valSlider], 1573, 850);
      fill(#E57BA2);
     ellipse(1235, 800, fontibon[valSlider], fontibon[valSlider]);
     ellipse(1250, 830, fontibon[valSlider], fontibon[valSlider]);
     ellipse(1260, 800, fontibon[valSlider], fontibon[valSlider]);
     ellipse(1260, 850, fontibon[valSlider], fontibon[valSlider]);
     ellipse(1270, 870, fontibon[valSlider], fontibon[valSlider]);
     ellipse(1270, 830, fontibon[valSlider], fontibon[valSlider]);
     ellipse(1275, 850, fontibon[valSlider], fontibon[valSlider]);
     ellipse(1285, 870, fontibon[valSlider], fontibon[valSlider]);
     ellipse(1295, 890, fontibon[valSlider], fontibon[valSlider]);
     ellipse(1275, 895, fontibon[valSlider], fontibon[valSlider]);
    }
  } else {
   // fill(#E57BA2);
  //  ellipse(258, 391, fontibon[valSlider], fontibon[valSlider]);
  }

  //Condición BARRIOS UNIDOS
  if (sliderPunto.getArrayValue()[0] <=48 && sliderPunto.getArrayValue()[0] >=38) // X
  {
   if (sliderPunto.getArrayValue()[1] <=44 && sliderPunto.getArrayValue()[1] >= 33)// Y
    {
      fill(#FFFEFC);
      text("Nº de Casos en  Barrios Unidos : " + barriosUnidos[valSlider], 1535, 1020);
      fill(#3377a4);
      ellipse(555,855, barriosUnidos[valSlider], barriosUnidos[valSlider]);
      ellipse(576,855, barriosUnidos[valSlider], barriosUnidos[valSlider]);
      ellipse(585,810, barriosUnidos[valSlider], barriosUnidos[valSlider]);
      ellipse(610,810, barriosUnidos[valSlider], barriosUnidos[valSlider]);
      ellipse(610,830, barriosUnidos[valSlider], barriosUnidos[valSlider]);
      ellipse(585,830, barriosUnidos[valSlider], barriosUnidos[valSlider]);
      ellipse(585,865, barriosUnidos[valSlider], barriosUnidos[valSlider]);
      ellipse(550,880, barriosUnidos[valSlider], barriosUnidos[valSlider]);
      ellipse(600,855, barriosUnidos[valSlider], barriosUnidos[valSlider]);
      ellipse(530,880, barriosUnidos[valSlider], barriosUnidos[valSlider]);
    }
  } else {
   // fill(#ffcba6);
  //  ellipse(286, 279, barriosUnidos[valSlider], barriosUnidos[valSlider]);
  }

  //Condición TEUSAQUILLO
  if (sliderPunto.getArrayValue()[0] <=57 && sliderPunto.getArrayValue()[0] >=47) // X
  {
    if (sliderPunto.getArrayValue()[1] <=52 && sliderPunto.getArrayValue()[1] >= 42)// Y
    {
    fill(#FFFEFC);
      text("Nº de Casos en  Teusaquillo : " + teusaquillo[valSlider], 1530, 998);
   fill(#36BAF5);
      ellipse(500, 301, teusaquillo[valSlider], teusaquillo[valSlider]);
      ellipse(520, 330, teusaquillo[valSlider], teusaquillo[valSlider]);
      ellipse(550, 320, teusaquillo[valSlider], teusaquillo[valSlider]);
      ellipse(570, 340, teusaquillo[valSlider], teusaquillo[valSlider]);
      ellipse(590, 360, teusaquillo[valSlider], teusaquillo[valSlider]);
      ellipse(610, 380, teusaquillo[valSlider], teusaquillo[valSlider]);
      ellipse(630, 350, teusaquillo[valSlider], teusaquillo[valSlider]);
      ellipse(650, 370, teusaquillo[valSlider], teusaquillo[valSlider]);
      ellipse(680, 380, teusaquillo[valSlider], teusaquillo[valSlider]);
      ellipse(700, 400, teusaquillo[valSlider], teusaquillo[valSlider]);
    }
  } else {
   // fill(#ffcba6);
    //ellipse(334, 301, teusaquillo[valSlider], teusaquillo[valSlider]);
  }

  //Condición MARTIRES
  if (sliderPunto.getArrayValue()[0] <=71 && sliderPunto.getArrayValue()[0] >=55) // X
  {
    if (sliderPunto.getArrayValue()[1] <=55 && sliderPunto.getArrayValue()[1] >= 45)// Y
    {
      fill(#FFFEFC);
      text("Nº de Casos en  Mártires : " + martires[valSlider],1580, 975);
     fill(#71C6ED);
    ellipse(1120, 650, martires[valSlider], martires[valSlider]);
    ellipse(1160, 670, martires[valSlider], martires[valSlider]);
    ellipse(1190, 665, martires[valSlider], martires[valSlider]);
    ellipse(1125, 675, martires[valSlider], martires[valSlider]); 
    ellipse(1140, 650, martires[valSlider], martires[valSlider]);
    }
  } else {
   // fill(#ffcba6);
   // ellipse(394, 317, martires[valSlider], martires[valSlider]);
  }
   //Condición KENNEDY
  if (sliderPunto.getArrayValue()[0] <=69 && sliderPunto.getArrayValue()[0] >=59) // X
  {
    if (sliderPunto.getArrayValue()[1] <=82 && sliderPunto.getArrayValue()[1] >= 72)// Y
    {
     fill(#FFFEFC);
      text("Nº de Casos en  Kennedy : " + kennedy[valSlider],1530, 998);
     fill(#0AAEF7);
     ellipse(710, 711, kennedy[valSlider], kennedy[valSlider]);
     ellipse(720, 670, kennedy[valSlider], kennedy[valSlider]);
     ellipse(755, 670, kennedy[valSlider], kennedy[valSlider]);
     ellipse(788, 670, kennedy[valSlider], kennedy[valSlider]);
     ellipse(745, 698, kennedy[valSlider], kennedy[valSlider]);
     ellipse(670, 711, kennedy[valSlider], kennedy[valSlider]);
    }
  } else {
   // fill(#ffcba6);
   // ellipse(353, 411, kennedy[valSlider], kennedy[valSlider]);
  }

  

  //Condición Ciudad Bolivar
  if (sliderPunto.getArrayValue()[0] <=95 && sliderPunto.getArrayValue()[0] >=85) // X
  {
    if (sliderPunto.getArrayValue()[1] <=76 && sliderPunto.getArrayValue()[1] >= 66)// Y
    {
     fill(#FFFEFC);
      text("Nº de Casos en Ciudad Bolivar: " + ciudadBolivar[valSlider],1530, 998);
      fill(#34ABBF);
    ellipse(440, 690, ciudadBolivar[valSlider], ciudadBolivar[valSlider]);
    ellipse(470, 700, ciudadBolivar[valSlider], ciudadBolivar[valSlider]);
    ellipse(460, 720, ciudadBolivar[valSlider], ciudadBolivar[valSlider]);
    
    }
  } else {
   
  
  void porcentaje() 
{
  //println(valSlider); 
  for (int i = 0; i < filasDos; i++)
  { 
    float x = map(i, 0, filasDos-1, 1050, 598);
  
    textSize(12); 
    pushMatrix();
    translate(x, 610);
    rotate(PI/2);
    fill(#FFFEFC);
    text(anio[i], -498, -130);
    popMatrix();
  }
 
}

void gui()
{
  //slider 
  cp5.addSlider("valSlider")
    .setPosition(724, 85) // punto en el que inicia un slider
    .setWidth(465) //tamaño
    .setRange(0, filasDos-1) // valor de cada  linea  ---|----|----|
    .setValue(0)// valor en la que empieza la visualizacion
    .setNumberOfTickMarks(filasDos) // numero de divisiones ---|----|----|
    .setSliderMode(Slider.FLEXIBLE) // tipo de visualizacion otra es FIX
    ;

//  fill(#002b5a);
  //PUNTO
  sliderPunto = cp5.addSlider2D("punto")
    .setPosition(30, 645)
    .setSize(137, 102)
    .setMinMax(20, 10, 100, 100)
    .setValue(50, 50)
    ;

}
