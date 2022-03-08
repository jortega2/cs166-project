COPY USR (
        userId,
        password,
        email,
    name,
    dateofbirth
    )
FROM 'usr.csv'
WITH DELIMITER ',';

COPY CONNECTION_USR (
        userId,
        connectionId,
        status
    )
FROM 'Connection.csv'
WITH DELIMITER ',';

COPY EDUCATIONAL_DETAILS (
        userId,
        instituitionName,
        major,
    degree,
    startDate,
    enddate
    )
FROM 'Edu_det.csv'
WITH DELIMITER ',';

COPY MESSAGE (
        msgId,
        senderId,
        receiverId,
    contents,
    sendTime,
    deleteStatus,
    status
    )
FROM 'Message.csv'
WITH DELIMITER ',';

COPY WORK_EXPR (
        userId,
        company,
        role,
    location,
    startDate,
    enddate
    )
FROM 'work_ex.csv'
WITH DELIMITER ',';