//crea una tabla que guarda los datos del archivo .csv
Table table;

//me da el valor maximo 
int maxDato;

//numero de filas en el archivo
int rowCount;

//segundo
String [] edad; 

//tercero
//creo arreglos, que guardan los valores de cada columna
int [] Kennedy;
int datoKennedy = 0;

int [] CuBolivar;
int datoCuBolivar = 0;

int [] suba;
int datosuba = 0;


void setup() 
{
  size(600, 400);

  table = loadTable("suicidioHoM-localidades.csv", "header");// nombre de las columnas 

  //numero de filas en el archivo
  rowCount = table.getRowCount();
  println(rowCount + " filas en la tabla");

  Kennedy = new int[ rowCount];
  CuBolivar = new int[ rowCount];
  suba = new int[ rowCount];
  //segundo
  edad = new String [rowCount];// arreglo


  //segundo  

  for (int i = 0; i < rowCount; i++)
  {
    //creamos un objeto que guarda la información de las filas de la tabla
    TableRow row = table.getRow(i);

    //guardamos la información de la fila "tiempo" en un arreglo
    edad[i]= row.getString("edad");

    Kennedy [i]= row .getInt ("kennedy");
    CuBolivar [i]= row .getInt ("ciudadBolivar");
    suba [i]= row .getInt ("suba");

    datoKennedy = Kennedy[i];
    if (datoKennedy > maxDato) 
    {
      maxDato = datoKennedy;
    }

 datoCuBolivar = CuBolivar[i];
    if (datoCuBolivar > maxDato) 
    {
      maxDato = datoCuBolivar;
    }
    
     datosuba = suba[i];
    if (datosuba > maxDato) 
    {
      maxDato = datosuba;
    }
   
  }  
}

 
void draw() 
{
  background(#90B2E8);
  dibujarGrafica();

}

void dibujarGrafica()
{
  noStroke();
  //fill(#B3686F);
  //rect(50, 50, 500, 300);

  fill(255);
  rect(80, 80, 450, 250);

  //lineas guia
  strokeWeight(1);
  stroke(0);

  //vertical
  for (int i = 0; i < rowCount; i++)
  {
    float x = map(i, 0,rowCount-1, 80, 500); 
    line(x, 80, x, 330);

    //color del texto - edades
    fill(0);

    //texto edades
    pushMatrix(); 
    translate(x, 340); 
    rotate(PI/2); 
    text(edad[i], 0, 0);
    popMatrix();
  }

  //horizontal
  for (int i = 0; i < maxDato; i+=1) 
  {
    float y = map(i, 0, maxDato, 80, 372);
    line(80, y, 530, y);

    //texto con el valor de cada linea
    fill(0);
    text(i, 30, y);
  }
  //kennedy
  noStroke();
  fill(#DDE339);
  for (int i = 0; i < rowCount; i++)
  {
    float x = map(i, 0,rowCount-1, 80, 500);
    float y = map(Kennedy[i], 0, maxDato, 320, 10);
    ellipse(x, y,10,10); 

  }
  //ciudad bolivar
  noStroke();
  fill(#8EE888);
  for (int i = 0; i < rowCount; i++)
  {
    float x = map(i, 0, rowCount-1,  80, 500);
    float y = map(CuBolivar[i], 0, maxDato, 320, 10);
    ellipse(x, y,10,10); 
  }
  //suba
  noStroke();
  fill(#CE39E3);
  for (int i = 0; i < rowCount; i++)
  {
    float x = map(i, 0, rowCount-1,  80, 500);
    float y = map(suba[i], 0, maxDato, 320, 10);
    ellipse(x, y,10,10); 
  }
}
