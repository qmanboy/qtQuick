#include "mainwindow.h"
#include "ui_mainwindow.h"

constexpr int fixedMainHeight = 600;
constexpr int fixedMainWidth = 480;
constexpr int animDuration = 10;
constexpr int animErrorOffset = 10;

#define LOGIN "login"
#define PASSWORD "password"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->setFixedSize(fixedMainWidth, fixedMainHeight);
    mW = new QWidget(this);
    login = new QLineEdit(mW);
    pass = new QLineEdit(mW);
    pass->setEchoMode(QLineEdit::Password);
    sign = new QPushButton(mW);

    layout = new QBoxLayout(QBoxLayout::TopToBottom, mW);
    layout2 = new QBoxLayout(QBoxLayout::LeftToRight);
    layout3 = new QBoxLayout(QBoxLayout::TopToBottom);

    layout->addLayout(layout2, Qt::AlignCenter);
    layout2->addLayout(layout3, Qt::AlignCenter);

    layout3->addWidget(login, Qt::AlignCenter);
    layout3->addWidget(pass, Qt::AlignCenter);
    layout3->addWidget(sign, Qt::AlignCenter);

    QFont font;
    font.setPointSize(12);
    login->setFont(font);
    pass->setFont(font);

    connect(sign, &QPushButton::clicked, this, &MainWindow::onSignClicked);
    sign->setText("Войти");

    this->formPosition(fixedMainWidth, fixedMainHeight, mW, login, pass, sign, 0);
    mW->show();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::onSignClicked()
{
    if (login->text() == LOGIN && pass->text() == PASSWORD)
        startGoodAnimation();
    else
        startBadAnimation();
}

void MainWindow::welcome()
{
    QMessageBox msgBox;
    msgBox.setText("Welcome!");
    if (msgBox.exec())
        qApp->closeAllWindows();
}

void MainWindow::formPosition(int w, int h, QWidget *wid, QLineEdit *log, QLineEdit *pas, QPushButton* but, int animationOffset)
{
    int he = h/2;
    int wi = w/2;
    int x = w - (w/4 * 3) + animationOffset;
    int y = h - (h/4 * 3);
    wid->setGeometry(x,y, wi, he);

    log->setSizePolicy(QSizePolicy::Maximum, QSizePolicy::Maximum);
    log->setMinimumSize(wi/4*3, (he - 24)/6);

    pas->setSizePolicy(QSizePolicy::Maximum, QSizePolicy::Maximum);
    pas->setMinimumSize(wi/4*3, (he-24)/6);

    but->setSizePolicy(QSizePolicy::Maximum, QSizePolicy::Maximum);
    but->setMinimumSize(wi/4*3, (he-24)/6);



}

void MainWindow::startBadAnimation()
{
    if (login->text() != LOGIN)
    {
        login->setStyleSheet("color: red;");
    }
    if (pass->text() != PASSWORD)
    {
        pass->setStyleSheet("color: red;");
    }
    QTimer::singleShot(1000, this, [this]{
                                        login->setStyleSheet("color: black;");
                                        pass->setStyleSheet("color: black;");
    });

    QTimer *timer2 = new QTimer(this);
    connect(this, &MainWindow::stopTimer, timer2, &QTimer::stop);
    connect(this, &MainWindow::stopTimer, this, [this]{ animOffset = 0;
                                                        upFlag = false;
                                                        this->formPosition(fixedMainWidth, fixedMainHeight, mW, login, pass, sign, animOffset);});
    connect(timer2, &QTimer::timeout, this, [this]{
        if (upFlag && animOffset != animErrorOffset)
            this->formPosition(fixedMainWidth, fixedMainHeight, mW, login, pass, sign, animOffset++);
        else
            if (animOffset == animErrorOffset)
                emit stopTimer();
            else
            {
                this->formPosition(fixedMainWidth, fixedMainHeight, mW, login, pass, sign, animOffset--);
                if (abs(animOffset) == animErrorOffset)
                    upFlag = true;
            }

        });
    timer2->start(animDuration);
}

void MainWindow::startGoodAnimation()
{
    QGraphicsOpacityEffect* opacityEffect = new QGraphicsOpacityEffect(this);
    QTimer *timer = new QTimer(this);
    connect(this, &MainWindow::stopTimer, timer, &QTimer::stop);
    connect(this, &MainWindow::stopTimer, this, &MainWindow::welcome);
    connect(timer, &QTimer::timeout, this, [opacityEffect, this]{
            if (opacityCounter <= 0)
                emit stopTimer();
            else
            {
                opacityEffect->setOpacity(qreal(opacityCounter--)/100);
                mW->setGraphicsEffect(opacityEffect);
            }
        });
    timer->start(animDuration);
}

