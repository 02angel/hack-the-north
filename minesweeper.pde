//constants

final int maxCell = 20;
final int cellSize = 30;
final int uncoverColour[] = {251, 247, 252}; //R: 197 G: 187 B: 202
final int coveredColour[] = {197, 187, 202};
final int maxMines = 60;
final int rowOffset = 100;
final int gameInit = 0;
final int gamePlaying = 1;
final int gameFailed = 2;
final int gameWon = 3;
//cell status
final int cellInit = 0;
final int cellMined = 1;
final int cellNotmined = 2;

Cell [][] allCells = new Cell [28][28];
int iGameStatus = 0 ; //0 = init, 1 = playing, 3 = game failed, 4 = win

void setup () {
  background (175, 173, 175);
  size (600, 700);
}
void buryMine()
{
  int iRandom, i = 0, iColumn, iRow;
  
  do {
    iRandom = (int)random(maxCell * maxCell - 1);
    iColumn = iRandom % maxCell;
    iRow = iRandom / maxCell;
    println("iRandom = " + iRandom + "iColumn = " + iColumn + "iRow = " + iRow);
    if (!allCells[iRow][iColumn].hasMine()){
      allCells[iRow][iColumn].buryMine(true);
      displayNumber(iRow, iColumn, 'X');
      i ++;
    }
    
  }while(i < maxMines);
}
int sumNeighbor(int col, int row)
{
  int i, j;
  int x, y, count = 0;
  
  x = col - 1;
  y = row - 1;
  println("start col=" + col + " row=" + row + " x=" + x + " y= " + y);
 // x = ((col - 1) < 0) ? 0 : (col - 1);
 // y = ((row - 1) < 0) ? 0 : (row - 1);
 // imaxCol = ((x + 3) < MAX_CELL) ? 3 : MAX_CELL - x - 1;
  //imaxRow = ((y + 3) < MAX_CELL) ? 3 : MAX_CELL - y - 1;
  for (i = 0; i < 3; i ++){
    for (j = 0; j < 3; j ++){
      println("i=" + i + " j=" + j + " x=" + (x + i) + " y= " + (y + j));
      if ( ((x + i) >= 0) && ((y + j) >= 0) && (((x + i) != col) || ((y + j) != row)) && ((x + i) < maxCell) && ((y + j) < maxCell)) {
        println(" x + i=" + (x + i)+ " y + j=" + (y + j));
        if (allCells[x + i][y + j].hasMine()){
          count ++;
        }
        println("count = " + count);
      }
    }
  }
  return count;
}
void displayNumber(int iCol, int iRow, char c)
{
  int fColPix, fRoePix;

  String strChar = str(c);
  fColPix = iCol * cellSize;
  fRoePix = (iRow + 1) * cellSize + rowOffset;
  
  textSize(32);
  fill(0, 102, 153);
  text(strChar, fColPix, fRoePix); 
}
void displayNumber(int iCol, int iRow, int number)
{
  String strNumber;
  int fColPix, fRowPix;
  
  strNumber = str(number);
  fColPix = iCol * cellSize;
  fRowPix = (iRow + 1) * cellSize  + rowOffset;
  
  textSize(32);
  switch(number){
    case 1:
     fill(252, 8, 16);
     break;
    case 2:
     fill(248, 252, 8);
     break;
    case 3:
     fill(186, 8, 252);
     break;
    case 4:
     fill(72, 8, 252);
     break;
    case 5:
     fill(8, 252, 250);
     break;
    case 6:
     fill(8, 252, 74);
     break;
    case 7:
     fill(252, 8, 44);
     break;
    case 8:
     fill(125, 225, 8);
     break;
      
  }
//  fill(0, 102, 153);
  text(strNumber, fColPix, fRowPix); 
}
void didplayFlag(int iCol, int iRow)
{
  int fColPix, fRowPix;
  

  fColPix = iCol * cellSize;
  fRowPix = iRow * cellSize  + rowOffset;
  fill(250, 0, 0);
  rect(fColPix + 5, fRowPix + 5, 5, 20);
  triangle(fColPix + 10, fRowPix + 5, fColPix + 25, fRowPix + 15, fColPix + 10, fRowPix + 15);
}
void initField()
{
//  int iCollum = 0, iRow = 0;
  
  for (int i = 0; i < maxCell; i ++){
    for (int j = 0; j < maxCell; j ++){
      int iCount = sumNeighbor(i, j);
      allCells[i][j].setAroundMines(iCount);
      if ((iCount > 0) && !allCells[i][j].hasMine())
        displayNumber(i, j, iCount);
    }
    
  }
  
}
void clearArea(int iCol, int iRow)
{
  int x, y;
  ArrayList<Cell> uncehckedCell = new ArrayList<Cell>();
  
  x = iCol - 1;
  y = iRow - 1;
  println("start col=" + iCol + " row=" + iCol + " x=" + x + " y= " + y);

  if (allCells[iCol][iRow].getAroundMines() > 0){
    openCell(iCol, iRow); 
    displayNumber(iCol, iRow, allCells[iCol][iRow].getAroundMines());
    allCells[iCol][iRow].setCellStatus(cellNotmined);
    return;
  }
  for (int i = 0; i < 3; i ++){
    for (int j = 0; j < 3; j ++){
      if ( ((x + i) >= 0) && ((y + j) >= 0) && ((x + i) < maxCell) && ((y + j) < maxCell)) {
        if ((allCells[x + i][y + j].getCellStatus() == cellInit) && (!allCells[x + i][y + j].hasMine())){
          println("open cell x=" + (x+i) + " y = " + (y + j));
          openCell(x + i, y + j);    
          if ((allCells[x + i][y + j].getAroundMines() == 0)
            && (allCells[x + i][y + j].getCellStatus() == cellInit)){
            uncehckedCell.add(allCells[x + i][y + j]);
          }else {
            println("diplay " + allCells[x + i][y + j].getAroundMines() + "x = " + (x+ i) + " y = " + (y + j)); 
             displayNumber(x + i, y + j, allCells[x + i][y + j].getAroundMines());
          }
          allCells[x + i][y + j].setCellStatus(cellNotmined);
        }
      }
    }
  }
  for (int i = 0; i < uncehckedCell.size(); i ++){
    Cell tmpCell = uncehckedCell.get(i);
    clearArea(tmpCell.getColumn(), tmpCell.getRow());
  }
}
void mouseClicked()
{
  int iTblx, iTbly;
  
  iTblx = mouseX / cellSize;
  iTbly = (mouseY - rowOffset) / cellSize;
  if ((iTblx < 0) || (iTbly < 0)){
    return;
  }
  println("mouseClicked mouseX=" + mouseX + " mouseY= " + mouseY);
  println("mouseClicked x=" + iTblx + " y= " + iTbly);
  if (mouseButton == LEFT) { //uncover
    if (allCells[iTblx][iTbly].hasMine()){
      iGameStatus = gameFailed;
    }else {
      if (allCells[iTblx][iTbly].getCellStatus() == cellInit)
        clearArea(iTblx, iTbly);
    }
  } else if (mouseButton == RIGHT) { //lable as mine
    allCells[iTblx][iTbly].setCellStatus(cellMined);
    didplayFlag(iTblx, iTbly);
  } 
}
void openCell(int iCol, int irow)
{
    fill (uncoverColour[0], uncoverColour[1], uncoverColour[2]);
    rect (iCol * cellSize, rowOffset + irow * cellSize, cellSize, cellSize);
  
}
void draw () {
  //grid 
  if (iGameStatus == gameFailed)
  println("iGameStatus = " + iGameStatus); 
  switch (iGameStatus){
    case gameInit:
      for (int x = 0; x < maxCell; x ++) {
        for (int y = 0; y < maxCell; y ++) {
          fill (coveredColour[0], coveredColour[1], coveredColour[2]);
 //         if ((y % 2) >0)
   //         fill (UNCOVER_COLOR[0], UNCOVER_COLOR[1], UNCOVER_COLOR[2]);
          rect (x * cellSize, rowOffset + y * cellSize, cellSize, cellSize);
          allCells[x][y] = new Cell(x, y);
        }
      }
      buryMine();
      initField();
//      openCell(1, 1);
      didplayFlag(1, 1);
      iGameStatus = gamePlaying;
      break;
    case gamePlaying:
      break;
    case gameFailed:
      text("failed", 50, 50); 
      
      break;
    case gameWon:
      break;
  }
  displayNumber(3, 0, 5);

} 

class Cell{
  int  iTblx, iTbly;
  boolean bMine; 
  int iCount;
  int iStatus;
  
  Cell(int iCol, int iRow){
    
    iTblx = iCol;
    iTbly = iRow;
    bMine = false;
    iCount = 0;
    iStatus = cellInit;
    
  }
  void buryMine(boolean stat){
    bMine = stat;
  }
  boolean hasMine()
  {
    return bMine;
  }
  void setAroundMines(int count)
  {
    iCount = count;
  }
  int getAroundMines()
  {
    return iCount;
  }
  void setCellStatus(int status)
  {
    iStatus = status;
  }
  int getCellStatus()
  {
    return iStatus;
  }
  int getColumn()
  {
    return iTblx;
  }
  int getRow()
  {
    return iTbly;
  }
}
