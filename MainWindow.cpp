#include "MainWindow.h"
#include <QDebug>
#include <QString>


MainWindow::MainWindow(QObject *parent):QObject(parent)
{

}

void MainWindow::get_salary(QString salary)
{
    Salary = salary.toInt();
}

void MainWindow::get_pension(QString pension)
{
    Pension = pension.toInt();
    //qDebug()<<pension;
}

void MainWindow::get_atp(QString atp)
{
    ATP = atp.toInt();
}

void MainWindow::get_fradrag(QString fradrag)
{
    Fradrag = fradrag.toInt();
    //qDebug()<<fradrag;
}

void MainWindow::count_wage()

{
    if (Salary <= Fradrag){
        outcom = (Salary - ATP - Pension)*0.92;
    }
    else if (Salary*0.92<588900/12){

        outcom = 0.57*(Salary-ATP-Pension)+0.38*Fradrag;
    }
    else{
        outcom = 0.48*(Salary-ATP-Pension)+0.48*Fradrag;
    }

ferie = Salary*0.125 - Salary*0.125*0.08 - Salary*0.125*0.38;


Outcom = QString::number(outcom);
Ferie_money = QString::number(ferie);
qDebug()<< "---->" << Outcom << typeid(Outcom).name();;
qDebug()<<"-------------------";

emit emitSignal(Outcom);
emit emitSignal2(Ferie_money);
}

void MainWindow::reset(){
    Salary = 0;
    Pension = 0;
    ATP = 0;
    Fradrag = 0;
    outcom = 0;
    ferie = 0;
}
