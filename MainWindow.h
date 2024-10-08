#ifndef MAINWINDOW_H
#define MAINWINDOW_H


#include <QObject>
#include <QQmlComponent>
#include <QQmlEngine>

class MainWindow : public QObject
{
    Q_OBJECT

public:
    explicit MainWindow(QObject* parent=nullptr);
    //Q_INVOKABLE void addRectangle(QObject *parent);

signals:
    void emitSignal(QString Outcom);
    void emitSignal2(QString Ferie_money);

public slots:
    void get_salary(QString salary);
    void get_pension(QString pension);
    void get_atp(QString atp);
    void get_fradrag(QString fradrag);
    void count_wage();
    void reset();

private:
    QQmlEngine engine;
    QString salary;
    QString pension;
    QString atp;
    QString fradrag;
    QString Outcom;
    QString Ferie_money;

    double outcom;
    double ferie;

    int Salary = 0;
    int Pension = 0;
    int ATP = 0;
    int Fradrag = 0;


};



#endif // MAINWINDOW_H
