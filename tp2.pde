int var1=0;
int var2=0;
int var3=0;
int var4=0;


void setup(){
size(800,600);
background(170);
}

void draw (){
 for(var1=0; var1<12; var1 ++){
  for (var2=0; var2<15; var2 = var2 + 1){
    fill (0);
    rect(var2*60, var1*60, 51, 51);
  }
for(var3=0; var3<12; var3++){
  for(var4=0; var4<15; var4= var4 + 1){
    fill(255);
    ellipse(var4*59, var3*59, 16, 16);
  }
  }
}
}
