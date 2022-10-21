#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPainter>
#include <QTimer>
#include <QMessageBox>
#include <QDebug>
#include <QLineEdit>
#include <QPushButton>
#include <QBoxLayout>
#include <QGraphicsOpacityEffect>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

signals:
    void stopTimer();

private slots:
    void onSignClicked();
    void welcome();

private:
    Ui::MainWindow *ui;
    int opacityCounter{100};
    int animOffset{};
    bool upFlag{false};

    QWidget *mW{nullptr};
    QLineEdit *login{nullptr};
    QLineEdit *pass{nullptr};
    QPushButton *sign{nullptr};

    QBoxLayout* layout{nullptr};
    QBoxLayout* layout2{nullptr};
    QBoxLayout* layout3{nullptr};

    void formPosition(int w, int h, QWidget *wid, QLineEdit *log, QLineEdit *pas, QPushButton* but, int animationOffset);
    void startBadAnimation();
    void startGoodAnimation();
};
#endif // MAINWINDOW_H
