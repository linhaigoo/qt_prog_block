#include "backend.h"

#include "Windows.h"

#include "QDebug"

backend::backend(QObject *parent) : QObject(parent)
{
    UserName = "name";
}

QString backend::getUserName()
{
    return UserName;
}

QString backend::getUserPasswd()
{
    return QString("");
}

bool backend::setUserName(QString name)
{
    return true;
}

bool backend::setUserPasswd(QString passwd)
{
    return true;
}

bool backend::updateUserInfo()
{
    return true;
}
bool backend::authentication()
{
    return true;
}

void backend::readUsersInfo()
{

}


bool backend::timeChecker()
{
    return CheckState;
}

void backend::timeChecker(bool state)
{
    if(state == true)
    {
        CheckState = false;
        HWND hwnd = FindWindowA("WeChatMainWndForPC","WeChat");
        if (hwnd != nullptr)
        {
            qDebug("found grab cad\n");
            if(IsIconic(hwnd))
            {
                qDebug()<<"miniature\n";
            }
            else if(IsWindowVisible(hwnd))
            {
                qDebug("normal size\n");
                CheckState = true;

                RECT rect;
                GetWindowRect(hwnd,&rect);
                m_block = QRect(rect.left,rect.top,rect.right - rect.left,rect.bottom - rect.top);
            }

        }
//        emit BlockStatusChanged();
    }
}

QRect backend::blockRect()
{
    return m_block;
}
