#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QRect>

class backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString UserName READ getUserName WRITE setUserName)
    Q_PROPERTY(QString UserPasswd READ getUserPasswd WRITE setUserPasswd)
    Q_PROPERTY(bool TimeChecker READ timeChecker WRITE timeChecker NOTIFY BlockStatusChanged)
    Q_PROPERTY(QRect BlockRect READ blockRect)
public:
    explicit backend(QObject *parent = nullptr);

    QString getUserName();
    QString getUserPasswd();
    bool setUserName(QString name);
    bool setUserPasswd(QString passwd);
    bool updateUserInfo();
    bool authentication();

    bool timeChecker();
    void timeChecker(bool state);

    QRect blockRect();

private:
    QString UserName;
    QString UserPasswd;
    bool CheckState;
    QRect m_block;

    void readUsersInfo();

signals:
    void BlockStatusChanged();

public slots:
};

#endif // BACKEND_H
